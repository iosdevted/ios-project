# 👨‍💻 iOS Projects

Professionally taught iOS Engineer. I have done multiple iOS applications ranging from social apps to simple views. I have been very enthusiastic and passionate about my field and exploring more and more knowledge in it.

## **Table of contents**

1. [Multilingual News](#multilingual-news)
2. [Uber Clone](#uber-clone)
3. [Real Time Chat](#real-time-chat)
4. [Twitter Clone](#twitter-clone)
5. [iOS Login Kit](#ios-login-kit)
6. [Twitter Hashtag Analytics](#twitter-hashtag-analytics)
7. [InceptionV3](#inceptionv3)
8. [SwiftUI Lego Style Loading Animation](#swiftUI-lego-style-loading-animation)
9. [Travel Application Onboarding](#travel-application-onboarding)
10. [Fashion Application Onboarding](#fashion-application-onboarding)
11. [Video Onboarding](#avfoundation-onboarding)
12. [Alamofire Weather](#afweather)
13. [RxSwift Photo Filter](https://github.com/iosdevted/ios-project/tree/master/RxPhotoFilter) / [RxNews](https://github.com/iosdevted/ios-project/tree/master/RxNews) / [RxWeather](https://github.com/iosdevted/ios-project/tree/master/RxWeather)
14. [Custom Tabs](#custom-tabs)
15. [Side Menu](#side-menu)
16. [Custom Keyboard](#custom-keyboard)
17. [Floating Button Animation](#floating-button-animation)
18. [Code Connect Custom Image View](#code-connect-custom-image-view)
19. [UICollectionView With Asynchronous Image Loading](#uicollectionview-with-asynchronous-image-loading)

## **Contents**

### Maru. <img src = "https://user-images.githubusercontent.com/50784573/116805031-7699d280-ab5e-11eb-8630-c5a50d7d8678.png" width = 50 align = right>

![Language](https://img.shields.io/badge/reactive-RxSwift-red)
![Language](https://img.shields.io/badge/Swift-5.0-ff69b4)
[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

<a href="https://apps.apple.com/us/app/multilingual-news/id1560598461" > <img src="https://raw.githubusercontent.com/younatics/MotionBook/master/Images/appstore.png" width="170" height="58"></a>

<center>
  <img src="https://user-images.githubusercontent.com/50784573/116805043-89aca280-ab5e-11eb-8f3d-70be951ce9ba.jpg"/>
</center>

This application is for busy multilingual people. Choose your languages from 12 languages and read the latest news with this one application. Keep up-to-date on the latest issues without forgetting the languages

Using Multilingual news you can read

- English
- French
- Japanese
- Korean
- Chinese
- Russian
- German
- Italian
- Portuguese
- Dutch
- Swedish
- Norwegian

on a simple and nice interface.

**Features**

- Architecture

  - MVVM Architecture

- Reactive

  - [RxSwift](https://github.com/ReactiveX/RxSwift)

- Image Cache

  - [Kingfisher](https://github.com/onevcat/Kingfisher)

- Cody Style & Convention

  - [SwiftLint](https://github.com/realm/SwiftLint)

- Database

  - [Realm](https://github.com/realm/realm-cocoa)

- UI

  - [SnapKit](https://github.com/SnapKit/SnapKit)
  - [KRProgressHUD](https://github.com/krimpedance/KRProgressHUD)
  - [M13Checkbox](https://github.com/Marxon13/M13Checkbox)

**Update**

- v1.2.1: Minor bug fixes and UI improvements.

- v1.2.0: This version introduces a new design & tab bar at the bottom of an app screen.

- v1.1.0: Replace from CoreData to Realm. This version introduces a hamburger tab giving you the ability to change the order of languages.

- v1.0.2: Minor bug fixes and UI improvements.

**Requirements**

- iOS 13.0+

**Installation**

1. Download the source code by cloning this repository
2. Sign up for [NewsAPI.org](https://newsapi.org) and get your own API Key.
3. Install the pods by running

```
pod install
```

4. Open the xcworkspace file with the latest version of Xcode

**Technical notes**

- MVVM - My preferred architecture.
    - MVVM stands for “Model View ViewModel”
    - It’s a software architecture often used by Apple developers to replace MVC. Model-View-ViewModel (MVVM) is a structural design pattern that separates objects into three distinct groups:
- Models hold application data. They’re usually structs or simple classes.
- Views display visual elements and controls on the screen. They’re typically - subclasses of UIView.
- View models transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.

![MVVM](https://user-images.githubusercontent.com/50784573/116212433-c869e380-a77f-11eb-88f0-f826c6a6ea3e.jpeg)

### [Uber Clone](https://github.com/iosdevted/uber-clone)

<center>
  <img src="https://user-images.githubusercontent.com/50784573/105034607-11cdd700-5a9d-11eb-9193-716f06837119.jpg"/>
</center>

This project is a clone of Uber which is a transportation network application using MVVM design pattern. It allows riders to submit trip request which is then routed to Uber drivers who use their own cars.

**User Types**

- Rider: You can request a ride while looking at your location (which is updated very frequently) on a map. Once you click the 'Request Ride' button, your request is stored on the online database.
- Driver: You can view available requests from other riders. Once you click on a request, you see the rider's postition relative to yours on a map. Accepting the request brings up a navigation dialog to the rider's position.

**Features**

- Geolocation, GeoFire, MapKit, CoreLocation
- MVVM Architecture
- RealTime Database Trigger
- Fully Programmatic Approach
- Clean, scalable and maintainable code.

### [Real Time Chat](https://github.com/iosdevted/real-time-chat)

<p>
  <img src="https://user-images.githubusercontent.com/50784573/104917831-4a0ae200-59d7-11eb-91d4-bd051bd011ff.gif" Height=300/>
  <img src="https://user-images.githubusercontent.com/50784573/105036159-74c06d80-5a9f-11eb-9ed1-b0dd2c712902.png" Height=300/>
  <img src="https://user-images.githubusercontent.com/50784573/105036563-fb754a80-5a9f-11eb-9182-543313c8724b.png" Height=300/>
  <img src="https://user-images.githubusercontent.com/50784573/105036568-fe703b00-5a9f-11eb-83fe-0117a5bc9841.png" Height=300/>
  <img src="https://user-images.githubusercontent.com/50784573/105036571-ffa16800-5a9f-11eb-8ba5-11e79c35b3e2.png" Height=300/>
</p>

This project is a real-time-based chat application built using MVVM design pattern and Firestore for the backend. It has a simple and interactive user interface. You just need to login/signup and you are good to go.

**Features**

- User Cloud Firestore as a backend
- MVVM Architecture
- Register and authenticate users using Firebase
- Fully Programmatic Approach
- Clean, scalable and maintainable code.

### [Twitter Clone (Uncompleted)](https://github.com/iosdevted/twitter-clone)

<img src="https://user-images.githubusercontent.com/50784573/104917842-4bd4a580-59d7-11eb-9124-c4167e4a410a.gif" Height=350/>

This is a simple ios application built using MVVM design pattern and Firebase for the backend to mimic basic design and functionality of the official Twitter app.

**Features**

- Advanced backend development and architecture skills using Firebase
- MVVM Architecture
- Implement Hashtags & Mentions
- Build a custom slide up menu with custom actions
- Fully Programmatic Approach
- Clean, scalable and maintainable code.

### [iOS Login Kit](https://github.com/iosdevted/ios-loginkit)

Boilerplate Onboarding App in Swift with Firebase & Firestore Integration and Google account login.

<p>
  <img src="https://user-images.githubusercontent.com/50784573/104917851-4ecf9600-59d7-11eb-9021-e0217a07ea1e.gif" Height=270/>
  <img src="https://user-images.githubusercontent.com/50784573/105037194-f8c72500-5aa0-11eb-8105-0426408ba1f0.png" Height=270/>
  <img src="https://user-images.githubusercontent.com/50784573/105037212-fe246f80-5aa0-11eb-8c05-497a2b0d10e4.png" Height=270/>
  <img src="https://user-images.githubusercontent.com/50784573/105037214-febd0600-5aa0-11eb-9c88-10e863289547.png" Height=270/>
  <img src="https://user-images.githubusercontent.com/50784573/105037215-ffee3300-5aa0-11eb-8b3e-5240fc2a15fa.png" Height=270/>
  <img src="https://user-images.githubusercontent.com/50784573/105037218-ffee3300-5aa0-11eb-90db-df9d76fe802c.png" Height=270/>
</p>

Start your next iOS app with this MVVM design pattern Login Kit. With fully functional features, you get everything you need for user onboarding and environment setup out of the box. If you're using Firebase as your backend server, this app template is the perfect fit for you.

**Features**

- Google Login
- Backend integration with Realtime Database and Storage
- MVVM Architecture
- Fully Programmatic Approach
- Clean, scalable and maintainable code

### [Twitter Hashtag Analytics](https://github.com/iosdevted/twitter-hashtag-analytics)

<p>
  <img src="https://user-images.githubusercontent.com/50784573/107720919-ba7af980-6d1e-11eb-8e6b-222e41e66d09.gif" Height=300/>
  <img src="https://user-images.githubusercontent.com/50784573/107720929-c2d33480-6d1e-11eb-87ea-1ed7b54ff8fd.png" Height=300/>
  <img src="https://user-images.githubusercontent.com/50784573/107720931-c36bcb00-6d1e-11eb-845c-8737ec5f14cd.png" Height=300/>
  <img src="https://user-images.githubusercontent.com/50784573/107720933-c4046180-6d1e-11eb-8a42-be81c292a9e7.png" Height=300/>
  <img src="https://user-images.githubusercontent.com/50784573/107720934-c4046180-6d1e-11eb-96bf-67c2ced21768.png" Height=300/>
</p>

 Using the Twitter API, this app examines the search term entered and shows people's perception of the search term by an emoticon in real-time. This app is based on the data which classifies text according to set {Pos, Neg, Neutral}.

**Features**

- CoreML & NLP (Natural language processing)
- Created the mlmode by using apple's CreatML
- Simplified the JSON code by SwiftyJSON
- Twitter's API & Swifter
- Clean, scalable and maintainable code

### [InceptionV3](https://github.com/iosdevted/inceptionv3-coreml)

<img src="https://user-images.githubusercontent.com/50784573/107147302-9f139580-6990-11eb-97dd-2e806705e57a.gif" Height=350/>

This is an iOS application that uses Image Classification using Neural Networks to classify different objects. The images are captured in realtime using the phone's photolibrary and the related information is displayed using Google's InceptionV3.

**Features**

- Vision
- Google InceptionV3
- Clean, scalable and maintainable code


### [SwiftUI Lego Style Loading Animation](https://github.com/iosdevted/ios-project/tree/master/SwiftUI-LegoStyleLoadingAnimation)

<img src="https://user-images.githubusercontent.com/50784573/104872391-1dcc7280-5991-11eb-8edf-b20e72ed98aa.gif"/>

This is a onboarding & loading animation using 100% SwiftUI inspired by [this post](https://thecreativedeveloper.substack.com/p/cube-loading-animation-swiftui) This box inspired loading animation designed by Chris Gannon shows a bunch of lego blocks moving around.

**Features**

- SwiftUI
- Without 3rd party library
- Clean, scalable and maintainable code

### [Travel Application Onboarding](https://github.com/iosdevted/ios-onboarding/tree/master/onboarding-1)

<div>
    <img src="https://user-images.githubusercontent.com/50784573/110328329-929d5e00-805e-11eb-83a0-e6c844060dcf.gif" height=300/>
    <img src="https://user-images.githubusercontent.com/50784573/110328650-f3c53180-805e-11eb-852c-9598716745a9.png" height=300/>
    <img src="https://user-images.githubusercontent.com/50784573/110328663-f9227c00-805e-11eb-958a-87f17c2dab59.png" height=300/>
    <img src="https://user-images.githubusercontent.com/50784573/110328670-fa53a900-805e-11eb-9a63-9b902f42bfda.png" height=300/>
    <img src="https://user-images.githubusercontent.com/50784573/110328673-fb84d600-805e-11eb-8c7a-97aa2c36da71.png" height=300/>
</div>

Develop stunning first impressions that capture your users' attention with UIView Transition Animation.

**Features**

- Only using one 3rd party library; SnapKit
- UIView Transition Animation
- Fully programmatic approach
- Clean, scalable and maintainable code.

### [Fashion Application Onboarding](https://github.com/iosdevted/ios-onboarding/tree/master/onboarding-2)

<div>
    <img src="https://user-images.githubusercontent.com/50784573/110582762-0307c480-81b0-11eb-917b-dac7ee11bb80.gif" height=250/>
    <img src="https://user-images.githubusercontent.com/50784573/110582780-0e5af000-81b0-11eb-916c-55bbd6cd2972.png" height=250/>
    <img src="https://user-images.githubusercontent.com/50784573/110582784-0ef38680-81b0-11eb-8b2a-80375e2ee55e.png" height=250/>
    <img src="https://user-images.githubusercontent.com/50784573/110582787-1024b380-81b0-11eb-9280-c215582795aa.png" height=250/>
    <img src="https://user-images.githubusercontent.com/50784573/110582790-10bd4a00-81b0-11eb-8833-bc96b24e2127.png" height=250/>
    <img src="https://user-images.githubusercontent.com/50784573/110582792-1155e080-81b0-11eb-9a33-e29c6e74b996.png" height=250/>
</div>

Develop stunning first impressions that capture your users' attention with UICollectionView Fade In & Out Animation.

**Features**

- Only using one 3rd party library; SnapKit
- UICollectionView Fade In & Out Animation
- Fully programmatic approach
- Clean, scalable and maintainable code.

### [AVFoundation Onboarding](https://github.com/iosdevted/ios-onboarding/tree/master/onboarding-3)

<div>
    <img src="https://user-images.githubusercontent.com/50784573/111138600-769c3e00-85c3-11eb-8038-72a6d8bc4890.gif" height=300/>
    <img src="https://user-images.githubusercontent.com/50784573/111138270-14dbd400-85c3-11eb-9655-b7ea0adc0739.png" height=300/>
    <img src="https://user-images.githubusercontent.com/50784573/111138288-1b6a4b80-85c3-11eb-8ffc-a2d99a6fd3c4.png" height=300/>
</div>

Develop stunning first impressions that capture your users' attention with AVFoundation.

**Features**

- AVFoundation
- Only using one 3rd party library; SnapKit
- Fully programmatic approach
- Clean, scalable and maintainable code.


### [AFWeather](https://github.com/iosdevted/ios-project/tree/master/AFWeather)

<p>
  <img src="https://user-images.githubusercontent.com/50784573/109624909-11d3f300-7b82-11eb-9c1e-0f5a165e9284.gif" Height=300/>
  <img src="https://user-images.githubusercontent.com/50784573/109623964-092eed00-7b81-11eb-8002-bfba45037fda.png" Height=300/>
  <img src="https://user-images.githubusercontent.com/50784573/109623984-0b914700-7b81-11eb-9459-031f15fbf508.png" Height=300/>
  <img src="https://user-images.githubusercontent.com/50784573/109623988-0c29dd80-7b81-11eb-9ff7-66c51a3e81c5.png" Height=300/>
</p>

A fully functional weather ios application built according to the MVC architecture and using Alamofire, Snapkit, SkeletonView, and Loaf.

**Features**

- Alamofire, SnapKit, SkeletonView & Loaf
- Get the current user's coordinates via CoreLocation
- RESTful API calls
- Handle CLLocationManager authorization status
- MVC Architecture
- Fully programmatic approach
- Clean, scalable and maintainable code.

### [RxSwift Photo Filter](https://github.com/iosdevted/ios-project/tree/master/RxPhotoFilter) / [RxNews](https://github.com/iosdevted/ios-project/tree/master/RxNews) / [RxWeather](https://github.com/iosdevted/ios-project/tree/master/RxWeather)

<p>
<img src="https://user-images.githubusercontent.com/50784573/104888432-17012800-59b0-11eb-8a56-0cb99e5437ad.gif" height=300/>
<img src="https://user-images.githubusercontent.com/50784573/108713214-40871380-755b-11eb-8eaf-fde83577e341.png" height=300/>
</p>

This is a project to get used to Rxswift which is one of the most popular and talked about frameworks in the iOS ecosystem and is leading the charge in iOS community by providing flexible and extensible framework, which can easily integrate with iOS applications.

**Features**

- RxSwift & RxCocoa
- MVVM Architecture
- Fully programmatic approach
- Clean, scalable and maintainable code.


### [Custom Tabs](https://github.com/iosdevted/ios-project/tree/master/custom-tabs)

<div>
    <img src="https://user-images.githubusercontent.com/50784573/110238745-99f13880-7f86-11eb-9400-caae02dcb795.gif" height=400/>
    <img src="https://user-images.githubusercontent.com/50784573/110238787-e63c7880-7f86-11eb-978e-e7c473f2c0a5.png" height=400/>
</div>

Custom tabs without using any 3rd party library and fully programmatic approach

The view for the tabs (TabsView) will be a UICollectionView, and each cell (TabCell) has an UIImageView for the icon (optional) and an UILabel for the title.

**Features**

- Without using any 3rd party library
- Fully programmatic approach
- Clean, scalable and maintainable code.


### [Side Menu](https://github.com/iosdevted/ios-project/tree/master/custom-side-menu-2)

Side menu without using any 3rd party library and fully programmatic approach

<div>
    <img src="https://user-images.githubusercontent.com/50784573/109942301-69f02e00-7d17-11eb-8edd-7a2a44ce02f6.gif" height=400/>
    <img src="https://user-images.githubusercontent.com/50784573/109942328-6fe60f00-7d17-11eb-9953-e9f821ace537.png" height=400/>
    <img src="https://user-images.githubusercontent.com/50784573/109942325-6f4d7880-7d17-11eb-8401-c1b6fdb756f3.png" height=400/>
</div>

**Features**

- Without using any 3rd party library
- Fully programmatic approach
- Clean, scalable and maintainable code.

### [Custom Keyboard](https://github.com/iosdevted/ios-project/tree/master/CustomKeyboard)

<p>
  <img src="https://user-images.githubusercontent.com/50784573/105153364-b149a300-5b4b-11eb-8dc6-d35d8635544d.gif" Height=400/>
  <img src="https://user-images.githubusercontent.com/50784573/105153352-ad1d8580-5b4b-11eb-8f08-9ae2b2c8c274.png" Height=400/>
  <img src="https://user-images.githubusercontent.com/50784573/105153359-af7fdf80-5b4b-11eb-996e-1f00972b021a.png" Height=400/>
  <img src="https://user-images.githubusercontent.com/50784573/105153360-b0187600-5b4b-11eb-8bb3-6eb841bb17f7.png" Height=400/>
</p>

A custom keyboard replaces the system keyboard for users who want capabilities such as random number keyboard.

**Features**

- Without using any 3rd party library
- Storyboard

### [Floating Button Animation](https://github.com/iosdevted/ios-project/tree/master/FloatingButton)

<img src="https://user-images.githubusercontent.com/50784573/105179042-27f69880-5b6c-11eb-9f5c-c0ea469217c5.gif" height=400/>

Simple floating action button for iOS. A floating action button performs the primary, or most common, action on a screen.

**Features**

- Without using any 3rd party library
- Storyboard


### [Code Connect Custom Image View](https://github.com/iosdevted/ios-project/tree/master/CodeConnectNib)

<p>
  <img src="https://user-images.githubusercontent.com/50784573/105275235-2cf62f00-5be2-11eb-8c5d-09580fb5b637.png" Height=400/>
</p>

Create a custom view to to encapsulate the visual appearance and behavior of your own reusable component.

**Features**

- Without using any 3rd party library
- Storyboard

### [UICollectionView With Asynchronous Image Loading](https://github.com/iosdevted/uicollectionview-async)

<p>
  <img src="https://user-images.githubusercontent.com/50784573/107114365-9a73b200-68a8-11eb-8fa4-7ace882a34ee.gif" Height=350/>
  <img src="https://user-images.githubusercontent.com/50784573/107114373-a3648380-68a8-11eb-924e-8bd5efabacd0.png" Height=350/>
</p>

Start your next iOS app with this uicollectionview. With fully functional features, you get everything you need for implementing a photo library or a list of photos. This app supports Image caching so that users don't have to download the photos already downloaded.

**Features**

- Asynchronous image loading
- Activity indicator
- Image caching 
- well-organized Photos.plist
- Clean, scalable and maintainable code
