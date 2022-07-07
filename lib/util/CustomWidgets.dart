// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_logic_in_create_state

import 'package:flutter/material.dart';

class TapIconImage extends StatefulWidget {
  final void Function(bool) showBtn;

  TapIconImage({required this.showBtn, Key? key}) : super(key: key);

  @override
  State<TapIconImage> createState() => _TapIconImageState(showBtn: showBtn);
}

class _TapIconImageState extends State<TapIconImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  final void Function(bool) showBtn;
  bool _isIconTapped = false;

  _TapIconImageState({required this.showBtn});

  void _animationListener() {
    if (_controller.value == 1.0) {
      _controller.reverse();
    }

    if (_controller.value == 0.0) {
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    if (!_isIconTapped) {
      _controller = AnimationController(
          vsync: this, duration: Duration(milliseconds: 1000));

      _controller.forward();
      _controller.addListener(_animationListener);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
            visible: !_isIconTapped,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/logo.jpg'),
              backgroundColor: Colors.transparent,
            )),
        Visibility(
            visible: _isIconTapped,
            child: Container(
              width: 160.0,
              height: 160.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/logo.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.redAccent, width: 3.0)),
            )),
        GestureDetector(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, _) {
                return Opacity(
                  opacity: _controller.value,
                  child: CircleAvatar(
                    radius: _controller.value * 90,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/tap_on_img.png'),
                  ),
                );
              }),
          onTap: () {
            _controller.reset();
            _controller.stop();
            _controller.removeListener(_animationListener);
            showBtn(true);
            setState(() {
              _isIconTapped = true;
            });
          },
        ),
      ],
    );
  }
}
