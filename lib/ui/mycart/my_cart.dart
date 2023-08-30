import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../controller/bloc/mycart/myCart_bloc.dart';
import '../../controller/bloc/mycart/myCart_event.dart';
import '../../controller/bloc/mycart/mycart_state.dart';
import '../../resources/constants/dimensions.dart';
import '../../resources/constants/font_weight.dart';
import '../../resources/constants/padding.dart';
import '../../resources/constants/color.dart';
import '../../widgets/component/text_widget.dart';

class MyCartScreen extends StatefulWidget {
  static const routeName = "/myCart";
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  MyCartCardBloc? _myCartCardBloc;
  @override
  void initState() {
    _myCartCardBloc = BlocProvider.of<MyCartCardBloc>(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _myCartCardBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "My Cart",
          style: TextStyle(color: AppColor.blackColor),
        ),
        backgroundColor: AppColor.primaryColor,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(Paddings.padding10),
            child: Icon(
              Icons.pending_outlined,
              color: AppColor.blackColor,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
            left: Paddings.padding16,
            right: Paddings.padding16,
            top: Paddings.padding30),
        child: SingleChildScrollView(
          child: BlocBuilder<MyCartCardBloc, MyCartState>(
              builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state is MyCartLoadedState)
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: state.cartData.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    borderRadius: BorderRadius.circular(16),
                                    padding: const EdgeInsets.all(Paddings.padding20),
                                    onPressed: (context) {
                                      _myCartCardBloc!
                                          .add(MyCartDeleteTapEvent(index));
                                    }, //_myCartCardBloc?.add(MyCartDeleteTapEvent(state.cartData[index])),
                                    backgroundColor: AppColor.redColor,
                                    foregroundColor: AppColor.whiteColor,
                                    icon: Icons.delete,
                                  ),
                                ],
                              ),
                              direction: Axis.horizontal,
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                color: AppColor.whiteColor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        for (int i = 0;
                                            i <
                                                state.cartData[index]["images"]
                                                    .length;
                                            i++)
                                          Container(
                                            height: 80,
                                            width: 100,
                                            margin: EdgeInsets.only(
                                                left: (9.0 * i),
                                                right: 8,
                                                top: 8,
                                                bottom: 8),
                                            padding: const EdgeInsets.only(
                                                left: Paddings.padding2,
                                                right: Paddings.padding8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              border: Border.all(
                                                  color: AppColor.whiteColor,
                                                  width: 3),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.network(
                                                state.cartData[index]?["images"]
                                                    ?[i],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            title: state.cartData[index]
                                                ["title"],
                                            titleColor: AppColor.blackColor,
                                            fontSize: AppFontWeight.font18,
                                            fontWeight: FontWeight.w700,
                                            //height: 4,
                                            textoverflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: Dimensions.dimen13,
                                          ),
                                          Row(
                                            children: [
                                              TextWidget(
                                                title: state.cartData[index]
                                                    ["itemCount"],
                                                titleColor: AppColor.greyColor,
                                                fontSize: AppFontWeight.font12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: Paddings.padding5,
                                                    right: Paddings.padding5),
                                                child: TextWidget(
                                                  title: "|",
                                                  titleColor:
                                                      AppColor.greyColor,
                                                  fontSize:
                                                      AppFontWeight.font12,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              TextWidget(
                                                title: state.cartData[index]
                                                    ["kms"],
                                                titleColor: AppColor.greyColor,
                                                fontSize: AppFontWeight.font12,
                                                fontWeight: FontWeight.w700,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: Dimensions.dimen13,
                                          ),
                                          TextWidget(
                                            title: state.cartData[index]
                                                ["price"],
                                            titleColor: AppColor.greenColor,
                                            fontSize: AppFontWeight.font12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        }),
                  ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVU8f7XrBfjdRA84c0RCxiVA2w2iX3e6gVNg&usqp=CAU",
                        height: 350,
                        width: 300,
                      ),
                      const SizedBox(
                        height: Dimensions.dimen10,
                      ),
                      const TextWidget(
                        title: "Empty",
                        fontWeight: FontWeight.w700,
                        fontSize: AppFontWeight.font17,
                      ),
                      const SizedBox(
                        height: Dimensions.dimen10,
                      ),
                      const TextWidget(
                        title:
                            "You dont have any food in the cart at this time.",
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontWeight.font16,
                      )
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    ));
  }
}
