# Flutter Stash ![pull-requests-badge](https://img.shields.io/badge/pull--requests-welcome-success.svg)

> Created by Alexandre Bolot on 16/06/2019

## What's the point ?

I created this Flutter-package to gather `Widgets`, `Views` and `methods` that I frequently use between projects.

The final objective is to be able to share those classes, accept calsses from others (via `pull-requests`), in order to reduce code duplicates, endless copy-pasting between previous and new projects, and a much better maintainance.


## What's currently available ?

### Flutter content : 

#### 1. `SplashScreen`

The `SplashScreen` widget is used as a dynamic front page before the home page is displayed.
It allows you to perform synchronous and asynchronous tasks before automatically navigatin to the home page.

The following example shows how to build a `SplashScreen` for an app clled `MyApp`, perform basic asynchronous tasks (loading user preferences, obtaining a user token, etc), and then navigating to another `widget page` called `HomePage`.

```csharp
SplashScreen(
    title = 'Welcome to MyApp',
    nextRouteName = '/HomePage',
    loadFunctions = [
        () => print('started loading stuff'),
        () async => await loadUserPreferences(),
        () async => await getUserTokenFromServer(),
        () => print('ready to go, token : ${user.token}')
    ],
);

_____________________________________________

SplashScreen(
    title = 'Welcome to MyApp',
    nextRoute: MaterialPageRoute(builder: (context)=> HomePage()),
    loadFunctions = [
        () => print('started loading stuff'),
        () async => await loadUserPreferences(),
        () async => await getUserTokenFromServer(),
        () => print('ready to go, token : ${user.token}')
    ],
);

```

#### 2. `BubbleLoader`

#### 3. `TooltipText`

#### 4. `Shared`

### Live Templates : 