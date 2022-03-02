import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../explore_courses/widgets/select_courses.dart';



class ActiveCourses extends StatefulWidget {
  const ActiveCourses({Key? key}) : super(key: key);

  @override
  State<ActiveCourses> createState() => _ActiveCoursesState();
}

class _ActiveCoursesState extends State<ActiveCourses> {
 final currentUser = FirebaseAuth.instance.currentUser?.uid;
  CollectionReference courses = FirebaseFirestore.instance.collection('courses');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Courses',
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
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
          future: courses.get(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            final data = snapshot.data?.docs;
            print(data?[0]['paidUsers']['uid']);
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }
            if (!snapshot.hasError && snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  if (currentUser.toString() == data![index]['paidUsers']['uid'].toString()) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SelectCourses(
                          imageLocation: data[index]['image']!,
                          title: data[index]['title'],
                          rating: data[index]['rating'],
                          count: data[index]['count'],
                          description: data[index]['description'],
                          offerBy: data[index]['offerBy'],
                          price: data[index]['price'],
                          inPersonTime: data[index]['inPersonTime'],
                          goRouteName: 'courseDetail',
                        ),
                      ],
                    );
                  }
                 else {
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                          'assets/courseNotFound.json',
                          width: 200,
                          repeat: false
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'No Active Courses',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('You aren\'t enrolled in any courses yet.'),
                      const SizedBox(height: 20),
                    ],
                  );
                 }
                  return Container();
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

