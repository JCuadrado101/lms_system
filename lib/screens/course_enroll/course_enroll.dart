import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lms_system/screens/course_enroll/widgets/completing_enrollment.dart';
import 'package:lms_system/screens/course_enroll/widgets/offered_by.dart';


class CourseEnroll extends StatelessWidget {
  final Object? extra;
  const CourseEnroll({
    Key? key,
    required this.extra,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> extra = this.extra as Map<String, dynamic>;
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference courses = FirebaseFirestore.instance.collection('courses');

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                context.pop();
              },
            ),
            title: const Text(
                'Enroll',
                style: TextStyle(
                    color: Colors.black
                )
            ),
          ),
          body: FutureBuilder<QuerySnapshot>(
            future: courses.get(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('something went wrong');
              }
              if (!snapshot.hasError && snapshot.hasData) {
                final data = snapshot.data?.docs as List;
                print(data);
                return Column(
                  children: [
                    OfferedBy(extra: extra),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        // CompletingEnrollment(
                        //   purchaseTitle: 'Purchase Course',
                        //   purchaseDescription: 'Pay for this course and receive a certificate when completed.',
                        //   extra: extra,
                        //   onPurchased: () {},
                        // ),
                        CompletingEnrollment(
                          purchaseTitle: 'Free',
                          purchaseDescription: 'Enroll in this course for free.',
                          onPurchased: () {
                           courses.doc(extra['courseId']).update({
                              'paidUsers': FieldValue.arrayUnion([user!.uid])
                            })
                             .then((value) => print("User Updated"))
                             .catchError((error) => print("Failed to update user: $error"));
                          },
                        ),
                      ],
                    )
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
      ),
    );
  }
}

