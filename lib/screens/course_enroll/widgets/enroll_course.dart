import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class EnrollCourse extends StatelessWidget {
  final Object? extra;
  const EnrollCourse({
    Key? key,
    required this.extra,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> extra = this.extra as Map<String, dynamic>;
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          'courseEnroll',
          extra: {
            'extra': extra,
          },
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        color: Colors.blue,
        child: RichText(
          text: TextSpan(
              text: 'Enroll',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                  text: 'Next In-Person: ${extra['inPersonTime']}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
