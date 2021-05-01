# WindowView

**WindowView** is used to embed window style view to your project.

## Videos
<img src="https://github.com/medhatibsais/WindowView/blob/master/Videos/video3.gif" width="48">
![Video1 250x250](https://github.com/medhatibsais/WindowView/blob/master/Videos/video3.gif)
![Video2](https://github.com/medhatibsais/WindowView/blob/master/Videos/video4.gif =250x250)
![Video3](https://github.com/medhatibsais/WindowView/blob/master/Videos/video1.gif =250x250)
![Video4](https://github.com/medhatibsais/WindowView/blob/master/Videos/video2.gif =250x250)

## Requirements
1. iOS 10.0+
2. Xcode 9.3+
3. Swift 4.2+

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```


### Integration with Xcode project

To integrate WindowView into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby

use_frameworks!

target '<Your Target Name>' do
    pod 'WindowView'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

### Default setup

1. Put a property of window view in your view controller
```swift

var windowView: WindowView!
```

2. Initialize window view and add it as subview to the parent view
```swift

self.windowView = WindowView(frame: self.view.frame)
self.view.addSubview(self.windowView)
```

3. Add constraints to the window view
```swift

self.windowView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
self.windowView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
self.windowView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
self.windowView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
```

4. Add animations settings to the window view 
- **Note:** you can skip this section and use the default setup

```swift

let rotateIconAnimationSettings = AnimationSettings(duration: 1.5, delay: 0.5)
let openWindowAnimationSettings = AnimationSettings(duration: 1.5, delay: rotateIconAnimationSettings.fullDuration)
let closeWindowAnimationSettings = AnimationSettings(duration: 1.5, delay: 0)
let rotateIconToOriginAnimationSettings = AnimationSettings(duration: 1.5, delay: closeWindowAnimationSettings.fullDuration)

let windowAnimation = WindowAnimation(iconImagePinnedObject: .topImage, iconRotationAngle: 190, rotateIconAnimationSettings: rotateIconAnimationSettings, rotateIconToOriginAnimationSettings: rotateIconToOriginAnimationSettings, openWindowAnimationSettings: openWindowAnimationSettings, closeWindowAnimationSettings: closeWindowAnimationSettings)
```
5. Change the icon image constraints option 
- **Note:** you can skip this section and use the default setup

```swift 
let iconImageConstraint = IconImageConstraint(centerXConstraintConstant: 0, centerYConstraintConstant: 0, height: 128, width: 128)

let componentsConstraints = ComponentsConstraints(iconConstraints: iconImageConstraint)
```

6. Setup window view with parameters above
- You can use the defined animations form the library or use your custom animations

### Custom animation
```swift

self.windowView.setup(with: WindowViewRepresentable(firstImage: UIImage(named: "backgroundImage")!, secondImage: UIImage(named: "backgroundImage")!, iconImage: UIImage(named: "JustChatLogo")!, componentsConstraints: componentsConstraints, animation: Animations.custom(windowAnimation: windowAnimation)))
```
### Built in animations

1. Roll

```swift 

self.windowView.setup(with: WindowViewRepresentable(firstImage: UIImage(named: "backgroundImage")!, secondImage: UIImage(named: "backgroundImage")!, iconImage: UIImage(named: "JustChatLogo")!, componentsConstraints: componentsConstraints, animation: Animations.roll(iconImagePinnedObject: .topImage)))

```
2. Unlock

```swift 

self.windowView.setup(with: WindowViewRepresentable(firstImage: UIImage(named: "backgroundImage")!, secondImage: UIImage(named: "backgroundImage")!, iconImage: UIImage(named: "JustChatLogo")!, componentsConstraints: componentsConstraints, animation: Animations.unlock(iconImagePinnedObject: .topImage, iconRotationAngle: 190)))

```

### Setup with login view
In addition to the above customization you can add custom login view

1. Initialize login view or any view that is compatible with your project
```swift 

let loginView = LoginView()
loginView.delegate = self
loginView.translatesAutoresizingMaskIntoConstraints = false
```

2. Add the login view for example to the first image view, and setup its constraints

```swift 

self.windowView.firstImageView.addSubview(loginView)
loginView.topAnchor.constraint(equalTo: self.windowView.firstImageView.topAnchor, constant: 50).isActive = true
loginView.leftAnchor.constraint(equalTo: self.windowView.firstImageView.leftAnchor).isActive = true
loginView.rightAnchor.constraint(equalTo: self.windowView.firstImageView.rightAnchor).isActive = true
loginView.heightAnchor.constraint(equalToConstant: 300).isActive = true
```

## Open and close **WindowView**

1. Open
```swift 
self.windowView.open()
```
2. Close
```swift 
self.windowView.close()
```

**Note:** to run animation immediately once the view loaded you can call open method as show below.
```swift 
override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    self.windowView.open()
    
}
```

### WindowViewDelegate
**WindowViewDelegate** contains methods that help you listening to WindowView status

methods in delegate:

```swift
func windowViewWillOpen()

func windowViewDidOpen()

func windowViewWillClose()

func windowViewDidClose()
```

## Authors

Medhat Ibsais

## License
[LICENSE](https://github.com/medhatibsais/WindowView/blob/master/LICENSE)
