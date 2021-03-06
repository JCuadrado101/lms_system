import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_system/screens/course_detail/widgets/course_descriptions.dart';
import 'package:lms_system/screens/purchased_course_detail/widgets/purchased_course_start.dart';
import 'package:lms_system/screens/shared/rating.dart';
import 'package:lms_system/screens/shared/read_more_text.dart';

class PurchasedCourseDetail extends StatelessWidget {
  final Object? extra;
  const PurchasedCourseDetail({
    Key? key,
    required this.extra,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final Map<String, dynamic> extra = this.extra as Map<String, dynamic>;
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
            title: Text(
                extra['title'],
                style: const TextStyle(
                    color: Colors.black
                )
            ),
          ),
          bottomNavigationBar: PurchaseCourseStart(extra: extra),
          body: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        opacity: 0.2,
                        image: NetworkImage('${extra['imageLocation']}'),
                        fit: BoxFit.cover
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                        extra['title'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    const Rating(
                        rating: 4.5
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                              'Offered by:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              )
                          ),
                          const SizedBox(height: 5),
                          Text(
                              extra['offerBy'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'About this course',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              ReadMore(
                text: extra['description'],
              ),
              const CourseDescription(),
            ],
          )
      ),
    );
  }
}
