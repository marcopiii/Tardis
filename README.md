<p align="center" >
  <img src="https://github.com/aSlug/Tardis/blob/master/tardis_logo.png" width=400px alt="Tardis" title="Tardis">
</p>

<p align="center">
  <img src="https://img.shields.io/cocoapods/v/Tardis"/>
  <a href="https://github.com/aSlug/Tardis/blob/master/LICENSE"><img src="https://img.shields.io/github/license/aSlug/Tardis"/></a>
  <a href="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=shields"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=shields"/></a>
</p>

<p align="center" >
  A super lite chronology tracker to save and navigate application states (or any data you want).<br/>
  No dependencies, lightweight & fully portable.
<p/>

## Overview

The funcionalities of Tardis are intentionally cut to the bone to provide a basic (yet very effective) way to keep a chronology of the state in a Redux-like architecture.

__Create__ a Tardis instance

```swift
let stateTracker = Tardis<AppState>()
```

__Save___ snapshots of the application state (or any other data you want to track)

```swift
stateTracker.save(snapshot: appState)
```

Make your application __time-travel__!

```swift
if stateTracker.hasPrevious {
    appState = stateTracker.previous()
}
```

```swift
if stateTracker.hasNext {
    appState = stateTracker.next()
}
```

```swift
appState = stateTracker.oldest()
```

```swift
appState = stateTracker.latest()
```

Discard all snapshots and __restart__ with new tracking

```swift
stateTracker.reboot(with: appState)
```

And that's almost all. Check documentation comments in quick help for more details about specific functions.

## Installation
You can install Tardis using __CocoaPods__.

    use_frameworks!
    pod 'Tardis'
    
## Contribute

- If you've __found a bug__, open an issue;
- If you have a __feature request__, open an issue;
- If you __want to contribute__, submit a pull request;

## License

Tardis is available under the [MIT license](https://github.com/aSlug/Tardis/blob/master/LICENSE).