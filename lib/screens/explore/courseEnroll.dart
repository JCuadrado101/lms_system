import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseEnroll extends StatelessWidget {
  final Object? extra;
  const CourseEnroll({
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
            title: const Text(
                'Enroll',
                style: TextStyle(
                    color: Colors.black
                )
            ),
          ),
          body: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        opacity: 0.2,
                        image: AssetImage('${extra['extra']['imageLocation']}'),
                        fit: BoxFit.cover
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                        '${extra['extra']['title']}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        )
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
                              '${extra['extra']['offerBy']}',
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
              Column(
                children: [
                  const SizedBox(height: 20),
                  ListTile(
                    mouseCursor: SystemMouseCursors.click,
                    onTap: () {},
                    title: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5
                      ),
                      child: Text(
                        'Purchase Course',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: const Text('Pay for this course and receive a certificate when completed.'),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black
                          ),
                      ),
                      child: Text(
                          '${extra['extra']['price']}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}
