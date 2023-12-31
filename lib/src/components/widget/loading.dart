import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  final Color? color;
  const Loading({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.inkDrop(
              color: color ?? Color.fromARGB(255, 255, 112, 181), size: 40)
        ],
      ),
    );
  }
}
