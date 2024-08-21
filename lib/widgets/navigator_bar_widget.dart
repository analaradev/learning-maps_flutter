import 'package:flutter/material.dart';

class NavigatorBarWidget extends StatefulWidget {
  final List<Widget> widgets;

  const NavigatorBarWidget({
    super.key,
    required this.widgets,
  });

  @override
  State<NavigatorBarWidget> createState() => _NavigatorBarWidgetState();
}

class _NavigatorBarWidgetState extends State<NavigatorBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0,
              spreadRadius: 1,
              offset: Offset(0, 0),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: SizedBox(
          // height: 270,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              widget.widgets.length,
              (index) => widget.widgets[index],
            ),
          ),
        ),
      ),
    );
  }
}
