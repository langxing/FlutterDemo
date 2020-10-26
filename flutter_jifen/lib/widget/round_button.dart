import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  final _numberNotifier = ValueNotifier(1);
  final Function(int number) onClick;
  final int goodsNumber;
  final int miniNumber;
  final int maxNumber;
  double leftRadius = 2, rightRadius = 2;

  RoundButton(this.goodsNumber, {this.leftRadius, this.rightRadius, this.miniNumber, this.maxNumber, this.onClick}) {
    _numberNotifier.value = goodsNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFFE5E5E5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(leftRadius),
                    bottomLeft: Radius.circular(leftRadius)
                )
            ),
            child: Text(
              "-",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12
              ),
            ),
          ),
          onTap: () {
            int number = _numberNotifier.value;
            if (number > miniNumber) {
              _numberNotifier.value = number-1;
              onClick(_numberNotifier.value);
            }
          },
        ),
        ValueListenableBuilder(
          valueListenable: _numberNotifier,
          builder: (context, value, child) => Container(
            height: 30,
            alignment: Alignment.center,
            constraints: BoxConstraints(
              minWidth: 30
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                border: BorderDirectional(
                    top: BorderSide(color: Color(0xFFE5E5E5), width: 1),
                    bottom: BorderSide(color: Color(0xFFE5E5E5), width: 1)
                )
            ),
            child: Text(
              "$value",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12
              ),
            ),
          ),
        ),
        InkWell(
          child: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFFE5E5E5),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(rightRadius),
                    bottomRight: Radius.circular(rightRadius)
                )
            ),
            child: Text(
              "+",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12
              ),
            ),
          ),
          onTap: () {
            int number = _numberNotifier.value;
            if (number < maxNumber) {
              _numberNotifier.value = number+1;
              onClick(_numberNotifier.value);
            }
          },
        ),
      ],
    );
  }

}