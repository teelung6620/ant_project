import 'package:flutter/material.dart';

class TotalCredit extends StatelessWidget {
  final String title;

  const TotalCredit({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Align(
                alignment: Alignment
                    .centerRight, // This will align the child to the center-right
                child: Image.asset(
                  'assets/images/Group 720.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Adjust the position as needed
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70, top: 65),
              child: Row(
                children: [
                  Text(
                    'วงเงินรวม',
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' บาท',
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
