import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ///Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    print('Device width px:${ScreenUtil.screenWidth}'); //Device width
    print('Device height px:${ScreenUtil.screenHeight}'); //Device height
    print(
        'Device pixel density:${ScreenUtil.pixelRatio}'); //Device pixel density
    print(
        'Bottom safe zone distance dp:${ScreenUtil.bottomBarHeight}'); //Bottom safe zone distance，suitable for buttons with full screen
    print(
        'Status bar height px:${ScreenUtil.statusBarHeight.toStringAsFixed(2)}dp'); //Status bar height , Notch will be higher Unit px
    print(
        'Ratio of actual width dp to design draft px:${ScreenUtil.getInstance().scaleWidth}');
    print(
        'Ratio of actual height dp to design draft px:${ScreenUtil.getInstance().scaleHeight}');
    print(
        'The ratio of font and width to the size of the design:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}');
    print(
        'The ratio of  height width to the size of the design:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}');

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('A5010'),
      ),
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 24, color: Colors.black),
        child: Container(
          margin: EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    // padding:
                    //     EdgeInsets.all(ScreenUtil.getInstance().setWidth(10)),
                    width: ScreenUtil.getInstance().setWidth(200),
                    // height: ScreenUtil.getInstance().setHeight(200),
                    color: Colors.red,
                    child: Text(
                      'My width: ${ScreenUtil.getInstance().setWidth(200).toStringAsFixed(2)} dp',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil.getInstance().setSp(32)),
                    ),
                  ),
                ],
              ),
              Text(
                  'Device width:${ScreenUtil.screenWidth.toStringAsFixed(2)}px'),
              Text(
                  'Device height:${ScreenUtil.screenHeight.toStringAsFixed(2)}px'),
              Text(
                  'Device width:${ScreenUtil.screenWidthDp.toStringAsFixed(2)}dp'),
              Text(
                  'Device height:${ScreenUtil.screenHeightDp.toStringAsFixed(2)}dp'),
              Text(
                  'Device pixel density:${ScreenUtil.pixelRatio.toStringAsFixed(2)}'),
              Text(
                  'Bottom safe zone distance:${ScreenUtil.bottomBarHeight.toStringAsFixed(2)}dp'),
              Text(
                  'Status bar height:${ScreenUtil.statusBarHeight.toStringAsFixed(2)}dp'),
              Text(
                'Ratio of actual width dp to design draft px:${ScreenUtil.getInstance().scaleWidth.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
              ),
              Text(
                'Ratio of actual height dp to design draft px:${ScreenUtil.getInstance().scaleHeight.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(100),
              ),
              Text(
                  'System font scaling factor:${ScreenUtil.textScaleFactor.toStringAsFixed(2)}'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'My font size is 24px on the design draft and will not change with the system.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil.getInstance().setSp(24),
                      )),
                  Text(
                      'My font size is 24px on the design draft and will change with the system.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil(allowFontScaling: true).setSp(24),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
