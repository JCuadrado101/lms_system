import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_system/screens/explore_courses/widgets/select_courses.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference courses = FirebaseFirestore.instance.collection('courses');


    print(FirebaseFirestore.instance
        .collection('courses')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.data());
      });
    }));

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
      body: FutureBuilder<DocumentSnapshot>(
        future: courses.doc('WaQ8fXIIqTsxomIwYeq3').get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          Map<String, dynamic> data = snapshot.data?.data() as Map<String, dynamic>;

          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
           return ListView.builder(
             itemCount: data['description'].length,
             itemBuilder: (context, index) {
               return Wrap(
                     children: [
                       SelectCourses(
                         imageLocation: data['image'].toString(),
                         title: data['title'].toString(),
                         rating: data['rating'],
                         count: data['count'],
                         description: data['description'],
                         offerBy: data['offerBy'],
                         price: data['price'],
                         inPersonTime: data['inPersonTime'],
                         goRouteName: 'courseDetail',
                       ),
                     //   SelectCourses(
                     //     imageLocation: 'assets/StakingU.png',
                     //     title: 'Staking University Locator Training',
                     //     rating: '4.5',
                     //     count: '1.2k',
                     //     description: "The Staking University Utility Locator Training is designed to aid locators in developing: Superior troubleshooting techniques, Skills to consistently provide accurate and complete utility location informationA mastery of locating equipment, Skills required to pass Staking U’s locator, certification test",
                     //     offerBy: 'Staking U',
                     //     price: '\$75',
                     //     inPersonTime: 'Feb 28',
                     //     goRouteName: 'courseDetail',
                     //   ),
                     // ]
               ]
                 );
             },
           );

          }

          return Text("loading");
        },
      ),
    );
  }
}

