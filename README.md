
# Flutter Stash ![pull-requests-badge](https://img.shields.io/badge/pull--requests-welcome-success.svg)

> Created by Alexandre Bolot on 16/06/2019

## Table of contents

- [Project objectives](#Project-objectives)
- [Content](#Content)
    - [Flutter content](#Flutter-content)
        - [`SplashScreen`](#SplashScreen)
        - [`BubbleLoader`](#BubbleLoader)
        - [`TooltipText`](#TooltipText)
        - [`Shared`](#Shared)
        - [`FutureWidget`](#FutureWidget)
        - [`LiquidLoader`](#LiquidLoader)
        - [`SwitchWidget`](#SwitchWidget)
    - [Live Templates](#Live-Templates)
        - [`doc`](#doc)
        - [`model`](#model)
        - [`testclass`](#testclass)
        - [`view`](#view)

## Project objectives

I created this Flutter-package to gather `Widgets`, `Views` and `methods` that I frequently use between projects.

The final objective is to be able to share those classes, accept calsses from others (via `pull-requests`), in order to reduce code duplicates, endless copy-pasting between previous and new projects, and a much better maintenance.

## Content

### Flutter content

#### `SplashScreen`

This widget is used as a dynamic front page before the home page is displayed.
It allows you to perform synchronous and asynchronous tasks before automatically navigation to the home page.

The following example shows how to build a `SplashScreen` for an app called `MyApp`, perform basic asynchronous tasks (loading user preferences, obtaining a user token, etc), and then navigating to another `widget page` called `HomePage`.

```csharp
//Example :
SplashScreen(
  title: 'Welcome to MyApp',
  nextRouteName: '/HomePage',
  loadFunctions: [
    () => print('started loading stuff'),
    () async => await loadUserPreferences(),
    () async => await getUserTokenFromServer(),
    () => print('ready to go, token : ${user.token}')
  ],
);

_____________________________________________

SplashScreen(
  title: 'Welcome to MyApp',
  nextRoute: MaterialPageRoute(builder: (context)=> HomePage()),
  loadFunctions = [
    () => print('started loading stuff'),
    () async => await loadUserPreferences(),
    () async => await getUserTokenFromServer(),
    () => print('ready to go, token : ${user.token}')
  ],
);
```

---

#### `BubbleLoader`

This stateful widget is used as a custom CircularProgressIndicator

It's composed of 12 bubbles with decreasing radius, forming a circle. They simply turn in rounds until this widget is disposed.

It has only a default constructor so no parameters are needed.
Yet, I recommend to always use it in a container with a well defined `height` or `width`.

```csharp
//Example :

Container(
  width: double.infinity,
  height: 250.0,
  child: Center(
    child: Container(
     child: loader,
    ),
  ),
)
```

---

#### `TooltipText`

Simple widget used to add a Tooltip to a Text widget

This allows the user to display a tooltip message when applying a long-press on the displayed text widget.

```csharp
// Example :
TooltipText(
  text: 'This is the main displayed text',
  tooltip: 'Useful information',
);

_____________________________________________

TooltipText(
  text: 'This is the main displayed text',
  tooltip: 'Useful information',
  textAlign: TextAlign.center,
  style: TextStyle(
    fontsize: 18.0,
    fontWeight: FontWeight.bold,
  ),
);
```

---

#### `Shared`

The `shared.dart` file gathers methods for global use across your projet.

```csharp
// Returns the adequate text color to contrast
// with a given [background] Color
Color contrastOf(Color background)
```
```csharp
// Formats a given [string] to used a 'sentence' format
// 
// UPPER CASE PHRASE -> Upper case phrase
// lower case phrase -> Lower case phrase
// Mixed CASE phrase -> Mixed case phrase
String toFirstUpper(String string)
```
```csharp
// Used as a simplified reducer method
//
// Useful to simplify chained calls :
// myItems.map((item) => item.price).reduce(sum);

double sum(double a, double b)
```

---

#### `FutureWidget`

Wrapper around a FutureBuilder 

```csharp
// Example :
FutureWidget(
  future: _myFutureText,
  buider: (value) {
    return Text(value),
  },
);

_____________________________________________

FutureWidget<String>(
  future: _myFutureText,
  initialData : 'temporaryText',
  buider: (String value) {
    return Text(value),
  },
  loader: CircularProgressIndicator(),
);
```

---

#### `LiquidLoader`

Wrapper around a LiquidCircularProgressIndicator to make it auto-animated

```csharp
// Example :
LiquidLoader();

_____________________________________________

LiquidLoader(
  text: 'Loading...',
  maxHeight: 50.0,
  maxWidth: 50.0,
  backgroundColor: Colors.white,
  borderColor: Colors.blue,
  borderWidth: 2.0
);
```

---

#### `SwitchWidget`

Allows to use a switch between widget based on a give value.
The type is dynamic so you can use any of your choice 

```csharp
// Example :
SwitchWidget(
  value: 'Hello',
  cases: {
    'Hello': Text('Hello World', style: TextStyle(color: Colors.greenAccent)),
    'Bye': Text('See you soon', style: TextStyle(color: Colors.redAccent)),
  },
);
```

---

### Live Templates 

On this package's github page I also share Live Templates, which are not directly code, but can be used as code-snippets to create code skelettons faster.

They can be used by IDEs, for example JetBrains IDEs such as Android Studio or IntelliJ.

To add them, go to `Settings > Editor > Live Templates`

#### `doc`

Creates a Dart documentation pattern, [link here](https://github.com/AlexBolot/FlutterStash/blob/master/live_templates/doc.text)


```csharp
/// <br>
/// Returns the [n] first characters of a given [string]
///
/// * [n] - Number of characters to return
/// * [string] - String value to extract the characters from
///
String extract(int n, String string){
    return string.substring(0, n);
}
```

---

#### `model`

Creates a new model Class with useful methods [link here](https://github.com/AlexBolot/FlutterStash/blob/master/live_templates/model.text)

- `MyClass.fromMap(Map map)` allows to create an instance from JSON
- `Map toMap()` allows to parse this class as JSON

---

#### `testclass`

Allows to easily create a new test class.
Nothing more to say, this is not the most useful live template... [link here](https://github.com/AlexBolot/FlutterStash/blob/master/live_templates/testclass.text)

---

#### `view`

Most likely the Live Template I use the most, even more when starting a new Flutter Application !

Creates a new flutter page view [link here](https://github.com/AlexBolot/FlutterStash/blob/master/live_templates/view.text)

The name given to the `Widget` will automatically fill :
- `routeName`: used for easier access from Named-Routes navigation
- `title`: text displayed as title of this view (in the appbar)

By default a page view displays a `Scaffold` containing a centered text, with the page's name in it.

```csharp
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text(widget.title)),
    body: Container (
      child : Center (
        child : Text(widget.title),
      ),
    ),
  );
}

```