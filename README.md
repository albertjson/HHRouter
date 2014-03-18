HHRouter
=====
Yet another URL Router for iOS. Clean, Fast & Flexable. Inspired by [ABRouter](https://github.com/aaronbrethorst/ABRouter) & [Routable for iOS](https://github.com/usepropeller/routable-ios).

## Usage

### Warm Up

Map URL patterns to viewController. Better in AppDelegate.

```objective-c
[[HHRouter shared] map:@"/user/:userId/" toControllerClass:[UserViewController class]];
```
Define a `NSDictionary` property named `params` in viewControllers. Better in your BaseViewController.

```objective-c
@interface UserViewController : UIViewController
@property (strong, nonatomic) NSDictionary *params;
@end
```

### Exciting Time
Get viewController Instance from URL. Params will be automatic parsed.

```objective
UIViewController *viewController = [HHRouter shared] match:@"/user/1/"];
XCTAssertEqualObjects([viewController class], [UserViewController class]);
XCTAssertEqualObjects(viewController.params[@"route"], @"/user/1/");
XCTAssertEqualObjects(viewController.params[@"userId"], @"1");
```

### URL Query Params

URL Query Params is also supported. This will make things VERY flexable.

```objective-c
UIViewController *viewController = [HHRouter shared] match:@"/user/1/?tabIndex=3"];
XCTAssertEqualObjects(viewController.params[@"tabIndex"], @"3");
```

### One More Thing

If your app has defined some url schemes, HHRouter will know.

```objective-c
XCTAssertEqualObjects([[[HHRouter shared] match:@"hhrouter://user/1/"] class], [UserViewController class]);
```

## Installation
### [CocoaPods](http://cocoapods.org/)

```ruby
pod 'HHRouter', :git => 'https://github.com/Huohua/HHRouter.git', :commit => '21625ab064ad456d5c49c4e31b564cd628457023'
```

```objective-c
#import <HHRouter/HHRouter.h>
```

If you're not able to use CocoaPods, please install HHRouter as a [git submodule](http://schacon.github.com/git/user-manual.html#submodules) and add the files to your Xcode project.

## Contact
- [lightory@gmail.com](mailto:lightory@gmail.com)
- [http://twitter.com/lightory/](http://twitter.com/lightory/)

## License
HHRouter is available under the [MIT license](https://github.com/Huohua/HHRouter/blob/master/LICENSE).