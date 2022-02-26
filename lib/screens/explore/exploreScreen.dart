import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_system/screens/explore/widgets/selectCourses.dart';

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
            title: 'NUCA Dig Safe Certification',
            rating: '4.5',
            count: '1.2k',
            description: 'NUCA of Washington’s “Dig Safe Certification Program” provides training to contractors, excavators, landscapers, public works employees - anyone working with or around pipelines and underground utilities – to perform best digging practices adhering to Call Before You Dig Law (RCW 19.122) that went into effect January 1, 2013. The certification process will identify companies and field personnel who have taken the time to go through safe digging practice training and understand local and national laws',
            offerBy: 'NUCA',
            price: '\$75',
            inPersonTime: 'Jan 20',
            goRouteName: 'courseDetail',
          ),
          SelectCourses(
            imageLocation: 'assets/StakingU.png',
            title: 'Staking University Locator Training',
            rating: '4.5',
            count: '1.2k',
            description: "The Staking University Utility Locator Training is designed to aid locators in developing: Superior troubleshooting techniques, Skills to consistently provide accurate and complete utility location informationA mastery of locating equipment, Skills required to pass Staking U’s locator, certification test",
            offerBy: 'Staking U',
            price: '\$75',
            inPersonTime: 'Feb 28',
            goRouteName: 'courseDetail',
          ),
        ]
      ),
    );
  }
}