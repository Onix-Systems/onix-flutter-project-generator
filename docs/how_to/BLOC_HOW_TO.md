<div align="center">
<a href="https://onix-systems.com/">
    <img alt="refine logo" src="../../images/banner_top.jpg">
</a>

<br/>
<br/>
</div>

# Custom BLoC implementation

**Generated project use custom BLoC implementation** by default. 

**But you are free to use default BLoC classes or your own implementation**.

## Base BLoC (Cubit)

Project **uses standard BloC functionality with additional extended features for more flexible usage**.

**BLoC was extended with additional streamable event for progress, errors and single time events** (Single Results).

To work with extended BLoC functionality extend your BLoC from `BaseBloc`.

### Single Results

In additions to State and Event we also using a Singe Result (SR) UI-events. 

This type of events
sends from BLoC to UI and designed to use when you need to perform one time action in UI, like show dialog, navigate to screen, etc.

Create a SR freezed based object event in your BLoC models class.

* Send SR to UI using `addSr` function;
* Use `srObserver` in widget tree or listen `singleResults` BLoC stream in `onBlocCreated` function
  of your screen state to get SR events in widget;

### Progress

You have option to use internal features to show and hide progress on screens.

* Create our custom progress object extended from `BaseProgressState` or use
  default `DefaultProgressState` to pass progress screen state.
* Use `showProgress` and `hideProgress` to show and hide progress screen.

### Errors

When you got an error as Failure object you can use internal functionality to pass errors from BLoC
to UI.

* When error occurs call `onFailure(failure)` in BLoC or Cubit;
* Listen to `_errorStreamController` in `onBlocCreated` function of your screen state to get error
  events in widget.

## Base BLoC (Cubit) State

To work with extended BLoC functionality extend your widget State from `BaseBlocState`.

* Use `buildWidget` instead regular `build` function;
* Use `onBlocCreated` to send an initial event to BLoC or listen BLoC streams;
* Override `createBloc` functions in case you not using GetIt to create BLoC instances;
* Use `blocOf(context)` to get current BLoC instance;
* Use `srObserver`, `blocBuilder` and `blocConsumer` in your widget tree to work get SR and State events.     


<br/>
<br/>

Have a question? Don't be shy to contact us via [GitHub](https://github.com/Onix-Systems/onix-flutter-project-generator/issues/new?assignees=&labels=question&projects=&template=question.md&title=Question%20about%20Onix%20Project%20Generator).