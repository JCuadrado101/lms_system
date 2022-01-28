import 'package:flutter/material.dart';

class CourseDescription extends StatelessWidget {
  const CourseDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: const Icon(Icons.public, color: Colors.black),
          ),
          title: const Text('Online & Onsite'),
          subtitle: const Text('Start immediately or Join a class'),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: const Icon(Icons.hourglass_top, color: Colors.black),
          ),
          title: const Text('In Person: 1 day'),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: const Icon(Icons.language, color: Colors.black),
          ),
          title: const Text('English'),
          subtitle: const Text('Languages Spoken in Class'),
        ),
      ],
    );
  }
}
