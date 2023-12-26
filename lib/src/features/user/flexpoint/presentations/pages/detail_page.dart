import 'package:ant_project/src/features/user/flexpoint/presentations/widget/button_exchange.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/widget/button_exchange_no.dart';
import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class DetailPage extends StatefulWidget {
  final String imgPath;
  final String title;
  final String price;
  final int quantity;
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
      required this.quantity,
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
  bool isOutOfStock = false;
  int? quantity2;
  bool _isSelceted = false;
  final List<int> _selectedIndices = [];
  bool _isSelectedForIndex(int index) {
    // Replace this with the actual logic to determine if the chip at the given index is selected
    return _selectedIndices.contains(index);
  }

  void _toggleSelectionForIndex(int index) {
    // Replace this with the actual logic to toggle the selection state for the chip at the given index
    setState(() {
      if (_selectedIndices.contains(index)) {
        _selectedIndices.remove(index);
      } else {
        _selectedIndices.add(index);
      }
    });
  }

  void check() {
    // วนลูปผ่านรายการ
    for (var item in widget.colorStock) {
      // ตรวจสอบว่า quantity เท่ากับ 0 หรือไม่

      // ตรวจสอบว่าตัวเลือกสีที่เลือกตรงกับตัวเลือกในตัวแปร "color" หรือไม่
      bool isColorMatch =
          item.options![0].idVariationOption == _selectedColorOptionId;

      bool isStorageMatch =
          item.options![1].idVariationOption == _selectedStorageOptionId;

      // หากทั้งตัวเลือกสีและ storage ตรงกัน คุณได้พบรายการที่สอดคล้อง
      if (isColorMatch && isStorageMatch) {
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
                                      _selectedColorIndex = index;
                                      _selectedColorOptionId =
                                          colorOption.idVariationOption;
                                      print(
                                          "Selected Color Option ID: $_selectedColorOptionId");
                                    } else {
                                      _selectedColorIndex = -1;
                                      _selectedColorOptionId = null;
                                    }
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
                                      _selectedStorageIndex = index;
                                      _selectedStorageOptionId =
                                          colorOption.idVariationOption;
                                      print(
                                          "Selected Storage Option ID: $_selectedStorageOptionId");
                                    } else {
                                      _selectedStorageIndex = -1;
                                      _selectedStorageOptionId = null;
                                    }
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
                    ElevatedButton(
                        onPressed: () {
                          check();
                          //print(widget.quantity);
                        },
                        child: Text('test')),
                    // Row(
                    //   children: filteredStorage.map((storageOption) {
                    //     int index = widget.storage.indexOf(storageOption);
                    //     return Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: ChoiceChip(
                    //         avatar: Icon(Icons.abc_outlined),
                    //         label: Text(
                    //           storageOption.value ?? "",
                    //         ),
                    //         selected: _isSelectedForIndex(index),
                    //         onSelected: (newBoolValue) {
                    //           print(index);
                    //           _toggleSelectionForIndex(index);
                    //         },
                    //       ),
                    //     );
                    //   }).toList(),
                    // ),

                    // Row(
                    //   children: widget.color.split(',').map((color) {
                    //     return Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: ChoiceChip(
                    //         avatar: Icon(Icons.abc_outlined),
                    //         label: Text(
                    //             color.trim()), // trim to remove extra spaces
                    //         selected: _isSelceted,
                    //         onSelected: (newBoolValue) {
                    //           setState(() {
                    //             _isSelceted = newBoolValue;
                    //           });
                    //         },
                    //       ),
                    //     );
                    //   }).toList(),
                    // ),
                    // Row(
                    //   children: widget.storage.split(',').map((color) {
                    //     return Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: ChoiceChip(
                    //         avatar: Icon(Icons.abc_outlined),
                    //         label: Text(color
                    //             .trim()), // trim to remove extra spaces
                    //         selected: _isSelceted,
                    //         onSelected: (newBoolValue) {
                    //           setState(() {
                    //             _isSelceted = newBoolValue;
                    //           });
                    //         },
                    //       ),
                    //     );
                    //   }).toList(),
                    // ),
                    // Center(
                    //   child: Text(
                    //     widget.color,
                    //     textAlign: TextAlign.left,
                    //     style: const TextStyle(
                    //         fontSize: 25,
                    //         color: Color.fromARGB(255, 0, 0, 0)),
                    //   ),
                    // ),
                    // Center(
                    //   child: Text(
                    //     widget.storage,
                    //     textAlign: TextAlign.left,
                    //     style: const TextStyle(
                    //         fontSize: 25,
                    //         color: Color.fromARGB(255, 0, 0, 0)),
                    //   ),
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).devicePixelRatio * 3,
                    ),
                    Text(
                      'มูลค่า : ${widget.price}  บาท',
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
                    const Spacer(),
                    if (_selectedColorIndex != -1 &&
                        _selectedStorageIndex != -1 &&
                        isOutOfStock)
                      Center(
                          child: ButtonExchange(
                        colorStock: widget.colorStock,
                        quantity: quantity2 ?? 0,
                        idReward: widget.idReward,
                        imgPath: widget.imgPath,
                        color: widget.color,
                        storage: widget.storage,
                      ))
                    else
                      ButtonExchangeNo(),
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
