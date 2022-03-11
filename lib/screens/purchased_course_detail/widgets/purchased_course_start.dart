import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class PurchaseCourseStart extends StatelessWidget {
  final Object? extra;
  const PurchaseCourseStart({
    Key? key,
    required this.extra,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('courseVideos');
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        color: Colors.green,
        child: const Text('Start Course',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
