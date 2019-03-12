import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final Widget child;
  final String _question;
  final int _questionNumber;
  QuestionText(this._question, this._questionNumber, {Key key, this.child})
      : super(key: key);

  _QuestionTextState createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText>
    with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(
      duration: Duration(microseconds: 5000),
      vsync: this,
    );
    _fontSizeAnimation = new CurvedAnimation(
      parent: _fontSizeAnimationController,
      curve: Curves.bounceOut,
    )..addListener(() {
        setState(() {});
      });

    _fontSizeAnimationController.forward();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget._question != widget._question) {
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Center(
          child: Text(
            'Question ' +
                widget._questionNumber.toString() +
                ":" +
                widget._question,
            style: TextStyle(
              fontSize: _fontSizeAnimation.value * 20,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fontSizeAnimationController.dispose();
    super.dispose();
  }
}
