import 'package:ant_project/src/features/user/flexpoint/data/model/get_item_model.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductRedeemList extends StatefulWidget {
  final String imgPath;
  final String name;
  final int idReward;
  final DateTime redeemDate;
  final String color;
  final String storage;
  final int idRedeemStatus;
  // final List<GetItemModelOption> color;
  // final List<GetItemModelOption> storage;
  // final List<Item> colorStock;
  // final List<Item> storageStock;
  //final String describ;
  //final String? price;
  final String? coins;
  const ProductRedeemList(
      {super.key,
      required this.name,
      required this.imgPath,
      required this.idRedeemStatus,
      required this.redeemDate,
      required this.idReward,
      required this.color,
      required this.storage,

      //required this.describ,
      //required this.price,
      this.coins});
  @override
  State<ProductRedeemList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductRedeemList> {
  @override
  Widget build(BuildContext context) {
    // print(DateFormat.yMMMd('th').format(widget.redeemDate));

    return InkWell(
      onTap: () async {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailPage(

        //       idReward: widget.idReward,
        //       price: widget.price.toString(),
        //       storage: widget.storage,
        //       color: widget.color,
        //       imgPath: widget.imgPath.toString(),
        //       title: widget.title.toString(),
        //       //describ: describ.toString(),
        //       avai: widget.price.toString(),
        //       coins: widget.coins.toString(),
        //     ),
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255), // สีพื้นหลัง
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: Image.network(
                    widget.imgPath,
                    width: MediaQuery.of(context).size.width * 0.35,
                    height:
                        MediaQuery.of(context).size.width * 0.35, // ปรับขนาดรูป
                    fit: BoxFit
                        .contain, // หรือ BoxFit.fill ขึ้นอยู่กับความต้องการ
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: widget.idRedeemStatus == 1
                            ? Color.fromARGB(255, 255, 197, 8)
                            : widget.idRedeemStatus == 2
                                ? Colors.green
                                : widget.idRedeemStatus == 3
                                    ? Colors.blue
                                    : widget.idRedeemStatus == 4
                                        ? Colors.red
                                        : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.idRedeemStatus == 1
                            ? 'รอตรวจสอบ'
                            : widget.idRedeemStatus == 2
                                ? 'สำเร็จ'
                                : widget.idRedeemStatus == 3
                                    ? 'รับของรางวัลแล้ว'
                                    : widget.idRedeemStatus == 4
                                        ? 'ไม่สำเร็จ'
                                        : widget.idRedeemStatus.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text(
                      'วันที่แลกของ ' +
                          DateFormat('dd/MM/yyyy').format(widget.redeemDate),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.01,
                    ),
                    // Text(
                    //   describ.length >
                    //           50 // 50 คือจำนวนตัวอักษรที่คุณต้องการให้แสดง
                    //       ? '${describ.substring(0, 50)}...' // ตัดเป็น ... เมื่อยาวเกิน 50 ตัวอักษร
                    //       : describ,
                    //   style: const TextStyle(
                    //     fontSize: 12,
                    //     color: Color.fromARGB(255, 113, 113, 113),
                    //   ),
                    //   maxLines: 2, // จำนวนบรรทัดสูงสุดที่ต้องการให้แสดง
                    //   overflow: TextOverflow.ellipsis,
                    //   softWrap: true,
                    // ),

                    Row(
                      children: [
                        Text(
                          '${widget.color} , ${widget.storage}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 113, 113, 113),
                          ),
                        ),
                        // Text(
                        //   " 400 | ",
                        //   style: TextStyle(fontSize: 13),
                        // ),
                        // Icon(
                        //   Icons.access_time_outlined,
                        //   size: 15,
                        // ),
                        // Text(
                        //   "30 Nov 2023",
                        //   style: TextStyle(fontSize: 13),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.01,
                    ),
                    // Text(
                    //   'มูลค่า : ${widget.price}',
                    //   style: const TextStyle(
                    //     fontSize: 12,
                    //     color: Color.fromARGB(255, 113, 113, 113),
                    //   ),
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
                            fontSize: 12,
                            color: Color.fromARGB(255, 113, 113, 113),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
