import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'res.dart';

class CustomNumberPicker<T extends num> extends StatefulWidget {
  final ShapeBorder? shape;
  final TextStyle? valueTextStyle;
  final Function(T) onValue;
  final Widget? customAddButton;
  final Widget? customMinusButton;
  final T maxValue;
  final T minValue;
  final T initialValue;
  final T step;

  ///default vale true
  final bool enable;

  CustomNumberPicker(
      {super.key,
      this.shape,
      this.valueTextStyle,
      required this.onValue,
      required this.initialValue,
      required this.maxValue,
      required this.minValue,
      required this.step,
      this.customAddButton,
      this.customMinusButton,
      this.enable = true})
      : assert(initialValue.runtimeType != String),
        assert(maxValue.runtimeType == initialValue.runtimeType),
        assert(minValue.runtimeType == initialValue.runtimeType);

  @override
  State<StatefulWidget> createState() {
    return CustomNumberPickerState();
  }
}

class CustomNumberPickerState extends State<CustomNumberPicker<num>> {
  late num _initialValue;
  late num _maxValue;
  late num _minValue;
  late num _step;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initialValue = widget.initialValue;
    _maxValue = widget.maxValue;
    _minValue = widget.minValue;
    _step = widget.step;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enable,
      child: Card(
        shadowColor: Colors.transparent,
        elevation: 0.0,
        semanticContainer: true,
        color: Colors.transparent,
        shape: widget.shape,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: minus,
              onTapDown: (details) {
                onLongPress(DoAction.minus);
              },
              onTapUp: (details) {
                _timer?.cancel();
              },
              onTapCancel: () {
                _timer?.cancel();
              },
              child: widget.customMinusButton ??
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 6, right: 6, bottom: 6, top: 6),
                    child: SvgPicture.asset(
                      Res.icMinus,
                      height: 15,
                    ),
                  ),
            ),
            SizedBox(
              width: _textSize(
                      widget.valueTextStyle ?? const TextStyle(fontSize: 14))
                  .width,
              child: Text(
                "$_initialValue",
                style: widget.valueTextStyle ?? const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: add,
              onTapDown: (details) {
                onLongPress(DoAction.add);
              },
              onTapUp: (details) {
                _timer?.cancel();
              },
              onTapCancel: () {
                _timer?.cancel();
              },
              child: widget.customAddButton ??
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 6, right: 6, bottom: 6, top: 6),
                    child: SvgPicture.asset(
                      Res.icAdd,
                      height: 15,
                    ),
                  ),
            )
          ],
        ),
      ),
    );
  }

  Size _textSize(TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: _maxValue.toString(), style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(
          minWidth: 0, maxWidth: _maxValue.toString().length * style.fontSize!);
    return textPainter.size;
  }

  void minus() {
    if (canDoAction(DoAction.minus)) {
      setState(() {
        _initialValue -= _step;
      });
    }
    widget.onValue(_initialValue);
  }

  void add() {
    if (canDoAction(DoAction.add)) {
      setState(() {
        _initialValue += _step;
      });
    }
    widget.onValue(_initialValue);
  }

  void onLongPress(DoAction action) {
    var timer = Timer.periodic(const Duration(milliseconds: 300), (t) {
      action == DoAction.minus ? minus() : add();
    });
    setState(() {
      _timer = timer;
    });
  }

  bool canDoAction(DoAction action) {
    if (action == DoAction.minus) {
      return _initialValue - _step >= _minValue;
    }
    if (action == DoAction.add) {
      return _initialValue + _step <= _maxValue;
    }
    return false;
  }
}

enum DoAction { minus, add }
