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
              final data = snapshot.data?.docs;
              if (snapshot.hasError) {
                return const Text('something went wrong');
              }
              if (!snapshot.hasError && snapshot.hasData) {
                return Column(
                  children: [
                    OfferedBy(extra: extra),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        CompletingEnrollment(
                          purchaseTitle: 'Purchase Course',
                          purchaseDescription: 'Pay for this course and receive a certificate when completed.',
                          extra: extra,
                          onPurchased: () {},
                        ),
                        CompletingEnrollment(
                          purchaseTitle: 'Free',
                          purchaseDescription: 'Enroll in this course for free.',
                          onPurchased: () {
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc('B7VAXSGGVxe8jEfUQYKT')
                                .update({
                              'purchasedCourses': FieldValue.arrayUnion([
                                {
                                  'course': {
                                    'course name': 'NUCA Dig Safe On Site',
                                    'price': 'free',
                                  },
                                },
                              ]),
                            });
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

