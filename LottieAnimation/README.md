# 🏃‍♂️ Lottie Onboarding & Downloading Animation

<p>
  <img src="https://user-images.githubusercontent.com/50784573/107838292-8ec44600-6de8-11eb-93da-5acf3a40ed6c.gif" Height=350/>
  <img src="https://user-images.githubusercontent.com/50784573/107838295-9683ea80-6de8-11eb-9650-3d222867419b.gif" Height=350/>
  <img src="https://user-images.githubusercontent.com/50784573/107838297-97b51780-6de8-11eb-8509-1800efb48e96.gif" Height=350/>
</p>

## How to use Lottie

```swift
//pod 'lottie-ios'

// 1. Create the AnimationView
private var animationView: AnimationView?

override func viewDidLoad() {

  super.viewDidLoad()
  
  // 2. Start AnimationView with animation name (without extension)
  
  animationView = .init(name: "Name of Json File")
  
  animationView!.frame = view.bounds
  
  // 3. Set animation content mode
  
  animationView!.contentMode = .scaleAspectFit
  
  // 4. Set animation loop mode
  
  animationView!.loopMode = .loop
  
  // 5. Adjust animation speed
  
  animationView!.animationSpeed = 0.5
  
  view.addSubview(animationView!)
  
  // 6. Play animation
  
  animationView!.play()
}
```

```swift
enum ProgressKeyFrames: CGFloat {
    
    case start = 140
    case end = 187
    case complete = 240
}

private var progressView: AnimationView?

override func viewDidLoad() {

  super.viewDidLoad()
  // make sure the name of the animation matches the imported file
  
  progressView = .init(name: "download")
  
  progressView!.frame = view.bounds
  
  progressView!.contentMode = .scaleAspectFit
  
  view.addSubview(progressView!)
  
}

override func viewDidAppear(_ animated: Bool) {

  super.viewDidAppear(animated)
  
  startProgress()
  
}

private func startProgress() {

  // play from frame 0 to the start download of progress
  
  progressView?.play(fromFrame: 0, toFrame: ProgressKeyFrames.start.rawValue, loopMode: .none) { [weak self] (_) in
  
    self?.startDownload()
  }
}

// progress from 0 to 100%

private func startDownload() {

  // play animation from start to end of download progress
  
  progressView?.play(fromFrame: ProgressKeyFrames.start.rawValue, toFrame: ProgressKeyFrames.end.rawValue, loopMode: .none) { [weak self] (_) in
  
    self?.endDownload()
  }
}

// download is completed, we show the completion state

private func endDownload() {

  // download is completed, we show the completion state
  
  progressView?.play(fromFrame: ProgressKeyFrames.end.rawValue, toFrame: ProgressKeyFrames.complete.rawValue, loopMode: .none)
  
}
```

## How to run a demo app

1. Download the source code by cloning this repository
2. Install the pods by running

```
pod install
```

3. Open the xcworkspace file with the latest version of Xcode