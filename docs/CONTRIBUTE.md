<div align="center">
<a href="https://onix-systems.com/">
    <img alt="refine logo" src="../images/banner_top.jpg">
</a>

<br/>
<br/>
</div>

# Contributing

We are following a [code of conduct](https://github.com/Onix-Systems/onix-flutter-project-generator?tab=coc-ov-file#readme) when participating in the community. Please read it before you make any contributions.

* If you plan to work on an issue, mention so in the issue page before you start working on it.
* If you plan to work on a new feature, create an issue and discuss it with other community members/maintainers.

Before fork this repository you need to know few important key points:

* This application designed to work with GitHub repos only (not tested on other repos);
* Your computer must have access to project repository (or repo should be public);


## Ways to contribute

* If you're a Onix Project Generator user and you like using our platform, don't **forget to star it on GitHub**! 🌟
* Improve the docs: Having good docs is key to a project's success. **You can make our docs the best** they need to be by **improving their quality or adding new ones**.
* We'd love to **hear your feedback**! We're always looking for ways to make Onix Project Generator better, so please **share how you use our application, what features you think we should add** via [GitHub](https://github.com/Onix-Systems/onix-flutter-project-generator/issues/new?assignees=&labels=enhancement&projects=&template=feature_request.md&title=).
* **Spread the word about the Onix Project Generator**. If you know anyone who might be interested, **please share the repository** with them. Thanks!
* We could really **use your help to make this project the best** it can be! You could develop new features or fix existing issues – **every contribution is welcome**!

## Setup you environment

To start contribution you need following setup:

* [Android Studio](https://developer.android.com/studio/install) or other IDE you prefer.
* [Flutter SDK](https://docs.flutter.dev/get-started/install) version **v3.19.6**.

When your environment is ready you can [fork the repository](https://github.com/Onix-Systems/onix-flutter-project-generator/fork).

## Cloning the repository

After you fork the Project Generator repository, you need to clone it to your local machine.

Instead of using the `Onix-Systems/onix-flutter-project-generator` repository, you should use your fork url. This way, you can push your changes to your fork and create a pull request from there.


```
git clone https://github.com/Onix-Systems/onix-flutter-project-generator.git
```

## Installing dependencies

After you clone repository you need to install the dependencies. 

Open `pubspec.yaml` file and press **Pub get** button or run following command:

```
flutter pub get
```

## Run the application

<span style="color:red">**Before you run the application you need to change `repoUrl` in `lib/core/app/app_consts.dart`
to your repository URL. If you do not do so the application will use our repository to get remote configurations (like Mason Brick)**</span>.

After you installed the dependencies and everything looks good you can run the project using **Run button** in your IDE or using the command:

```
flutter run
``` 

<span style="color:red">**If you have made changes in Mason brick make sure you pushed your changes to repository and selected actual branch in application's branch menu (to use Mason brick from that branch)**</span>.

## Application's work flow 

**To have a better understanding of what processes take place** in the project and how the project works in general, [we have prepared documentation](flows/FLOWS.md) that **describes the basic processes of the application and the flow of commands**. 


## Committing Your Work and Preparing a Pull Request

Before make a pull request be sure that:

**Project Generator code**:

* Following [Effective Dart](https://dart.dev/effective-dart) conventions.
* You have run **Optimize imports** in the `lib` folder. 
* You have run **Dart format** in the `lib` folder.
* **Dart Analysis** window does not contain any issues, warnings or hints. 

**Generated project code**:

* Following [Effective Dart](https://dart.dev/effective-dart) conventions.
* **Dart Analysis** window does not contain any issues, warnings or hints.

### Commit convention

Clear commit message is essential to keep everything clear in the development process. We are using [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) to keep our commit messages consistent.

We are expecting commit messages in following format:

```
<type>(optional scope): <description>
```

For example:

```
feat(docs): add new awesome doc
```

### Creating a Pull Request

After you commit your changes you can push your changes to your fork and [create a pull request](https://github.com/Onix-Systems/onix-flutter-project-generator/compare). 

Our team will review your changes and merge your pull request as soon as everything looks good.

We're looking forward to see your contributions! 🎉