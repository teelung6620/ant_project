import 'package:ant_project/injection_container.dart';
import 'package:ant_project/presentation/widget/AppBarCustom.dart';
import 'package:ant_project/src/components/widget/loading.dart';
import 'package:ant_project/src/components/widget/shimmer.dart';
import 'package:ant_project/src/core/error/token_expires.dart';
import 'package:ant_project/src/core/features/user/presentation/provider/profile_provider.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/bloc/get_item_bloc.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/widget/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class FlexpointPage extends StatefulWidget {
  const FlexpointPage({Key? key}) : super(key: key);
  @override
  State<FlexpointPage> createState() => _FlexpointState();
}

class _FlexpointState extends State<FlexpointPage> {
  final getItemBloc = sl<GetItemBloc>();
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
    getItemBloc
        .add(GetItemDataEvent(idCom: profileProvider.profileData.idCompany!));
  }

  // List<Color> _kDefaultRainbowColors = const [
  //   Color.fromARGB(255, 255, 93, 147),
  //   Color.fromARGB(255, 255, 123, 167),
  //   Color.fromARGB(255, 255, 172, 200),
  //   Color.fromARGB(255, 255, 228, 237),
  // ];

  @override
  Widget build(BuildContext context) {
    //double rightValue = MediaQuery.of(context).size.width * 0.03;
    //double bottomValue = MediaQuery.of(context).size.width * 0.1;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            leadingWidth: 200,
            leading:
                AppBarCustom(title: 'แลก Flexpoint', showBackButton: false),
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
                  text: 'อาหาร',
                ),
                Tab(
                  text: 'ชอปปิง',
                ),
                Tab(
                  text: 'ความบันเทิง',
                ),
                Tab(
                  text: 'ไลฟ์สไตล์',
                ),
                Tab(
                  text: 'ท่องเที่ยว',
                ),
                Tab(
                  text: 'สุขภาพ',
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
            padding: EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: BlocProvider(
                        create: (context) => getItemBloc,
                        child: BlocBuilder<GetItemBloc, GetItemState>(
                          builder: (context, state) {
                            if (state is GetItemInitial) {
                              return Text('errIni');
                            } else if (state is GetItemLoading) {
                              return Loading();
                              // return Expanded(
                              //     child: ShimmerComponent(
                              //   width: MediaQuery.of(context).size.width,
                              //   height: 100,
                              // ));
                            } else if (state is GetItemFailure) {
                              return Text('failure');
                            } else if (state is GetItemSuccess) {
                              return Container(
                                //height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  itemCount: state.getItem.length,
                                  itemBuilder: (context, index) {
                                    return ProductList(
                                        storageStock:
                                            state.getItem[index].items ?? [],
                                        colorStock:
                                            state.getItem[index].items ?? [],
                                        quantity: int.parse(
                                            '${state.getItem[index].items![index].quantity}'),
                                        idReward: int.parse(
                                            '${state.getItem[index].items![index].idReward}'),
                                        storage:
                                            state.getItem[index].options ?? [],
                                        color:
                                            state.getItem[index].options ?? [],
                                        imgPath:
                                            '${state.getItem[index].image}',
                                        title: '${state.getItem[index].name}',
                                        // describ: '${state.getItem[index].detail}',
                                        price:
                                            '${state.getItem[index].items![index].price}',
                                        coins: state.getItem.length > index &&
                                                state.getItem[index].items !=
                                                    null &&
                                                state.getItem[index].items!
                                                    .isNotEmpty &&
                                                state.getItem[index]
                                                        .items![index].coins !=
                                                    null &&
                                                state
                                                    .getItem[index]
                                                    .items![index]
                                                    .coins!
                                                    .isNotEmpty
                                            ? '${state.getItem[index].items![index].coins![0].amount}'
                                            : 'No Coins Available');
                                  },
                                ),
                              );
                            }
                            return Container();
                          },
                        )),
                  ),
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
                Container(
                  child: const Text('ท่องเที่ยว'),
                ),
                Container(
                  child: const Text('สุขภาพ'),
                ),
              ],
            ),
          )),
    );
  }
}
