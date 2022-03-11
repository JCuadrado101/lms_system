import 'package:flutter/material.dart';

class CompletingEnrollment extends StatelessWidget {
  final String purchaseTitle;
  final String purchaseDescription;
  final VoidCallback onPurchased;
  final Map<String, dynamic>? extra;
  const CompletingEnrollment({
    Key? key,
    required this.purchaseTitle,
    required this.purchaseDescription,
    this.extra,
    required this.onPurchased,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      mouseCursor: SystemMouseCursors.click,
      onTap: () => onPurchased(),
      title: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 5
        ),
        child: Text(
          purchaseTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Text(purchaseDescription),
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
        child: Text( '\$' '${extra?['extra']['price'] ?? 'Free'}',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
            )
        ),
      ),
    );
  }
}
