import 'package:flutter/material.dart';

class OfferedBy extends StatelessWidget {
  const OfferedBy({
    Key? key,
    required this.extra,
  }) : super(key: key);

  final Map<String, dynamic> extra;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
              opacity: 0.2,
              image: NetworkImage('${extra['extra']['imageLocation']}'),
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
    );
  }
}
