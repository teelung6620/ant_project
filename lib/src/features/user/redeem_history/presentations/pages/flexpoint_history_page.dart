import 'package:ant_project/injection_container.dart';
import 'package:ant_project/presentation/widget/AppBarCustom2line.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/bloc/get_item_bloc.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/widget/product_layout.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/widget/product_list.dart';
import 'package:ant_project/src/features/user/redeem_history/presentations/bloc/redeem_history_bloc.dart';
import 'package:ant_project/src/features/user/redeem_history/presentations/widget/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconamoon/iconamoon.dart';

class FlexpointHistoryPage extends StatefulWidget {
  const FlexpointHistoryPage({Key? key}) : super(key: key);
  @override
  State<FlexpointHistoryPage> createState() => _FlexpointHistoryState();
}

class _FlexpointHistoryState extends State<FlexpointHistoryPage> {
  final getRedeemBloc = sl<RedeemHistoryBloc>();

  @override
  void initState() {
    super.initState();
    getRedeemBloc.add(RedeemHistoryDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    double rightValue = MediaQuery.of(context).size.width * 0.03;
    double bottomValue = MediaQuery.of(context).size.width * 0.1;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            leadingWidth: 200,

            leading: AppBarCustom2Line(
                title: 'ประวัติการแลก\nFlexpoint', showBackButton: true),
            //centerTitle: true,
            // backgroundColor: Color(0xFF363062),
            toolbarHeight: MediaQuery.of(context).size.height * 0.23,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/images/Group 725.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'ทั้งหมด',
                ),
                Tab(
                  text: 'รอตรวจสอบ',
                ),
                Tab(
                  text: 'สำเร็จ',
                ),
                Tab(
                  text: 'รับของรางวัลแล้ว',
                ),
                Tab(
                  text: 'ไม่สำเร็จ',
                ),
              ],
              indicatorColor: Colors.pink,
              labelColor: Colors.pink,
              tabAlignment: TabAlignment.start,
            ),
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Image.asset(
            //       'assets/images/tradecoin.png',
            //       scale: MediaQuery.of(context).size.width * 0.002,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                Container(
                  child: BlocProvider(
                      create: (context) => getRedeemBloc,
                      child: BlocBuilder<RedeemHistoryBloc, RedeemHistoryState>(
                        builder: (context, state) {
                          if (state is RedeemHistoryInitial) {
                            return Text('errIni');
                          } else if (state is RedeemHistoryLoading) {
                            return CircularProgressIndicator(
                              color: const Color.fromARGB(255, 255, 187, 210),
                            );
                          } else if (state is RedeemHistoryFailure) {
                            return Text('failure');
                          } else if (state is RedeemHistorySuccess) {
                            return Container(
                              //height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                itemCount: state.getRedeem.length,
                                itemBuilder: (context, index) {
                                  // return ProductList(
                                  //     storageStock:
                                  //         state.getRedeem[index].items ?? [],
                                  //     colorStock:
                                  //         state.getRedeem[index].items ?? [],
                                  //     quantity: int.parse(
                                  //         '${state.getRedeem[index].items![index].quantity}'),
                                  //     idReward: int.parse(
                                  //         '${state.getRedeem[index].items![index].idReward}'),
                                  //     storage: state.getRedeem[index].options ?? [],
                                  //     color: state.getRedeem[index].options ?? [],
                                  //     imgPath: '${state.getRedeem[index].image}',
                                  //     title: '${state.getRedeem[index].name}',
                                  //     // describ: '${state.getItem[index].detail}',
                                  //     price:
                                  //         '${state.getItem[index].items![index].price}',
                                  //     coins: state.getItem.length > index &&
                                  //             state.getItem[index].items !=
                                  //                 null &&
                                  //             state.getItem[index].items!
                                  //                 .isNotEmpty &&
                                  //             state.getItem[index].items![index]
                                  //                     .coins !=
                                  //                 null &&
                                  //             state.getItem[index].items![index]
                                  //                 .coins!.isNotEmpty
                                  //         ? '${state.getItem[index].items![index].coins![0].amount}'
                                  //         : 'No Coins Available'
                                  //         );
                                  return ProductRedeemList(
                                    redeemDate:
                                        state.getRedeem[index].redeemDate!,
                                    idRedeemStatus: int.parse(state
                                        .getRedeem[index].idRedeemStatus
                                        .toString()),
                                    coins: state
                                        .getRedeem[index].coins![0].amount
                                        .toString(),
                                    name:
                                        state.getRedeem[index].name.toString(),
                                    imgPath:
                                        state.getRedeem[index].image.toString(),
                                    // redeemDate:
                                    //     state.getRedeem[index].redeemDate!,
                                    idReward: int.parse(state
                                        .getRedeem[index].idReward
                                        .toString()),
                                    color: state
                                        .getRedeem[index].options![0].value
                                        .toString(),
                                    storage: state
                                        .getRedeem[index].options![1].value
                                        .toString(),
                                  );
                                },
                              ),
                            );
                          }
                          return Container();
                        },
                      )),
                ),
                Container(
                  child: const Text('อาหาร'),
                ),
                Container(
                  child: const Text('ชอปปิง'),
                ),
                Container(
                  child: const Text('ความบันเทิง'),
                ),
                Container(
                  child: const Text('ไลฟ์สไตล์'),
                ),
              ],
            ),
          )),
    );
  }
}
