import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PurchasedCourses extends StatelessWidget {
  final String imageLocation;
  final String title;
  final String count;
  final String price;
  final String description;
  final String offerBy;
  final String inPersonTime;
  final String goRouteName;
  const PurchasedCourses({
    Key? key,
    required this.imageLocation,
    required this.title,
    required this.count,
    required this.price,
    required this.description,
    required this.offerBy,
    required this.inPersonTime,
    required this.goRouteName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          goRouteName,
          extra: {
            'title': title,
            'imageLocation': imageLocation,
            'count': count,
            'price': price,
            'description': description,
            'offerBy': offerBy,
            'inPersonTime': inPersonTime,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        child: Image.network(imageLocation),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
