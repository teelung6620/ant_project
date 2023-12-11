import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HealthResult extends StatelessWidget {
  final String imgPath;
  final String title;
  final VoidCallback onTap;

  const HealthResult({
    super.key,
    required this.imgPath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 150,
          height: 150,
          //shadowColor: Colors.black,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10.0), // ปรับตามที่คุณต้องการ
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(-1, 2), // การปรับตำแหน่งแสงเงา
              ),
            ],
          ),

          // elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0, bottom: 2.0),
                  child: SvgPicture.asset(
                    imgPath,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover, // ให้รูปทำการ fit ใน CircleAvatar
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
