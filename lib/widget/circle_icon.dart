import 'package:ant_project/button/bottom_navbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
// import '../../../../../core/provider/bottom_navbar/bottom_navbar_provider.dart';

class CircleIcons extends StatelessWidget {
  final String title;
  const CircleIcons({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final navigationProvider = Provider.of<NavIndex>(context);
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.015),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 0.75))
              ],
            ),
            // child: SvgPicture.asset(
            //   isDisable ? imgs[0] : imgs[1],
            //   width: MediaQuery.of(context).size.width * 0.04,
            //   height: MediaQuery.of(context).size.height * 0.05,
            // )
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.03,
          ),
          Text(title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
