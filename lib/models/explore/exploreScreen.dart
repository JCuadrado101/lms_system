import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_system/models/explore/widgets/selectCourses.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
        'Explore Courses',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            onPressed: () {
              context.pushNamed('settings');
            },
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          SelectCourses(
            imageLocation: 'assets/NUCADigSafeLogo.png',
            title: 'NUCA Dig Safe',
            rating: '4.5',
            count: '1.2k',
          ),
          SelectCourses(
            imageLocation: 'assets/StakingU.png',
            title: 'Staking University Locator Training',
            rating: '4.5',
            count: '1.2k',
          ),
        ]
      ),
    );
  }
}