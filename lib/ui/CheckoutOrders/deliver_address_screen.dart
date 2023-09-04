import 'package:finalapppp/controller/bloc/checkout_orders/checkout_orders_bloc/checkout_bloc.dart';
import 'package:finalapppp/controller/bloc/checkout_orders/checkout_orders_bloc/checkout_state.dart';
import 'package:finalapppp/controller/bloc/checkout_orders/delivery_address_bloc/delivery_address_bloc.dart';
import 'package:finalapppp/controller/bloc/checkout_orders/delivery_address_bloc/delivery_address_event.dart';
import 'package:finalapppp/controller/bloc/checkout_orders/delivery_address_bloc/delivery_address_state.dart';
import 'package:finalapppp/resources/constants/color.dart';
import 'package:finalapppp/resources/constants/padding.dart';
import 'package:finalapppp/ui/CheckoutOrders/checkout_order_screen.dart';
import 'package:finalapppp/widgets/CheckoutOrders/deliver_address_card.dart';
import 'package:finalapppp/widgets/component/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/constants/dimensions.dart';
import '../../resources/constants/font_weight.dart';

class DeliverAddressScreen extends StatefulWidget {
static const routeName="/deliveryaddress";

  const DeliverAddressScreen({super.key});

  @override
  State<DeliverAddressScreen> createState() => _DeliverAddressScreenState();
}

class _DeliverAddressScreenState extends State<DeliverAddressScreen> {
  int selectedOption=0;
  List deliveryaddress = [
    {
      "title": "Home",
      "defaultbutton": true,
      "address": "Times Square New",
      "radioenable": true
    },
    {
      "title": "My Office",
      "defaultbutton": false,
      "address": "Times Square New",
      "radioenable": true
    },
    {
      "title": "My Apartment",
      "defaultbutton": false,
      "address": "Times Square New",
      "radioenable": true
    },
    {
      "title": "Parents House",
      "defaultbutton": false,
      "address": "Times Square New",
      "radioenable": true
    },
    {
      "title": "My Villa",
      "defaultbutton": false,
      "address": "Times Square New",
      "radioenable": true
    },

  ];
  DeliveryAddressBloc? _deliveryAddressBloc;
  @override
  void initState() {
    _deliveryAddressBloc=BlocProvider.of<DeliveryAddressBloc>(context);
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    int? selectedOptio=0;
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
          "Deliver to",
          style: TextStyle(color: AppColor.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child:  Column(
          children: [
              BlocConsumer<DeliveryAddressBloc,DeliveryAddressState>(
                listener: (context,state){
                  if(state is ApplyAdressTapState){
// Navigator.pushNamed(context, CheckoutOrderScreen.routeName,).then((value) => selectedOption)  ;
                    Navigator.pop(context,selectedOption);
                  }
                },
                builder: (context,state) {
                  if(state is AddressLoadedState) {
                    return SizedBox(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                                left: Paddings.padding16, right: Paddings.padding16),
                            child: Column(
                              children: [
                                DeliverAddressCard(
                                  defaultButton: state.data[index]
                                  ["defaultbutton"],
                                  title: state.data[index]["title"] ?? "",
                                  address: state.data[index]["address"]??"",
                                  widget: Radio(
                                    fillColor: MaterialStateProperty.all(AppColor.greenColor),
                                    value: index,
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {

                                      });
                                      selectedOption = value!;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                  } else{
                    return SizedBox();
                  }
                }
              ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                _deliveryAddressBloc?.add(AddAddressTapEvent(context));
              },
              child: Container(
                  margin: const EdgeInsets.only(
                      left: Paddings.padding16,
                      right: Paddings.padding16,
                      bottom: Paddings.padding10),
                  height: Dimensions.dimen50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColor.greenColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(35)),
                  child: const Center(
                      child: TextWidget(
                        title: "Add New Address",
                        fontSize: AppFontWeight.font12,
                        titleColor: AppColor.greenColor,
                        fontWeight: FontWeight.w700,
                      ))),
            ),
            Divider(thickness: 1,),
            Container(
            margin: const EdgeInsets.only(
                left: Paddings.padding16, right: Paddings.padding16,top: Paddings.padding10,bottom: Paddings.padding20),
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
                    _deliveryAddressBloc!.add(ApplyAddressTapEvent(context, selectedOption));
                    print('indexxxxx');
                    print(selectedOption);
                  },
                  child: const TextWidget(
                    title: "Apply",
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontWeight.font16,
                  )),
            ),
          )


          ],
        )
      ),
    ));
  }
}
