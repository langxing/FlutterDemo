import 'package:flutter/material.dart';
import 'package:flutter_jifen/widget/widget_empty.dart';
import 'package:flutter_jifen/widget/widget_loading.dart';

enum PageState{
  STATE_NOMAL, STATE_LOADING, STATE_ERROR, STATE_EMPTY
}

class ContentWidget extends StatefulWidget {
  final Widget child;
  final PageState pageState;
  final Widget emptyWidget;
  final Widget loadingWidget;

  ContentWidget({this.child, this.pageState, this.loadingWidget, this.emptyWidget});

  @override
  State<StatefulWidget> createState() {
    return _ContentState();
  }

}

class _ContentState extends State<ContentWidget> {

  @override
  Widget build(BuildContext context) {
    switch (widget.pageState) {
      case PageState.STATE_LOADING:
        if (widget.loadingWidget != null) {
          return widget.loadingWidget;
        }
        return LoadingWidget();
        break;
      case PageState.STATE_EMPTY:
        if (widget.emptyWidget != null) {
          return widget.emptyWidget;
        }
        return EmptyWidget();
        break;
      default:
        return widget.child;
        break;
    }
  }

}