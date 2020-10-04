import 'package:flutter/material.dart';

class FlowNormal extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    /*屏幕宽度*/
    var screenW = context.size.width;

    double paddingV = 7.5; //竖直间距
    double paddingH = 15.0;///横向间距
    double offsetX = paddingH; //x坐标
    double offsetY = paddingV; //y坐标

    for (int i = 0; i < context.childCount; i++) {
      var boxSize = context.getChildSize(i);
      /*如果当前x左边加上子控件宽度小于屏幕宽度  则继续绘制  否则换行*/
      if (offsetX + boxSize.width + paddingH < screenW) {
        // print("尺寸${boxSize.width},绘制位置：$offsetX");
        /*绘制子控件*/
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0));
        /*更改x坐标*/
      } else {
        /*将x坐标重置为margin*/
        offsetX = paddingH;
        /*计算y坐标的值*/
        offsetY = offsetY + boxSize.height + paddingV;
        /*绘制子控件*/
        // print("换行：尺寸${boxSize.width},绘制位置：$offsetX");
        context.paintChild(i,
            transform: Matrix4.translationValues(offsetX, offsetY, 0));

        ///换行绘制后需要进行偏移
      }
      offsetX = offsetX + boxSize.width + paddingH;
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => true;
}
