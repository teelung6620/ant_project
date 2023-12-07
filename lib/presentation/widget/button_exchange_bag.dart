import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ButtonExchangeBag extends StatefulWidget {
  const ButtonExchangeBag({Key? key}) : super(key: key);

  @override
  _ButtonExchangeBagState createState() => _ButtonExchangeBagState();
}

class _ButtonExchangeBagState extends State<ButtonExchangeBag> {
  final controller = ConfettiController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _showDeleteConfirmationDialog() async {
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
                      Navigator.of(context).pop(true); // ยืนยันการลบ
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
    await Future.delayed(const Duration(milliseconds: 200));
    controller.play();

    // Show AlertDialog after Confetti celebration
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('แลกของรางวัลสำเร็จ'),
          content: const Text('คุณได้ทำการแลกของรางวัลเรียบร้อยแล้ว!'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the AlertDialog
              },
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
    await Future.delayed(const Duration(seconds: 1));
    controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          // style: ElevatedButton.styleFrom(
          //   minimumSize: const Size(double.infinity, 50),
          //   elevation: 5, // ปรับตัวกวน
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10.0),
          //   ),
          // ),
          onTap: () async {
            // await _showDeleteConfirmationDialog();
          },
          child: Container(
            width: 218,
            height: 48,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFCB0C2),
                  Color(0xFFFFE4EB),
                ],
              ),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '400',
                  style: TextStyle(color: Colors.black, fontSize: 32),
                ),
                Text(
                  '/500',
                  style: TextStyle(color: Color(0xFF757575), fontSize: 13),
                ),
              ],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
          blastDirectionality: BlastDirectionality.explosive,
          // blastDirection: 3.14, // หรือใช้ 180 ก็ได้
          shouldLoop: true,
          // emissionFrequency: 0.01,
          //  numberOfParticles: 20,
          gravity: 0.2,
          colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange],
        ),
      ],
    );
  }
}
