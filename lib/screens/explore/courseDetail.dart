import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_system/screens/explore/widgets/courseDescriptions.dart';
import 'package:lms_system/screens/explore/widgets/enrollCourse.dart';
import 'package:lms_system/screens/explore/widgets/rating.dart';
import 'package:lms_system/screens/explore/widgets/readMoreText.dart';

class CourseDetail extends StatelessWidget {
  final Object? extra;
  const CourseDetail({
    Key? key,
    required this.extra,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: EnrollCourse(extra: extra),
        body: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  opacity: 0.2,
                  image: AssetImage('${extra['imageLocation']}'),
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
