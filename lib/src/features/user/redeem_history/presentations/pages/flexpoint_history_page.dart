import 'package:ant_project/injection_container.dart';
import 'package:ant_project/presentation/widget/AppBarCustom2line.dart';
import 'package:ant_project/src/components/widget/loading.dart';
import 'package:ant_project/src/components/widget/loading2.dart';
import 'package:ant_project/src/core/features/user/presentation/provider/profile_provider.dart';
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
  int allItemsCount = 0;
  int waitItemsCount = 0;
  int finishItemsCount = 0;
  int doneItemsCount = 0;
  int failItemsCount = 0;
  final getRedeemBloc = sl<RedeemHistoryBloc>();
  late ProfileProvider profileProvider;
  bool isError = false;
  void isLoading() async {
    // TokenExpires.checkTokenExpires(context);
    profileProvider = ProfileProvider.of(context, listen: false);
    await profileProvider.getProfileData().then((value) => isError = value);
  }

  @override
  void initState() {
    super.initState();
    isLoading();
    getRedeemBloc.add(RedeemHistoryDataEvent(
        idEmp: profileProvider.profileData.idEmployees!));
    getRedeemBloc.stream.listen((state) {
      if (state is RedeemHistorySuccess) {
        setState(() {
          allItemsCount = state.getRedeem.length;
          waitItemsCount =
              state.getRedeem.where((item) => item.idRedeemStatus == 1).length;
          finishItemsCount =
              state.getRedeem.where((item) => item.idRedeemStatus == 2).length;
          doneItemsCount =
              state.getRedeem.where((item) => item.idRedeemStatus == 3).length;
          failItemsCount =
              state.getRedeem.where((item) => item.idRedeemStatus == 4).length;
        });

        print(allItemsCount);
      }
    });
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
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Row(
                  children: [
                    Tab(
                      text: 'ทั้งหมด',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (allItemsCount != 0)
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink,
                        ),
                        child: Text(
                          '$allItemsCount',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Tab(
                      text: 'รอตรวจสอบ',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (waitItemsCount != 0)
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink,
                        ),
                        child: Text(
                          '$waitItemsCount',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Tab(
                      text: 'สำเร็จ',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (finishItemsCount != 0)
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink,
                        ),
                        child: Text(
                          '$finishItemsCount',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Tab(
                      text: 'รับของรางวัลแล้ว',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (doneItemsCount != 0)
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink,
                        ),
                        child: Text(
                          '$doneItemsCount',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Tab(
                      text: 'ไม่สำเร็จ',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (failItemsCount != 0)
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink,
                        ),
                        child: Text(
                          '$failItemsCount',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
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
                          return Loading();
                        } else if (state is RedeemHistoryFailure) {
                          return Text('failure');
                        } else if (state is RedeemHistorySuccess) {
                          // กรองข้อมูลเฉพาะรายการที่มี idRedeemStatus เป็น 1
                          final redeemedItems = state.getRedeem;
                          if (redeemedItems.isEmpty) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  'ไม่มีรายการข้อมูลนี้',
                                  style: TextStyle(fontSize: 20),
                                )),
                              ],
                            );
                          }
                          return Container(
                            child: ListView.builder(
                              itemCount: redeemedItems.length,
                              itemBuilder: (context, index) {
                                return ProductRedeemList(
                                  redeemDate: redeemedItems[index].redeemDate!,
                                  idRedeemStatus: int.parse(redeemedItems[index]
                                      .idRedeemStatus
                                      .toString()),
                                  coins: redeemedItems[index]
                                      .coins![0]
                                      .amount
                                      .toString(),
                                  name: redeemedItems[index].name.toString(),
                                  imgPath:
                                      redeemedItems[index].image.toString(),
                                  idReward: int.parse(
                                      redeemedItems[index].idReward.toString()),
                                  color: redeemedItems[index]
                                      .options![0]
                                      .value
                                      .toString(),
                                  storage: redeemedItems[index]
                                      .options![1]
                                      .value
                                      .toString(),
                                );
                              },
                            ),
                          );
                        }
                        return Container(child: Text('ไม่มีข้อมูล'));
                      },
                    ),
                  ),
                ),
                Container(
                  child: BlocProvider(
                    create: (context) => getRedeemBloc,
                    child: BlocBuilder<RedeemHistoryBloc, RedeemHistoryState>(
                      builder: (context, state) {
                        if (state is RedeemHistoryInitial) {
                          return Text('errIni');
                        } else if (state is RedeemHistoryLoading) {
                          return Loading();
                        } else if (state is RedeemHistoryFailure) {
                          return Text('failure');
                        } else if (state is RedeemHistorySuccess) {
                          // กรองข้อมูลเฉพาะรายการที่มี idRedeemStatus เป็น 1
                          final redeemedItems = state.getRedeem
                              .where((item) => item.idRedeemStatus == 1)
                              .toList();
                          if (redeemedItems.isEmpty) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  'ไม่มีรายการข้อมูลนี้',
                                  style: TextStyle(fontSize: 20),
                                )),
                              ],
                            );
                          }
                          return Container(
                            child: ListView.builder(
                              itemCount: redeemedItems.length,
                              itemBuilder: (context, index) {
                                return ProductRedeemList(
                                  redeemDate: redeemedItems[index].redeemDate!,
                                  idRedeemStatus: int.parse(redeemedItems[index]
                                      .idRedeemStatus
                                      .toString()),
                                  coins: redeemedItems[index]
                                      .coins![0]
                                      .amount
                                      .toString(),
                                  name: redeemedItems[index].name.toString(),
                                  imgPath:
                                      redeemedItems[index].image.toString(),
                                  idReward: int.parse(
                                      redeemedItems[index].idReward.toString()),
                                  color: redeemedItems[index]
                                      .options![0]
                                      .value
                                      .toString(),
                                  storage: redeemedItems[index]
                                      .options![1]
                                      .value
                                      .toString(),
                                );
                              },
                            ),
                          );
                        }
                        return Container(child: Text('ไม่มีข้อมูล'));
                      },
                    ),
                  ),
                ),
                Container(
                  child: BlocProvider(
                    create: (context) => getRedeemBloc,
                    child: BlocBuilder<RedeemHistoryBloc, RedeemHistoryState>(
                      builder: (context, state) {
                        if (state is RedeemHistoryInitial) {
                          return Text('errIni');
                        } else if (state is RedeemHistoryLoading) {
                          return Loading();
                        } else if (state is RedeemHistoryFailure) {
                          return Text('failure');
                        } else if (state is RedeemHistorySuccess) {
                          // กรองข้อมูลเฉพาะรายการที่มี idRedeemStatus เป็น 1
                          final redeemedItems = state.getRedeem
                              .where((item) => item.idRedeemStatus == 2)
                              .toList();
                          if (redeemedItems.isEmpty) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  'ไม่มีรายการข้อมูลนี้',
                                  style: TextStyle(fontSize: 20),
                                )),
                              ],
                            );
                          }
                          return Container(
                            child: ListView.builder(
                              itemCount: redeemedItems.length,
                              itemBuilder: (context, index) {
                                return ProductRedeemList(
                                  redeemDate: redeemedItems[index].redeemDate!,
                                  idRedeemStatus: int.parse(redeemedItems[index]
                                      .idRedeemStatus
                                      .toString()),
                                  coins: redeemedItems[index]
                                      .coins![0]
                                      .amount
                                      .toString(),
                                  name: redeemedItems[index].name.toString(),
                                  imgPath:
                                      redeemedItems[index].image.toString(),
                                  idReward: int.parse(
                                      redeemedItems[index].idReward.toString()),
                                  color: redeemedItems[index]
                                      .options![0]
                                      .value
                                      .toString(),
                                  storage: redeemedItems[index]
                                      .options![1]
                                      .value
                                      .toString(),
                                );
                              },
                            ),
                          );
                        }
                        return Container(child: Text('ไม่มีข้อมูล'));
                      },
                    ),
                  ),
                ),
                Container(
                  child: BlocProvider(
                    create: (context) => getRedeemBloc,
                    child: BlocBuilder<RedeemHistoryBloc, RedeemHistoryState>(
                      builder: (context, state) {
                        if (state is RedeemHistoryInitial) {
                          return Text('errIni');
                        } else if (state is RedeemHistoryLoading) {
                          return Loading();
                        } else if (state is RedeemHistoryFailure) {
                          return Text('failure');
                        } else if (state is RedeemHistorySuccess) {
                          // กรองข้อมูลเฉพาะรายการที่มี idRedeemStatus เป็น 1
                          final redeemedItems = state.getRedeem
                              .where((item) => item.idRedeemStatus == 3)
                              .toList();
                          if (redeemedItems.isEmpty) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  'ไม่มีรายการข้อมูลนี้',
                                  style: TextStyle(fontSize: 20),
                                )),
                              ],
                            );
                          }
                          return Container(
                            child: ListView.builder(
                              itemCount: redeemedItems.length,
                              itemBuilder: (context, index) {
                                return ProductRedeemList(
                                  redeemDate: redeemedItems[index].redeemDate!,
                                  idRedeemStatus: int.parse(redeemedItems[index]
                                      .idRedeemStatus
                                      .toString()),
                                  coins: redeemedItems[index]
                                      .coins![0]
                                      .amount
                                      .toString(),
                                  name: redeemedItems[index].name.toString(),
                                  imgPath:
                                      redeemedItems[index].image.toString(),
                                  idReward: int.parse(
                                      redeemedItems[index].idReward.toString()),
                                  color: redeemedItems[index]
                                      .options![0]
                                      .value
                                      .toString(),
                                  storage: redeemedItems[index]
                                      .options![1]
                                      .value
                                      .toString(),
                                );
                              },
                            ),
                          );
                        }
                        return Container(child: Text('ไม่มีข้อมูล'));
                      },
                    ),
                  ),
                ),
                Container(
                  child: BlocProvider(
                    create: (context) => getRedeemBloc,
                    child: BlocBuilder<RedeemHistoryBloc, RedeemHistoryState>(
                      builder: (context, state) {
                        if (state is RedeemHistoryInitial) {
                          return Text('errIni');
                        } else if (state is RedeemHistoryLoading) {
                          return Loading();
                        } else if (state is RedeemHistoryFailure) {
                          return Text('failure');
                        } else if (state is RedeemHistorySuccess) {
                          // กรองข้อมูลเฉพาะรายการที่มี idRedeemStatus เป็น 1
                          final redeemedItems = state.getRedeem
                              .where((item) => item.idRedeemStatus == 4)
                              .toList();
                          if (redeemedItems.isEmpty) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  'ไม่มีรายการข้อมูลนี้',
                                  style: TextStyle(fontSize: 20),
                                )),
                              ],
                            );
                          }

                          return Container(
                            child: ListView.builder(
                              itemCount: redeemedItems.length,
                              itemBuilder: (context, index) {
                                return ProductRedeemList(
                                  redeemDate: redeemedItems[index].redeemDate!,
                                  idRedeemStatus: int.parse(redeemedItems[index]
                                      .idRedeemStatus
                                      .toString()),
                                  coins: redeemedItems[index]
                                      .coins![0]
                                      .amount
                                      .toString(),
                                  name: redeemedItems[index].name.toString(),
                                  imgPath:
                                      redeemedItems[index].image.toString(),
                                  idReward: int.parse(
                                      redeemedItems[index].idReward.toString()),
                                  color: redeemedItems[index]
                                      .options![0]
                                      .value
                                      .toString(),
                                  storage: redeemedItems[index]
                                      .options![1]
                                      .value
                                      .toString(),
                                );
                              },
                            ),
                          );
                        }
                        return Text('ไม่มีข้อมูล');
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
