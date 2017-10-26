# TMEStockExchange

Stock Exchange Sample Project

### Screenshots

| Launch | Details Page | Viability |
|--------|--------------|-----------|
|![Image1](https://raw.githubusercontent.com/sag333ar/TMEStockExchange/master/Screenshots/LaunchApp.gif)| ![Image2](https://raw.githubusercontent.com/sag333ar/TMEStockExchange/master/Screenshots/LaunchApp.gif)| ![Image3](https://raw.githubusercontent.com/sag333ar/TMEStockExchange/master/Screenshots/Viability.gif)|


### Architectures & Design Patterns

* [VIPER](https://medium.com/@ankoma22/the-good-the-bad-and-the-ugly-of-viper-architecture-for-ios-apps-7272001b5347) - I've implemented VIPER for UI modules.
* [CLEAN](https://marcinkuptel.com/2015/11/21/clean-architecture-on-ios/) - I've implemented clean architecture with different layers like SDK, Services, Core.
* Singleton design pattern
* Delegation design pattern
* Facade design pattern
* Decorator design pattern

### Multi-threading

* GCD - For UI operations, I've used Grand-center-dispatch.
* OperationQueues - For Web-service calls, I've used inbuilt operation queue of URLSession

### Dependencies

1. Fabric - for release management
2. Crashlytics - for crash reports management
3. Charts - for Showing chart
4. MBProgressHUD - for displaying progress indication
