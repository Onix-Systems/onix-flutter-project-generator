# Onix Flutter Project Generator
## Intro

Every time you create a new project, you repeat the same routine steps: create a new project,
configure the basic project architecture, add the frameworks and libraries you usually use, etc.
This, of course, takes some time. But this time can be reduced!

Our team already has a good experience in Flutter development and, of course, has already formed its
own set of time-tested tools that developers use on almost every project. When creating a new
project, all the frameworks and libraries had to be added to the project every time and configured
for work - it took time.

But we found a solution, at least for ourselves.

So today, we're going to introduce you to our tool, which is designed to reduce the time it takes to
start working on a Flutter project.

Yes, maybe not everyone uses the same toolkit, but for us, it seems to be the best for development
and has proven itself very well on various types of projects.

Our basic set is: Clean Architecture, BLoC for State managing, Dio or GraphQL, ScreenUtil, Freezed,
GetIt, custom utils, helpers and wrappers and others.

## Main Features

First of all, what can our tool do?

Currently, it has the following functions:

* Creating a new project based on Clean Architecture with predefined frameworks and libraries, a name, BundleId, and other options;
* Ability to configure, enable or disable components;
* Ability to add screen stubs with a generated BLoC for the screen;
* Ability to configure the data layer using Swagger URLs;
* Ability to edit some settings of a previously created project

## Creating a project

Now, in more detail.

The first thing you will see is the screen where you need to select the park with the project. Now
we will select Generate new projects. We will talk about the other option later.

The next step is to enter the project name and package name/bundle id.
Nothing complicated.

Next, you will see a screen where you need to select the platforms of your project.

On the next screen, you can configure the project in more detail, enable or disable some components.
Let's take a closer look at each item:
Flavorize.
If enabled, the project will be configured with flavors. Dev and prod flavors are created, but if
you need additional flavors, you can add their names to the input field here, separated by a space.
To create flavors, use the flavorizer utility.
Generate signing key?
Add Android signing key generation to the project.
Will you use Sonar?
Add the Sonar configuration files to the project;
Integrate GraphQL?
Add vase classes to the project to work with Graph QL
Router.
Select the type of library for navigation (GoRouter/AutoRouter)
Localization
Select the type of localisation in the project
Theming
Select the type of work with the application theme. The option enables or disables the use of the
theme_tailor library

In the next step, you have the option to add screen stubs to your project.

For example, you already know which screens will be in the project and you have an idea of where and
what the business logic will be, where you need BLoC and where you don't.
To avoid creating them manually later, you can create a preliminary configuration of screens here.
The screen will also be added to the navigator selected in the previous step.

To add a screen, just click the Add screen button, enter the screen name (without the word
“Screen”), and choose whether you want BLoC or Cubit for the screen.

When you are done, click Continue and move on.

If you don't want to add anything, just click Continue.

Next, you will see one input field where you can paste a link to your Swagger Json.

Let's imagine that you're starting a project and the backend development is already complete,
developed by the Swagger file shared with you. All you need is to create API requests, models,
mappers, etc. based on this file. Usually, this will not take much time.

But you can save time here, too.

You can use the Swagger file url to automatically generate what you would have to create manually
anyway.

At this stage, the generator can create:
sources;
request/response models;
mappers;
entities;
repositories;

And yes, depending on the Swagger file itself, it may not always generate perfectly. But:
you can preview the result beforehand and if you don't like it, you can refuse the generation;
you can fix everything manually and it will still take much less time than if you created everything
from scratch;

If you don't want to use a Swagger URL, just click Continue.

But if you still want to try it, paste a link (for
example, https://vocadb.net/swagger/v1/swagger.json) and click Continue.

Regardless of whether you used SwaggerURL or simply clicked Continue, you will see a screen with
data components.
If a Swagger URL was entered you will see parsed contents of the Swagger file.

You will be able to see how your project data layer will look like: models, sources, repositories,
mappers will be created based on the Swagger file.

You will also have the option to add components manually, add models and their fields, and more.

Phew, finally we open the last screen. (almost)

Here, just check that everything is correct. And click Generate Project.

A window with logs describing the generation process will appear.

Wait until the generation is complete... you can have a coffee, the generator will do everything for
you.
It takes 2-4 minutes to generate.

When it's done, you'll see a completion message and buttons to open the project in Android Studio or
close the generation window.

## Project Code

So, the project has been generated, open it in your IDE, and you have a basic project ready to go.

In my case, I added a few screens to the generator and used the Swagger URL to generate the data
component.

You can see the result below. Models, sources, repositories are not stubs, they are ready-to-use
classes that implement API requests, parsing, mapping, etc.

But the most important factor in what the result will be is the Swagger file itself. It all depends
on its structure, component naming, etc. The way you see the components in Swagger is how they will
be generated.

## Modify existing project

Now let's go back to the beginning. Do you remember that on the first screen you can open an
existing project?

This only works with projects generated through this tool. But after opening an existing project,
you will have the option to add new screens, add new data components, or update the Swagger Url.

## Summary
I hope you will find this tool as useful as we did.

So give it a try and share your impressions.

The latest release can be found
here {https://github.com/Onix-Systems/onix-flutter-project-generator/releases}

And don't forget, if you find a bug, be sure to report it on our GitHub
page {https://github.com/Onix-Systems/onix-flutter-project-generator}.



