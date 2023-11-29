import 'package:ant_project/widget/button_exchange.dart';
import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class DetailPage extends StatefulWidget {
  final String imgPath;
  final String title;
  final String describ;
  final String avai;
  final String coins;
  const DetailPage(
      {Key? key,
      required this.imgPath,
      required this.title,
      required this.describ,
      required this.avai,
      required this.coins})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
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
        child: Container(
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
              IconButton(
                icon: Icon(
                  IconaMoon.arrowLeft2,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
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
                    child: Image.asset(
                      widget.imgPath,
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: MediaQuery.of(context).size.width *
                          0.55, // ปรับขนาดรูป
                      fit: BoxFit
                          .contain, // หรือ BoxFit.fill ขึ้นอยู่กับความต้องการ
                    ),
                  ),
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
                      Center(
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).devicePixelRatio * 3,
                      ),
                      Text(
                        'available : ${widget.avai}',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 113, 113, 113),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).devicePixelRatio * 5,
                      ),
                      Text(
                        widget.describ,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).devicePixelRatio * 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/image 6.png',
                            scale: 1.5,
                          ),
                          // Icon(
                          //   Icons.monetization_on_rounded,
                          //   size: MediaQuery.of(context).size.width * 0.05,
                          //   color: Colors.amber,
                          // ),
                          Text(
                            ' x${widget.coins}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).devicePixelRatio * 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'จำนวน',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Adjust the border radius as needed
                              border:
                                  Border.all(color: Colors.pink), // Pink border
                              color: Colors.white, // White background
                            ),
                            child: ItemCount(
                              buttonSizeWidth: 40,
                              color: Colors.white,
                              initialValue: selectedQuantity,
                              minValue: 1,
                              maxValue: 10,
                              decimalPlaces: 0,
                              onChanged: (value) {
                                setState(() {
                                  selectedQuantity = value.toInt();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Center(child: ButtonExchange()),
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
    );
  }
}
