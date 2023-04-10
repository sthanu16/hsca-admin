import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/navigation_bloc.dart';
import '../../../common/constant/color_constants.dart';
import '../../../common/constant/image.dart';
import '../../../common/constant/sizes.dart';
import '../../../common/constant/text_style_common.dart';
import 'bloc/house_detail_bloc.dart';

class HouseDetailScreen extends StatefulWidget {
  const HouseDetailScreen({Key? key}) : super(key: key);

  @override
  State<HouseDetailScreen> createState() => _HouseDetailScreenState();
}

class _HouseDetailScreenState extends State<HouseDetailScreen> {

  @override
  void initState() {
    super.initState();

  }
  List<String> keyName =[];
  List<String> valueName =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<HouseDetailBloc,HouseDetailState>(
          builder: (context,state){
            if(state is HouseDetailLoadingState){
              return const Center(child: CircularProgressIndicator());
            }
            else if(state is HouseDetailSuccessState){
              return Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text('House Details',
                                style: AppTextStyle.styleHeading20blw500),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22.0, vertical: 5),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorConstants.greenColor),
                              child: InkWell(
                                onTap: () {
                                  BlocProvider.of<BottomNavigationSelectionBloc>(
                                      context)
                                      .add(BottomNavigationSelectionRefreshEvent(
                                      1, ''));
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      ImageControl.arrowLeft,
                                      scale: 4,
                                    ),
                                    addWidth(2),
                                    Text("Back",
                                        style: AppTextStyle.btnTxt15Grayw500.copyWith(
                                            color: ColorConstants.whiteColor)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  addHeight(20),
                  Row(
                    children: [
                      commonCard('Exterior',state.houseDetailModel?.data?.exterior!.toJson(),state.houseDetailModel?.data?.exterior?.toJson().length??0),
                      commonCard('Interior',state.houseDetailModel?.data?.interior!.toJson(),state.houseDetailModel?.data?.interior?.toJson().length??0),
                    ],
                  ),
                  Row(
                    children: [
                      commonCard('Appliances',state.houseDetailModel?.data?.appliances!.toJson(),state.houseDetailModel?.data?.interior?.toJson().length??0),
                      commonCard('Community',state.houseDetailModel?.data?.community!.toJson(),state.houseDetailModel?.data?.interior?.toJson().length??0),
                    ],
                  ),
                  Row(
                    children: [
                      commonCard('Kitchen',state.houseDetailModel?.data?.kitchen!.toJson(),state.houseDetailModel?.data?.interior?.toJson().length??0),
                      commonCard('Other',state.houseDetailModel?.data?.other!.toJson(),state.houseDetailModel?.data?.interior?.toJson().length??0),
                    ],
                  ),
                  GridView.builder(
                    itemCount: state.houseDetailModel?.data?.bedroomList?.length,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                   crossAxisSpacing: 20.0,
                   mainAxisSpacing: 20.0,
                   childAspectRatio: 1.6),
                    itemBuilder: (BuildContext context, int index){
                      return commonCard(state.houseDetailModel?.data?.bedroomList![index].roomType??"",
                          state.houseDetailModel?.data?.bedroomList![index].toJson(),
                          state.houseDetailModel?.data?.bedroomList![index].toJson().length??0);
                    },
                  ),
                  // GridView.builder(
                  //   itemCount: 2,
                  //   shrinkWrap: true,
                  //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2,
                  //       crossAxisSpacing: 20.0,
                  //       mainAxisSpacing: 20.0,
                  //       childAspectRatio: 2),
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         boxShadow: const [BoxShadow(
                  //           color: Colors.grey,
                  //           blurRadius: 5.0,
                  //         ),],
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       child: Column(
                  //         children: [
                  //           Container(
                  //             decoration: const BoxDecoration(
                  //               color: ColorConstants.themeColor,
                  //               borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                  //                   topLeft: Radius.circular(20)),
                  //             ),
                  //             height: 50,
                  //             width: double.infinity,
                  //           )
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              );
            }
            else if(state is HouseDetailErrorState){
              return Text(state.error);
            }
            return Container();
          },
        )
      ),
    );
  }
 Widget commonCard(String heading,Map<String, dynamic>? userData,int length) {

    userData?.entries.forEach((element) {
      debugPrint("element:${element.key}");
      keyName.add(element.key);
      if(element.value==null || element.value.isEmpty){
        valueName.add('null');
      }
      else{
        valueName.add(element.value);
      }
    });

    return Expanded(
      child: Container(
        height: 300,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: ColorConstants.themeColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              height: 50,
              width: double.infinity,
              child: Text(heading,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16
              ),),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                  childAspectRatio: 8),
                itemBuilder: (BuildContext context, int index){
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children:  [
                          Text('${keyName[index]}: ',
                          style: const TextStyle(
                            color: Colors.grey
                          )),
                          Text(valueName[index],
                              style: const TextStyle(
                                  color: ColorConstants.themeColor
                              )),
                        ],
                      ),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
