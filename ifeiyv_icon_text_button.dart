/*
  Date:2019-08-02
  Author：飞羽
  GitHub：https://github.com/feiyvflutter/Flutter/blob/master/ifeiyv_icon_text_button.dart
  
  IconTextButton 是一个图文按钮，
  Flutter的RaisedButton按钮RaisedButton.icon()按钮只能实现左图右文字
  IconTextButton.icon() 可以实现四种样式：
      图在上文字在下，图在下文字在上，图在左文字在右，图在右文字在左
  使用也很简单,其它属性设置和RaisedButton.icon()一样，
  只需要设置属性iconTextAlignment，它是一个枚举值   
  
  enum IconTextAlignment {
    iconTopTextBottom,//图在上文字在下
    iconBottomTextTop,//图在下文字在上
    iconLeftTextRight,//图在左文字在右
    iconRightTextLeft,//图在右文字在左
    noIconOnlyText,//无图仅包含文字
  }
  
  eg:
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

  // 2019-09-27 更新 V1.0.1
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

*/



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


//add by 飞羽 2019-08-02
enum IconTextAlignment {
  iconTopTextBottom,//图在上文字在下
  iconBottomTextTop,//图在下文字在上
  iconLeftTextRight,//图在左文字在右
  iconRightTextLeft,//图在右文字在左
  noIconOnlyText,//无图仅包含文字
}

class IfeiyvIconTextButton extends MaterialButton {
  /// Create a simple text button.
  ///
  /// The [autofocus] and [clipBehavior] arguments must not be null.
  const IfeiyvIconTextButton({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior,
    FocusNode focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize,
    @required Widget child,
  }) : assert(autofocus != null),
       super(
         key: key,
         onPressed: onPressed,
         onHighlightChanged: onHighlightChanged,
         textTheme: textTheme,
         textColor: textColor,
         disabledTextColor: disabledTextColor,
         color: color,
         disabledColor: disabledColor,
         focusColor: focusColor,
         hoverColor: hoverColor,
         highlightColor: highlightColor,
         splashColor: splashColor,
         colorBrightness: colorBrightness,
         padding: padding,
         shape: shape,
         clipBehavior: clipBehavior,
         focusNode: focusNode,
         autofocus: autofocus,
         materialTapTargetSize: materialTapTargetSize,
         child: child,
      );

  /// Create a text button from a pair of widgets that serve as the button's
  /// [icon] and [label].
  ///
  /// The icon and label are arranged in a row and padded by 12 logical pixels
  /// at the start, and 16 at the end, with an 8 pixel gap in between.
  ///
  /// The [icon], [label], and [clipBehavior] arguments must not be null.
  factory IfeiyvIconTextButton.icon({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior,
    FocusNode focusNode,
    bool autofocus,
    MaterialTapTargetSize materialTapTargetSize,
    double paddingIconText,// 图标和文字之间的间隔
    double paddingLabelToBorder,// 文字到按钮边界的间隔
    Widget backgroundView,
    @required IconTextAlignment iconTextAlignment,
    @required Widget icon,
    @required Widget label,
  }) = _IfeiyvIconTextButtonWithIcon;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);
    return RawMaterialButton(
      onPressed: onPressed,
      onHighlightChanged: onHighlightChanged,
      fillColor: buttonTheme.getFillColor(this),
      textStyle: theme.textTheme.button.copyWith(color: buttonTheme.getTextColor(this)),
      focusColor: buttonTheme.getFocusColor(this),
      hoverColor: buttonTheme.getHoverColor(this),
      highlightColor: buttonTheme.getHighlightColor(this),
      splashColor: buttonTheme.getSplashColor(this),
      elevation: buttonTheme.getElevation(this),
      focusElevation: buttonTheme.getFocusElevation(this),
      hoverElevation: buttonTheme.getHoverElevation(this),
      highlightElevation: buttonTheme.getHighlightElevation(this),
      disabledElevation: buttonTheme.getDisabledElevation(this),
      padding: buttonTheme.getPadding(this),
      constraints: buttonTheme.getConstraints(this),
      shape: buttonTheme.getShape(this),
      clipBehavior: clipBehavior ?? Clip.none,
      focusNode: focusNode,
      autofocus: autofocus,
      materialTapTargetSize: buttonTheme.getMaterialTapTargetSize(this),
      animationDuration: buttonTheme.getAnimationDuration(this),
      child: child,
    );
  }
}

/// The type of of FlatButtons created with [FlatButton.icon].
///
/// This class only exists to give FlatButtons created with [FlatButton.icon]
/// a distinct class for the sake of [ButtonTheme]. It can not be instantiated.
class _IfeiyvIconTextButtonWithIcon extends IfeiyvIconTextButton with MaterialButtonWithIconMixin {
  _IfeiyvIconTextButtonWithIcon({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior,
    FocusNode focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize,
    double paddingIconText = -1,// 图标和文字之间的间隔
    double paddingLabelToBorder= -1,// 文字到按钮边界的间隔
    Widget backgroundView,
    @required IconTextAlignment iconTextAlignment,
    @required Widget icon,
    @required Widget label,
  }) : assert(iconTextAlignment != IconTextAlignment.noIconOnlyText ? icon != null : true),
       assert(label != null),
       assert(autofocus != null),
       super(
         key: key,
         onPressed: onPressed,
         onHighlightChanged: onHighlightChanged,
         textTheme: textTheme,
         textColor: textColor,
         disabledTextColor: disabledTextColor,
         color: color,
         disabledColor: disabledColor,
         focusColor: focusColor,
         hoverColor: hoverColor,
         highlightColor: highlightColor,
         splashColor: splashColor,
         colorBrightness: colorBrightness,
         padding: padding,
         shape: shape,
         clipBehavior: clipBehavior,
         focusNode: focusNode,
         autofocus: autofocus,
         materialTapTargetSize: materialTapTargetSize,
         child: Stack(
           alignment: Alignment.center,
           children: <Widget>[
             backgroundView != null ? backgroundView : Container(),
              iconTextAlignment == IconTextAlignment.iconLeftTextRight ? Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              icon,
              SizedBox(width: paddingIconText < 0 ? 8 : paddingIconText),
              label,
            ],
          ) : iconTextAlignment == IconTextAlignment.iconRightTextLeft ? Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              label,
              SizedBox(width: paddingIconText < 0 ? 8 : paddingIconText),
              icon,
            ],
          ) : iconTextAlignment == IconTextAlignment.iconTopTextBottom ? Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              icon,
              SizedBox(height:paddingIconText < 0 ? 8 : paddingIconText),
              label,
              SizedBox(height:paddingLabelToBorder < 0 ? 4 : paddingLabelToBorder),
            ],
          ) :  iconTextAlignment == IconTextAlignment.iconBottomTextTop ? Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height:paddingLabelToBorder < 0 ? 4 : paddingLabelToBorder),
              label,
              SizedBox(height:paddingIconText < 0 ? 8 : paddingIconText),
              icon,
            ],
          ) : label,
           ],
         ),
       );

}
