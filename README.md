# Flutter
搜集工作和学习中用到的Flutter相关的技术，包含代码，遇到报错信息，以及解决办法。


## 自定义组件

### 1. IconTextButton
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
  
  
  
  ### 2. IfeiyvIconTextButton 是 IconTextButton的升级版
  
  > 2019-09-27 更新 V1.0.1
    更新内容：

      1. IconTextAlignment 添加 noIconOnlyText,//无图仅包含文字
          此时创建的 IfeiyvIconTextButton 的Icon属性 【必填】可以为 null 也可以是 不为null的Icon

      2. 添加 backgroundView 为 IfeiyvIconTextButton  添加一个背景视图Widget，常用来做背景图片..

        如果要使用圆角则可以使用  IfeiyvIconTextButton.icon 中的 shape属性 
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),

        如果backgroundView是背景图片可以ClipRRect进行切圆角
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          child: Image.asset("images/bg.png",fit: BoxFit.fill,height: 80,),
        ),

        注意：如果 IfeiyvIconTextButton设置了高度
          如: 
          SizedBox(
               height: 80,
               child:IfeiyvIconTextButton.icon()
          )
          如果想要背景view或者背景图片填充满，最好高度也设置一下，和height高度一致

      3. 为了布局更加灵活，添加可选参数
            double paddingIconText,// 图标和文字之间的间隔
            double paddingLabelToBorder,// 文字到按钮边界的间隔

      eg:

        IfeiyvIconTextButton.icon(
            padding: EdgeInsets.all(0),
            shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
            backgroundView: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                child: Image.asset("images/bg.png",fit: BoxFit.fill,height: 80,),
            ),
            onPressed: (){},
            iconTextAlignment: IconTextAlignment.noIconOnlyText,
            icon:null,
            label: Text("登录",style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),),
            ),
  

