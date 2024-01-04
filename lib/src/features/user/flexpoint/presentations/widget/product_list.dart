import 'package:ant_project/src/features/user/flexpoint/data/model/get_item_model.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProductList extends StatefulWidget {
  final String imgPath;
  final String title;
  final int quantity;
  final int idReward;

  final List<GetItemModelOption> color;
  final List<GetItemModelOption> storage;
  final List<Item> colorStock;
  final List<Item> storageStock;
  //final String describ;
  final String? price;
  final String? coins;
  const ProductList(
      {super.key,
      required this.imgPath,
      required this.storage,
      required this.quantity,
      required this.idReward,
      required this.title,
      required this.color,
      required this.colorStock,
      required this.storageStock,
      //required this.describ,
      required this.price,
      this.coins});
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.push(
          context,
          PageTransition(
            duration: Durations.long1,
            type: PageTransitionType.rightToLeft, // เลือก effect ที่ต้องการ
            child: DetailPage(
              storageStock: widget.storageStock,
              colorStock: widget.colorStock,
              quantity: widget.quantity,
              idReward: widget.idReward,
              price: widget.price.toString(),
              storage: widget.storage,
              color: widget.color,
              imgPath: widget.imgPath.toString(),
              title: widget.title.toString(),
              //describ: describ.toString(),
              avai: widget.price.toString(),
              coins: widget.coins.toString(),
            ),
          ),
        );
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
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.02,
                    ),
                    const Row(
                      children: [
                        Text(
                          'หมดเขต : 30 Nov 2023',
                          style: TextStyle(
                            fontSize: 12,
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
                    Text(
                      'มูลค่า : ${widget.price}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 113, 113, 113),
                      ),
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
