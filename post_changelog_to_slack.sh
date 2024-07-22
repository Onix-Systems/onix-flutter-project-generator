#!/bin/bash

while getopts c:t: flag
do
    case "${flag}" in
        c) channel=${OPTARG};;
        t) slackToken=${OPTARG};;
    esac
done

git cliff --latest -c cliff_txt.toml -o changelog_tmp.txt
value=`cat changelog_tmp.txt`
echo "Posting change log to Channel"

jsonBody=$(jo channel="${channel}" text="${value}")

opts=(
    --header "Content-Type: application/json"
    --header "Authorization: Bearer ${slackToken}"
    --data "$jsonBody"
)

curl --location --request POST 'https://slack.com/api/chat.postMessage' "${opts[@]}"
echo "\n"
echo "Posted to channel ${channel}"
rm -f changelog_tmp.txt
echo "\n"
echo "Completed"