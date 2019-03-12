import 'package:flutter/material.dart';
import 'dart:math';

class Mask extends StatefulWidget {
  final Widget child;
  final bool _isCorrect;
  VoidCallback _onTap;
  Mask(this._isCorrect, this._onTap, {Key key, this.child}) : super(key: key);

  _MaskState createState() => _MaskState();
}

class _MaskState extends State<Mask> with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iconAnimationController = new AnimationController(
      duration: new Duration(seconds: 2),
      vsync: this,
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.elasticOut,
    )..addListener(() {
        setState(() {});
      });
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: InkWell(
        onTap: () => widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color:
                    widget._isCorrect ? Colors.greenAccent : Colors.redAccent,
                shape: BoxShape.circle,
              ),
              child: Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: Icon(
                  widget._isCorrect ? Icons.done : Icons.clear,
                  size: _iconAnimation.value * 80.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              widget._isCorrect ? 'Correct!' : 'Wrong',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _iconAnimationController.dispose();
    super.dispose();
  }
}
