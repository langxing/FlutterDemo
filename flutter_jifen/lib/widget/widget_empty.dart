import 'package:flutter/material.dart';
import 'package:flutter_jifen/constants.dart';

class EmptyWidget extends StatelessWidget {
  final double width;
  final double height;

  EmptyWidget({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            defaultImage,
            fit: BoxFit.contain,
            width: 80,
            height: 80,
          ),
          Text(
            "暂无数据",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          )
        ],
      ),
    );
  }

}