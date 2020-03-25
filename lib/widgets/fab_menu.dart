import 'package:flutter/material.dart';

class FabMenu extends StatefulWidget {
  @override
  _FabMenuState createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu> with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _animateColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOutSine;
  double _fabHeight = 56;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animateColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _newButton(),
        _checkButton(),
        _menuButton(),
      ],
    );
  }

  void animate() {
    if (isOpened) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    isOpened = !isOpened;
  }

  Widget _menuButton() {
    return FloatingActionButton(
      backgroundColor: _animateColor.value,
      onPressed: animate,
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _animateIcon,
      ),
    );
  }

  Widget _checkButton() {
    return Transform(
      transform: Matrix4.translationValues(0, _translateButton.value, 0),
      child: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.check),
      ),
    );
  }

  Widget _newButton() {
    return Transform(
      transform: Matrix4.translationValues(0, _translateButton.value * 2, 0),
      child: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
