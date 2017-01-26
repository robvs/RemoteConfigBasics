# RemoteConfigBasics
Basic remote configuration setup using Firebase Remote Config

# Getting Started
Setting up Remote Configuration in your project using Firebase is fairly straightforward and easy. The web portal does a great job guiding you through the initial steps.

1. Go to [firebase.google.com](https://firebase.google.com)
1. Tap _Get Started For Free_ and follow the prompts to create a new project
  1. Tap _Create New Project_
  1. Enter your project name & tap _Create Project_
1. Once the project is created, you'll land on the Project Overview page
  1. Tap _Add Firebase To Your iOS App_
  1. Enter your app's bundle id & tap _Add App_
  1. The _GoogleService-Info.plist_ file should now be in your downloads folder. Copy it into your Xcode project.
1. Add the Firebase Core and Remote Config frameworks into your project
  - If you're using CocoaPods, add the following lines to your podfile and install
  
    pod 'Firebase/Core'
  
    pod 'Firebase/RemoteConfig'
  - If you're not using CocoaPods, you'll need to install it manually
    1. Dowload the Firebase frameworks from the [Setup page](https://firebase.google.com/docs/ios/setup) in Firebase Docs; Look for the _Integrate without CocoaPods_ section
    1. Add all framework files from the Analytics directory to your project
    1. Add the FirebaseRemoteConfig framework to your project
    1. Add Firebase.h to your project
    1. Import Firebase.h in the bridging header
    1. Add module.modulemap to your project
    1. Add the -ObjC flag to Build Settings > Linking > Other Linker Flags
1. Configure the Firebase SDK and Remote Config singleton in your app
  1. In the AppDelegate class, add the following to application(didFinishLaunchingWithOptions:)
     FIRApp.configure()
  1. Build to ensure that everything is in place
  1. Create a new Property List file named "RemoteConfigDefault.plist" (or whatever filename works for you)
  1. Add a key/value pair for a configurable element in your app (i.e. "label_1"/"This text came from the Firebase Remote Config portal.")
  1. Implement configuration, fetch and activation in you app
     - See init(), fetchRemoteValues() & activateLastFetch() in RemoteConfigManager.swift
1. Implement the configurable elements in you app
  - See references to RemoteConfigManager in HomeViewController.swift
1. Add parameters to the Firebase project console
  1. Navigate to your project's overview page, then go to Remote Config : Get Started
  1. Tap _Add Your First Parameter_
  1. Enter the same key as the plist file above and a value
  1. Publish changes

## Links
[Firebase Home](https://firebase.google.com)

[Remote Config Docs](https://firebase.google.com/docs/remote-config/)

[Remote Config on iOS](https://firebase.google.com/docs/remote-config/use-config-ios)
