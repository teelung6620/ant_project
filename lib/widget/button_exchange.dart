import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ButtonExchange extends StatefulWidget {
  const ButtonExchange({Key? key}) : super(key: key);

  @override
  _ButtonExchangeState createState() => _ButtonExchangeState();
}

class _ButtonExchangeState extends State<ButtonExchange> {
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
          title: Text('ยืนยันการแลกของรางวัล'),
          content: Text('คุณต้องการลบแลกของรางวัลนี้ ใช่หรือไม่?'),
          actions: <Widget>[
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          255, 255, 255, 255), // สีพื้นหลังของปุ่ม
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false); // ยกเลิกการลบ
                    },
                    child: Text(
                      'ยกเลิก',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          255, 251, 111, 158), // สีพื้นหลังของปุ่ม
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop(true); // ยืนยันการลบ
                      await _celebrate();
                    },
                    child: Text('ยืนยัน'),
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
    await Future.delayed(Duration(milliseconds: 200));
    controller.play();

    // Show AlertDialog after Confetti celebration
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('แลกของรางวัลสำเร็จ'),
          content: Text('คุณได้ทำการแลกของรางวัลเรียบร้อยแล้ว!'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the AlertDialog
              },
              child: Text('ตกลง'),
            ),
          ],
        );
      },
    );
    await Future.delayed(Duration(seconds: 1));
    controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Color.fromARGB(255, 251, 111, 158),
              foregroundColor: Colors.white),
          onPressed: () async {
            await _showDeleteConfirmationDialog();
          },
          child: const Text(
            'แลกของรางวัล',
            style: TextStyle(color: Colors.white, fontSize: 25),
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
