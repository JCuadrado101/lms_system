import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_system/screens/explore_courses/widgets/select_courses.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference courses = FirebaseFirestore.instance.collection('courses');
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
      body: FutureBuilder<QuerySnapshot>(
        future: courses.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final data = snapshot.data?.docs;
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (!snapshot.hasError && snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectCourses(
                      imageLocation: data?[index]['image']!,
                      title: data?[index]['title'],
                      rating: data?[index]['rating'],
                      count: data?[index]['count'],
                      description: data?[index]['description'],
                      offerBy: data?[index]['offerBy'],
                      price: data?[index]['price'],
                      inPersonTime: data?[index]['inPersonTime'],
                      goRouteName: 'courseDetail',
                    ),
                  ],
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

