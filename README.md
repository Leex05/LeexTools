# LeexTools
初始化项目实用工具，可缓存网络请求

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

LeexTools is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LeexTools'
```
## LXNetWork
无缓存请求
+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
parameters:(id)parameters
   headers:(id)headers
   success:(LXHttpRequestSuccess)success
   failure:(LXHttpRequestFailed)failure;
   
缓存请求
+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
   parameters:(id)parameters
      headers:(id)headers
responseCache:(LXHttpRequestCache)responseCache
      success:(LXHttpRequestSuccess)success
      failure:(LXHttpRequestFailed)failure;

## Author

leex, leex_ios@163.com

## License

感谢支持
BTC：3DUGBKHbNn7RhEkeFZvLYCd2ijXKncGhMJ
ETH：0x71436d6e4F5EA69dCe337D51aF9fB159EFCCF84B
