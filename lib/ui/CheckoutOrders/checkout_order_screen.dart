import 'package:finalapppp/controller/bloc/checkout_orders/checkout_orders_bloc/checkout_bloc.dart';
import 'package:finalapppp/controller/bloc/checkout_orders/checkout_orders_bloc/checkout_event.dart';
import 'package:finalapppp/controller/bloc/checkout_orders/checkout_orders_bloc/checkout_state.dart';
import 'package:finalapppp/resources/constants/dimensions.dart';
import 'package:finalapppp/resources/constants/font_weight.dart';
import 'package:finalapppp/services/rest_api/client.dart';
import 'package:finalapppp/widgets/CheckoutOrders/deliver_address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/constants/color.dart';
import '../../resources/constants/padding.dart';
import '../../widgets/component/text_widget.dart';
import '../payment/payment.dart';
import 'deliver_address_screen.dart';

class CheckoutOrderScreen extends StatefulWidget {
  static const routeName = "/checkoutOrder";
  int selectedItem;

  CheckoutOrderScreen({super.key, required this.selectedItem});

  @override
  State<CheckoutOrderScreen> createState() => _CheckoutOrderScreenState();
}

class _CheckoutOrderScreenState extends State<CheckoutOrderScreen> {
  late CheckoutBloc _checkoutBloc;
  int index = 0;
  var data = RestApiClientService.shared.checkoutOrderSummary;
  var addressData = RestApiClientService.shared.deliveryaddress;
  List discountArray = RestApiClientService.shared.discountArray;

  @override
  void initState() {
    _checkoutBloc = BlocProvider.of<CheckoutBloc>(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = 0.0;
    double deliveryFee = 2.0;
    double totalOrderPrice = 0.0;
    for (int i = 0; i < 1; i++) {
      double itemPrice = discountArray[widget.selectedItem]["price"];
      subtotal += itemPrice;
      totalOrderPrice = deliveryFee + subtotal;
    }
    double discount = subtotal * 20 / 100;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        leading: const BackButton(
          color: AppColor.blackColor,
        ),
        title: const Text(
          "Checkout Orders",
          style: TextStyle(
              color: AppColor.blackColor, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
            left: Paddings.padding16, right: Paddings.padding16),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  top: Paddings.padding10, bottom: Paddings.padding10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyColor.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(1, 2),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    title: "Deliver to",
                    fontSize: AppFontWeight.font16,
                    titleColor: AppColor.blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Divider(
                      thickness: 2,
                      endIndent: 10,
                      color: Colors.grey.withOpacity(0.1)),
                  GestureDetector(
                    onTap: () {
                      _checkoutBloc.add(AddressTapEvent(context));
                    },
                    child: BlocConsumer<CheckoutBloc, CheckoutState>(
                        listener: (context, state) {
                      if (state is CheckoutAddressTapState) {
                        print("ssss");
                        print(state);
                        Navigator.pushNamed(
                                context, DeliverAddressScreen.routeName)
                            .then((value) {
                          index = value as int;
                        });
                      }
                    }, builder: (context, state) {
                      if (state is CheckoutLoadedState) {
                        return Container(
                          child: DeliverAddressCard(
                            defaultButton: state.addresData[0]["defaultbutton"],
                            address: state.addresData[0]["address"],
                            title: state.addresData[0]["title"],
                            widget: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColor.greenColor,
                                size: 15,
                              ),
                            ),
                          ),
                        );
                      }

                      return Container(
                        child: DeliverAddressCard(
                          defaultButton: addressData[index]["defaultenabled"],
                          address: addressData[index]["address"],
                          title: addressData[index]["title"],
                          widget: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColor.greenColor,
                              size: 15,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Dimensions.dimen20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  top: Paddings.padding10, bottom: Paddings.padding10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyColor.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(1, 2),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget(
                        title: "Order Summary",
                        fontSize: AppFontWeight.font16,
                        titleColor: AppColor.blackColor,
                        fontWeight: FontWeight.w700,
                      ),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: TextWidget(
                            title: "Add Items",
                            titleColor: Colors.green,
                            fontSize: AppFontWeight.font13,
                            fontWeight: FontWeight.w700,
                            textoverflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(
                      thickness: 2,
                      endIndent: 2,
                      color: AppColor.greyColor.withOpacity(0.1)),
                  const SizedBox(
                    height: 10,
                  ),
                  // for(int i=0;i<data.length;i++)
                  Container(
                    padding: const EdgeInsets.only(bottom: Paddings.padding10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColor.whiteColor, width: 3),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            discountArray[widget.selectedItem]?['images'],
                            fit: BoxFit.cover,
                            height: 65,
                            width: 65,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  title: discountArray[widget.selectedItem]
                                      ?['food_title'],
                                  titleColor: AppColor.blackColor,
                                  fontSize: AppFontWeight.font14,
                                  fontWeight: FontWeight.w700,
                                  //height: 4,
                                  textoverflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: Dimensions.dimen13,
                                ),
                                TextWidget(
                                  title:
                                      "\$${discountArray[widget.selectedItem]?['price']}",
                                  titleColor: AppColor.greenColor,
                                  fontSize: AppFontWeight.font12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: AppColor.greenColor,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: TextWidget(
                                  title: "1x",
                                  titleColor: Colors.green,
                                  fontSize: AppFontWeight.font12,
                                  fontWeight: FontWeight.w700,
                                  textoverflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Icon(
                              Icons.edit,
                              color: AppColor.greenColor,
                              size: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  top: Paddings.padding10, bottom: Paddings.padding10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyColor.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(1, 2),
                    ),
                  ]),
              child: Column(
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.credit_card,
                            color: AppColor.greenColor,
                            size: 20,
                          ),
                        ),
                        const TextWidget(
                          title: "Payment Methods",
                          titleColor: AppColor.blackColor,
                          fontSize: AppFontWeight.font14,
                          fontWeight: FontWeight.w700,
                          //height: 4,
                          textoverflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        TextWidget(
                          title: "\$$totalOrderPrice",
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColor.greenColor,
                          size: 15,
                        ),
                      ],
                    ),
                    onTap: () {
                      _checkoutBloc
                          .add(PaymentTapEvent(context, totalOrderPrice));
                    },
                  ),
                  Divider(
                      thickness: 2,
                      endIndent: 2,
                      color: AppColor.greyColor.withOpacity(0.1)),
                  InkWell(
                    onTap: () {
                      _checkoutBloc
                          .add(GetDiscountsTapEvent(context, totalOrderPrice));
                    },
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.ac_unit_sharp,
                            color: AppColor.greenColor,
                            size: 20,
                          ),
                        ),
                        const TextWidget(
                          title: "Get Discounts",
                          titleColor: AppColor.blackColor,
                          fontSize: AppFontWeight.font14,
                          fontWeight: FontWeight.w700,
                          //height: 4,
                          textoverflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Container(width: Dimensions.dimen70,height: Dimensions.dimen20,
                            decoration: BoxDecoration(
                                color: AppColor.greenColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: TextWidget(
                                title: "\$$discount",titleColor: AppColor.whiteColor,
                              ),
                            )),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColor.greenColor,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  top: Paddings.padding10, bottom: Paddings.padding10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greyColor.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(1, 2),
                    ),
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget(
                        title: "Subtotal",
                        titleColor: AppColor.blackColor,
                        fontSize: AppFontWeight.font14,
                        fontWeight: FontWeight.w400,
                        //height: 4,
                        textoverflow: TextOverflow.ellipsis,
                      ),
                      TextWidget(
                        title: "\$$subtotal",
                        titleColor: AppColor.blackColor,
                        fontSize: AppFontWeight.font14,
                        fontWeight: FontWeight.w700,
                        //height: 4,
                        textoverflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        title: "Delivery Fee",
                        titleColor: AppColor.blackColor,
                        fontSize: AppFontWeight.font14,
                        fontWeight: FontWeight.w400,
                        //height: 4,
                        textoverflow: TextOverflow.ellipsis,
                      ),
                      TextWidget(
                        title: "\$2.00",
                        titleColor: AppColor.blackColor,
                        fontSize: AppFontWeight.font14,
                        fontWeight: FontWeight.w700,
                        //height: 4,
                        textoverflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                      thickness: 2,
                      endIndent: 2,
                      color: AppColor.greyColor.withOpacity(0.1)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget(
                        title: "Total",
                        titleColor: AppColor.blackColor,
                        fontSize: AppFontWeight.font14,
                        fontWeight: FontWeight.w400,
                        //height: 4,
                        textoverflow: TextOverflow.ellipsis,
                      ),
                      TextWidget(
                        title: "\$${totalOrderPrice-discount}",
                        titleColor: AppColor.blackColor,
                        fontSize: AppFontWeight.font14,
                        fontWeight: FontWeight.w700,
                        //height: 4,
                        textoverflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: Paddings.padding20, bottom: Paddings.padding20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: Dimensions.dimen50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColor.whiteColor,
                      backgroundColor:
                          AppColor.greenColor, // Set the button's text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            36), // Set the corner radius here
                      ),
                    ),
                    onPressed: () {
                      _checkoutBloc.add(PlaceOrderTapEvent(context));
                    },
                    child: TextWidget(
                      title: "Place Order - \$$totalOrderPrice",
                      fontWeight: FontWeight.bold,
                      fontSize: AppFontWeight.font16,
                    )),
              ),
            ),
          ],
        )),
      ),
    ));
  }
}
