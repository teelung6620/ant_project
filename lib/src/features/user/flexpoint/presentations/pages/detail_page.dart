import 'package:ant_project/injection_container.dart';
import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/core/error/token_expires.dart';
import 'package:ant_project/src/core/features/user/presentation/provider/profile_provider.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/redeem_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/bloc/get_item_bloc.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/widget/button_exchange.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/widget/button_exchange_no.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';
import 'package:intl/intl.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class DetailPage extends StatefulWidget {
  final String imgPath;
  final String title;
  final String price;
  //final int quantity;
  final int idReward;

  final List<GetItemModelOption> color;
  final List<GetItemModelOption> storage;
  final List<Item> colorStock;
  final List<Item> storageStock;
  //final String describ;
  final String avai;
  final String coins;
  const DetailPage(
      {Key? key,
      required this.imgPath,
      required this.storage,
      //required this.quantity,
      required this.idReward,
      required this.title,
      required this.price,
      required this.color,
      required this.colorStock,
      required this.storageStock,
      //required this.describ,
      required this.avai,
      required this.coins})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
  int selectedQuantity = 1;
  int _selectedColorIndex = -1;
  int _selectedStorageIndex = -1;
  int? _selectedColorOptionId;
  int? _selectedStorageOptionId;
  bool noMatchFound = false;
  bool isOutOfStock = false;
  int? quantity2;
  bool _isSelceted = false;

  late ProfileProvider profileProvider;
  bool isError = false;
  void isLoading() async {
    //TokenExpires.checkTokenExpires(context);
    profileProvider = ProfileProvider.of(context, listen: false);
    await profileProvider.getProfileData().then((value) => isError = value);
  }

  final List<int> _selectedIndices = [];
  bool _isSelectedForIndex(int index) {
    // Replace this with the actual logic to determine if the chip at the given index is selected
    return _selectedIndices.contains(index);
  }

  void _toggleSelectionForIndex(int index) {
    setState(() {
      if (_selectedIndices.contains(index)) {
        _selectedIndices.remove(index);
        // ล้างข้อความหมดสต็อกเมื่อผู้ใช้เลือกสมบัติที่แตกต่าง
        isOutOfStock = false;
      } else {
        // ล้างการเลือกก่อนหน้าเมื่อผู้ใช้เลือกสมบัติใหม่
        _selectedIndices.clear();
        _selectedIndices.add(index);
      }
    });
  }

  void check() {
    // วนลูปผ่านรายการ
    bool foundMatch =
        false; // เพิ่มตัวแปรนี้เพื่อตรวจสอบว่ามีการตรงคู่ของ isColorMatch และ isStorageMatch

    for (var item in widget.colorStock) {
      // ตรวจสอบว่า quantity เท่ากับ 0 หรือไม่
      // ตรวจสอบว่าตัวเลือกสีที่เลือกตรงกับตัวเลือกในตัวแปร "color" หรือไม่
      bool isColorMatch =
          item.options![0].idVariationOption == _selectedColorOptionId;
      bool isStorageMatch =
          item.options![1].idVariationOption == _selectedStorageOptionId;

      // หากทั้งตัวเลือกสีและ storage ตรงกัน คุณได้พบรายการที่สอดคล้อง
      if (isColorMatch && isStorageMatch) {
        foundMatch = true; // มีการตรงคู่ของ isColorMatch และ isStorageMatch
        if (item.quantity == 0) {
          print("Out of stock: ${item.idProductItem}");
          setState(() {
            isOutOfStock = true; // กำหนดค่า isOutOfStock เป็น true
            quantity2 = item.quantity ??
                0; // กำหนดค่า selectedQuantity จาก item.quantity
            print(quantity2);
          });
        } else {
          print("รายการที่เลือก: ${item.idProductItem}");
          setState(() {
            quantity2 = item.quantity ??
                0; // กำหนดค่า selectedQuantity จาก item.quantity
            print(quantity2);
          });
          // กระทำบางสิ่งกับรายการที่เลือก เช่น อัปเดต UI หรือดำเนินการอื่น ๆ
        }
      }
    }

    // ตรวจสอบว่ามีการตรงคู่ของ isColorMatch และ isStorageMatch ทั้งคู่
    if (!foundMatch) {
      // ทำบางสิ่งกับกรณีที่ไม่มีการตรงคู่
      print("No match found");
      setState(() {
        noMatchFound = true;
      });
    } else {
      // กรณีที่มีการตรงคู่ เซ็ต noMatchFound เป็น false
      setState(() {
        noMatchFound = false;
      });
    }
  }

  final controller = ConfettiController();
  final getItemBloc = sl<GetItemBloc>();
  // int? idEmployees = 0;

  // int? idCompany = 0;

  // Future getUser() async {
  //   // var url = Uri.parse("http://localhost:8080/api/profile");
  //   //var response = await http.get(url);

  //   //idEmployees = ingredientListFromJson(response.body);
  //   final Map<String, dynamic> decodedToken =
  //       JwtDecoder.decode(NetworkAPI.tokenURL);
  //   idEmployees = int.tryParse(decodedToken['idEmployees'].toString());
  //   idCompany = int.tryParse(decodedToken['idCompany'].toString());

  //   // print(decodedToken);
  //   // print(idEmployees);
  //   // print(idCompany);
  //   // print('color:${widget.idReward}');
  //   // print(widget.quantity);
  //   // print('color:${widget.color}');
  //   // print(widget.idReward);

  //   //print('idProduct:${filteredColorStock}');
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //print('idEmployees = ${idEmployees}');
    isLoading();
    getItemBloc
        .add(GetItemDataEvent(idCom: profileProvider.profileData.idCompany!));
    check();
  }

  Future<void> _showConfirmationDialog() async {
    showDialog(
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
                      // getUser();

                      getItemBloc.add(RedeemedDataEvent(
                        idEmployee: profileProvider.profileData.idEmployees,
                        //ค่าที่ส่ง quanity กับ idReward สลับกัน
                        quantity: widget.idReward,
                        idReward: selectedQuantity,
                        coins: [
                          CoinRe(amount: 5),
                        ],
                      ));
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
                  //emissionFrequency: 1,

                  strokeWidth: 2,
                  numberOfParticles: 150,
                  gravity: 0.1,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.yellow,
                    Colors.purple,
                    Colors.pink
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              AlertDialog(
                title: Column(
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
    var filteredStorage = widget.storage
        .where((storageOption) => storageOption.idVariation == 2)
        .toList();
    var filteredColor = widget.color
        .where((storageOption) => storageOption.idVariation == 1)
        .toList();
    //var filteredColorStock = widget.colorStock.toList();
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
      body: Container(
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
                  child: Image.network(
                    widget.imgPath,
                    width: MediaQuery.of(context).size.width * 0.55,
                    height:
                        MediaQuery.of(context).size.width * 0.55, // ปรับขนาดรูป
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
                            fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).devicePixelRatio * 3,
                    ),

                    Text(
                      'สี',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 18,
                        //color: Color.fromARGB(255, 113, 113, 113),
                      ),
                    ),
                    Row(
                      children: filteredColor.map((colorOption) {
                        return Row(
                          children: colorOption.option!.map((colorOption) {
                            int index = colorOption.idVariationOption ?? -1;
                            bool isSelected = _selectedColorIndex == index;

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ChoiceChip(
                                label: Text(colorOption.value!),
                                selected: isSelected,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    if (newBoolValue) {
                                      _toggleSelectionForIndex(index);
                                      _selectedColorIndex = index;
                                      _selectedColorOptionId =
                                          colorOption.idVariationOption;
                                      print(
                                          "Selected Color Option ID: $_selectedColorOptionId");
                                    } else {
                                      _selectedColorIndex = -1;
                                      _selectedColorOptionId = null;
                                    }
                                    check();
                                  });
                                },
                                selectedColor: isSelected
                                    ? const Color.fromARGB(255, 255, 159, 191)
                                    : null,
                              ),
                            );
                          }).toList(),
                        );
                      }).toList(),
                    ),
                    Text(
                      'ความจุ',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 18,
                        //color: Color.fromARGB(255, 113, 113, 113),
                      ),
                    ),
                    Row(
                      children: filteredStorage.map((colorOption) {
                        return Row(
                          children: colorOption.option!.map((colorOption) {
                            int index = colorOption.idVariationOption ?? -1;
                            bool isSelected = _selectedStorageIndex == index;

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ChoiceChip(
                                label: Text(colorOption.value!),
                                selected: isSelected,
                                onSelected: (newBoolValue) {
                                  setState(() {
                                    if (newBoolValue) {
                                      _toggleSelectionForIndex(index);
                                      _selectedStorageIndex = index;
                                      _selectedStorageOptionId =
                                          colorOption.idVariationOption;
                                      print(
                                          "Selected Storage Option ID: $_selectedStorageOptionId");
                                    } else {
                                      _selectedStorageIndex = -1;
                                      _selectedStorageOptionId = null;
                                    }
                                    check();
                                  });
                                },
                                selectedColor: isSelected
                                    ? const Color.fromARGB(255, 255, 159, 191)
                                    : null,
                              ),
                            );
                          }).toList(),
                        );
                      }).toList(),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).devicePixelRatio * 3,
                    ),
                    Text(
                      'มูลค่า : ${NumberFormat('#,###').format(int.parse(widget.price.toString()))}  บาท',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 15,
                        //color: Color.fromARGB(255, 113, 113, 113),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).devicePixelRatio * 5,
                    ),
                    // Text(
                    //   widget.describ,
                    //   style: const TextStyle(
                    //     fontSize: 16,
                    //     color: Color.fromARGB(255, 0, 0, 0),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).devicePixelRatio * 10,
                    // ),
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
                    // ElevatedButton(
                    //     onPressed: () {
                    //       print(
                    //           'IdEmployee = ${profileProvider.profileData.idEmployees}');
                    //     },
                    //     child: Container()),
                    const Spacer(),
                    if (_selectedColorIndex != -1 &&
                        _selectedStorageIndex != -1 &&
                        noMatchFound)
                      ButtonExchangeNo(
                        title: 'ไม่มีสินค้านี้ในคลัง',
                      )
                    else if (_selectedColorIndex != -1 &&
                        _selectedStorageIndex != -1 &&
                        !isOutOfStock)
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              backgroundColor:
                                  const Color.fromARGB(255, 251, 111, 158),
                              foregroundColor: Colors.white),
                          onPressed: () async {
                            //print('idReward:${widget.idReward}');
                            // getUser();

                            await _showConfirmationDialog();
                            setState(() {});
                          },
                          child: const Text(
                            'แลกของรางวัล',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        //   child: ButtonExchange(
                        // colorStock: widget.colorStock,
                        // quantity: quantity2 ?? 0,
                        // idReward: widget.idReward,
                        // imgPath: widget.imgPath,
                        // color: widget.color,
                        // storage: widget.storage,
                      )
                    else if (_selectedColorIndex != -1 &&
                        _selectedStorageIndex != -1 &&
                        isOutOfStock)
                      ButtonExchangeNo(
                        title: 'สินค้าหมด',
                      )
                    else
                      ButtonExchangeNo(
                        title: 'เลือกสินค้าที่ต้องการ',
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
    );
  }
}
