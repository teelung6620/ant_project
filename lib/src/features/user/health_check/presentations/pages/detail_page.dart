import 'package:ant_project/src/features/user/flexpoint/presentations/widget/button_exchange.dart';
import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/features/user/all_health_result/data/model/get_health_model.dart';
import 'package:ant_project/src/features/user/health_check/data/model/get_hospital_model.dart';
import 'package:ant_project/src/features/user/health_check/domain/entity/hospital_entity.dart';
import 'package:ant_project/src/features/user/health_check/domain/usecase/get_hospital.dart';
import 'package:ant_project/src/features/user/health_check/presentations/bloc/get_hospital_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconamoon/iconamoon.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class HospitalDetailPage extends StatefulWidget {
  // final String imgPath;
  final HospitalEntity hospital;
  //final int id;
  // final String name;
  // final String detail;
  // final String location;
  // final String phone;
  const HospitalDetailPage({
    Key? key,
    // required this.imgPath,
    required this.hospital,
    // required this.id,
    //required this.name,
    //required this.detail,
    // required this.location,
    // required this.phone,
  }) : super(key: key);

  @override
  State<HospitalDetailPage> createState() => _HospitalDetailState();
}

class _HospitalDetailState extends State<HospitalDetailPage> {
  int selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(
      //       IconaMoon.arrowLeft2,
      //       size: 40,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   automaticallyImplyLeading: false,
      //   // title: Text(
      //   //   (widget.userP.postName),
      //   //   style: TextStyle(fontSize: 25),
      //   // ),
      //   centerTitle: true,
      //   backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //   toolbarHeight: 60,
      // ),
      //backgroundColor: const Color(0xFF4D4C7D),
      body: RefreshIndicator(
        onRefresh: () async {
          //await fetchData();
          //await getScore();
        },
        // color: const Color.fromARGB(255, 142, 61, 255),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Group 722.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        IconaMoon.arrowLeft2,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      widget.hospital.name.toString(),
                      //textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 22, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      //color: Color.fromARGB(255, 255, 255, 255), // สีพื้นหลัง
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: ClipRRect(
                        child: Image.network(
                            '${NetworkAPI.baseURL}api/image/${widget.hospital.image}')),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).devicePixelRatio * 3,
                ),
                // Text(
                //   userP.userName + '\n',
                //   style: const TextStyle(fontSize: 20),
                //   textAlign: TextAlign.right,
                // ),

                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio * 2,
                        left: MediaQuery.of(context).devicePixelRatio * 7.5,
                        right: MediaQuery.of(context).devicePixelRatio * 7.5,
                        bottom: MediaQuery.of(context).devicePixelRatio * 2),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255), // สีพื้นหลัง
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, // สีเงา
                          blurRadius: 5.0, // ขนาดของเงา
                          offset: Offset(0, 2), // ตำแหน่งของเงา
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        // Text(
                        //   'available : ${widget.hospital.getHospital.}',
                        //   textAlign: TextAlign.start,
                        //   style: const TextStyle(
                        //     fontSize: 12,
                        //     color: Color.fromARGB(255, 113, 113, 113),
                        //   ),
                        // ),

                        Text(
                          widget.hospital.detail.toString(),
                          //textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          'ที่่อยู่',
                          //textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.hospital.location.toString(),
                          //textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          'ช่องทางติดต่อ',
                          //textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.hospital.phone.toString(),
                          //textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        RatingBar.builder(
                          initialRating:
                              double.parse(widget.hospital.rating.toString()),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            // You can use the rating if needed
                          },
                        ),
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              backgroundColor:
                                  const Color.fromARGB(255, 251, 111, 158),
                              foregroundColor: Colors.white),
                          onPressed: () async {},
                          child: const Text(
                            'จอง',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).devicePixelRatio * 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
