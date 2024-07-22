

# Additional scripts for the Onix Project Generator

## Post change log to Slack

Script `post_changelog_to_slack.sh` located in the root project folder.

Required tools:

* [JO](https://formulae.brew.sh/formula/johttps://formulae.brew.sh/formula/jo)
* [curl](https://everything.curl.dev/install/macos.html)

Prepare to use script: 

* Create Slack bot application and token with `chat:write` permission;
* Add you Slack bot to required chat;


Scipt command syntax:

```
sh scripts/post_changelog_to_slack.sh --c 'your_channel_id' --t 'your_slack_bot_token'
```