import 'package:ant_project/injection_container.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/bloc/get_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class ButtonExchange extends StatefulWidget {
  final String? imgPath;
  final int quantity;
  final int idReward;
  const ButtonExchange(
      {required this.imgPath,
      required this.quantity,
      required this.idReward,
      Key? key})
      : super(key: key);

  @override
  _ButtonExchangeState createState() => _ButtonExchangeState();
}

class _ButtonExchangeState extends State<ButtonExchange> {
  final controller = ConfettiController();
  final getItemBloc = sl<GetItemBloc>();
  int? idEmployees = 0;
  int? quantity = 0;
  int? idCompany = 0;

  Future getProduct() async {
    try {
      var url = Uri.parse("http://localhost:8080/api/reward-active/1");
      var response = await http.get(url);
    } catch (error) {
      print('Error: $error');
      // ทำสิ่งที่คุณต้องการเมื่อเกิดข้อผิดพลาด
    }
  }

  Future getUser() async {
    // var url = Uri.parse("http://localhost:8080/api/profile");
    //var response = await http.get(url);

    //idEmployees = ingredientListFromJson(response.body);
    final Map<String, dynamic> decodedToken = JwtDecoder.decode(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlcyI6MSwiaWRDb21wYW55IjoxLCJpZFJvbGUiOjQsImlhdCI6MTcwMzIxMjIyMSwiZXhwIjoxNzAzMjk4NjIxfQ.cFfovUXK-0KkAfdLQQ60W2s6TVaNadbrWmJiV7MxcOE');
    idEmployees = int.tryParse(decodedToken['idEmployees'].toString());
    idCompany = int.tryParse(decodedToken['idCompany'].toString());
    print(decodedToken);
    print(idEmployees);
    print(idCompany);
    print(widget.idReward);
    print(widget.quantity);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _showConfirmationDialog() async {
    bool confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ยืนยันการแลกของรางวัล'),
          content: const Text('คุณต้องการลบแลกของรางวัลนี้ ใช่หรือไม่?'),
          actions: <Widget>[
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 255, 255, 255), // สีพื้นหลังของปุ่ม
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false); // ยกเลิกการลบ
                    },
                    child: const Text(
                      'ยกเลิก',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 251, 111, 158), // สีพื้นหลังของปุ่ม
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      //getItemBloc.add(RedeemedDataEvent());
                      Navigator.of(context).pop(true); // ยืนยันการลบ
                      getUser();
                      await _celebrate();
                    },
                    child: const Text('ยืนยัน'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _celebrate() async {
    // await Future.delayed(const Duration(milliseconds: 1));
    controller.play();

    // Show AlertDialog after Confetti celebration
    await showDialog(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: controller,
                  blastDirectionality: BlastDirectionality.explosive,
                  // blastDirection: 3.14, // หรือใช้ 180 ก็ได้
                  // shouldLoop: true,
                  // emissionFrequency: 1,
                  numberOfParticles: 200,
                  gravity: 0.2,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              AlertDialog(
                title:
                    // Image.asset(
                    //   'assets/images/Rectangle 90.png',
                    //   fit: BoxFit.cover,
                    // ),

                    Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Close the AlertDialog
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    Image.network(
                      widget.imgPath
                          .toString(), // เปลี่ยนเป็น path ของรูปที่คุณต้องการใช้
                      width: 100, // ปรับขนาดตามที่ต้องการ
                      height: 100,
                    ),

                    const SizedBox(height: 16), // ระยะห่างระหว่างรูปกับข้อความ
                    const Text('สำเร็จ!'),
                  ],
                ),
                content: const Text('คุณได้ทำการแลกของรางวัลเรียบร้อยแล้ว!'),
              ),
            ],
          ),
        );
      },
    );
    // await Future.delayed(const Duration(seconds: 1));
    //Navigator.pop(context);
    controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: const Color.fromARGB(255, 251, 111, 158),
              foregroundColor: Colors.white),
          onPressed: () async {
            getUser();
            //await _showConfirmationDialog();
          },
          child: const Text(
            'แลกของรางวัล',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ],
    );
  }
}
