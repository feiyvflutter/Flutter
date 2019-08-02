# Flutter
搜集工作和学习中用到的Flutter相关的技术，包含代码，遇到报错信息，以及解决办法。


## 自定义组件

1. IconTextButton
 `IconTextButton` 是一个图文按钮，Flutter的RaisedButton按钮RaisedButton.icon()按钮只能实现左图右文字
 
 `IconTextButton.icon()` 可以实现四种样式：
      图在上文字在下，图在下文字在上，图在左文字在右，图在右文字在左
      
 使用也很简单,其它属性设置和`RaisedButton.icon()`一样，
  只需要设置属性`iconTextAlignment`，它是一个枚举值 :
  
  ```
   enum IconTextAlignment {
    iconTopTextBottom,//图在上文字在下
    iconBottomTextTop,//图在下文字在上
    iconLeftTextRight,//图在左文字在右
    iconRightTextLeft,//图在右文字在左
  }
  ```
  
  eg1: 
  ```
   IconTextButton.icon(
    icon: Icon(Icons.add_alarm,size: 80,),
    label: Text("图下文上"),
    color: Colors.lightBlue,
    textColor: Colors.white,
    elevation: 4.0,
    iconTextAlignment: IconTextAlignment.iconBottomTextTop,
    onPressed: (){
      onClick("图下文上");
    },
  ),
  ```
  
  eg2: 
  ```
   Column(children: <Widget>[

              Container(height: 30,),

              IconTextButton.icon(
              icon: Icon(Icons.add_alarm,size: 80,),
              label: Text("图左文右"),
              color: Colors.lightBlue,
              textColor: Colors.white,
              elevation: 4.0,
              iconTextAlignment: IconTextAlignment.iconLeftTextRight,
              onPressed: (){
                onClick("图左文右");
              },
            ),

            Container(height: 30,),

            IconTextButton.icon(
              icon: Icon(Icons.add_alarm,size: 80,),
              label: Text("图右文左"),
              color: Colors.lightBlue,
              textColor: Colors.white,
              elevation: 4.0,
              iconTextAlignment: IconTextAlignment.iconRightTextLeft,
              onPressed: (){
                onClick("图右文左");
              },
            ),

            Container(height: 30,),

            IconTextButton.icon(
              icon: Icon(Icons.add_alarm,size: 80,),
              label: Text("图上文下"),
              color: Colors.lightBlue,
              textColor: Colors.white,
              elevation: 4.0,
              iconTextAlignment: IconTextAlignment.iconTopTextBottom,
              onPressed: (){
                onClick("图上文下");
              },
            ),

            Container(height: 30,),

            IconTextButton.icon(
              icon: Icon(Icons.add_alarm,size: 80,),
              label: Text("图下文上"),
              color: Colors.lightBlue,
              textColor: Colors.white,
              elevation: 4.0,
              iconTextAlignment: IconTextAlignment.iconBottomTextTop,
              onPressed: (){
                onClick("图下文上");
              },
            ),
            ],)
  ```
  
  

