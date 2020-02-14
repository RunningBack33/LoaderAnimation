# LoaderAnimation

Activity indicator with custom shapes.

## Installation

1. Download the source code or 
``` 
clone https://github.com/RunningBack33/LoaderAnimation.git
```
2. Drag folder LoaderAnimation into your workspace or build project and drag file ` LoaderAnimator.framework ` to your project

3. Into your project file  go to "Frameworks, Libraries and Embeded Content" and add ` LoaderAnimation.framework `, also in the "Embed" column select "Embed & Sign"

## Usage

### Basic usage

- add loader animation to your view
```
    let loader = LoaderAnimation()
    self.view.addSubview(loader)
```

- start animating 
```
    loader.startAnimating() 
```

- stop animating 
```
    loader.stopAnimating() 
```

### Customize

 - You can choose frame, size of shape, type of built-in shape, number of shapes and duration of animation of one cycle
```
let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
let shapeSize = CGSize(width: 24, height: 10)
let shape = Shape.triangle(size: shapeSize, cornerRadius: 4)

let loader = LoaderAnimation(frame: frame,
                              shape: shape,
                              shapeCount: 8,
                              shapeColor: .magenta,
                              duration: 1.5)
```

- You can make custom CGPath and use ` Shape.custom(path: yourCustomPath)` so that loader will consist of your shapes.

## Authors

* **Pavel Maksimishin** - [RunningBack33](https://github.com/RunningBack33)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
