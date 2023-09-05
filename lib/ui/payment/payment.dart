import 'package:finalapppp/ui/CheckoutOrders/deliver_address_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/bloc/payment/payment_bloc.dart';
import '../../controller/bloc/payment/payment_event.dart';
import '../../controller/bloc/payment/payment_state.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import '../../resources/constants/font_weight.dart';
import '../../resources/constants/padding.dart';
import '../../services/rest_api/client.dart';
import '../../widgets/component/text_widget.dart';
import '../../widgets/component/textfield_widget.dart';
import '../../widgets/payment_card.dart';

class Payment extends StatefulWidget {
  double totalPrice;
  static const routeName = "/payment";
   Payment({super.key,required this.totalPrice});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int selectedIndex = 0;

  List discountArray =  RestApiClientService.shared.discountArray;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.whiteColor,
          leading: const BackButton(
            color: AppColor.blackColor,
          ),
          title: const Row(
            children: [
              TextWidget(
                title: "Payment Method",
                titleColor: AppColor.blackColor,
                fontWeight: FontWeight.bold,
              ),
              Spacer(),
              Icon(
                Icons.qr_code,
                color: AppColor.blackColor,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: BlocConsumer<PaymentBloc, PaymentState>(
          listener: (context, state) {
            if (state is PaymentAppyTappedState) {

            }
            if (state is PaymentCardSelectionTappedState) {
              selectedIndex=state.selectedIndex;
              if (kDebugMode) {
                print("Card Selected${state.selectedIndex}");
              }
            }
          },
          builder: (context, state) {
            if (state is PaymentLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PaymentLoadedState) {
              return Column(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.paymentData.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<PaymentBloc>()
                                  .add(PaymentCardTapEvent(index));
                            },
                            child: PaymentCard(
                              icons: state.paymentData[index]['icon'],
                              paymentTitle: state.paymentData[index]['title'],
                              price: "\$ ${widget.totalPrice}",
                              isSelected: selectedIndex == index,
                              onChanged: (value) {
                                context
                                    .read<PaymentBloc>()
                                    .add(PaymentCardTapEvent(index));

                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.only(
                              left: Dimensions.dimen15,
                              top: Dimensions.dimen30,
                              right: Dimensions.dimen15),
                          height: MediaQuery.of(context).size.height * 0.80,
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Center(
                                  child: TextWidget(
                                title: "Add Card Details",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                              const SizedBox(height: 20,),
                              const TextWidget(
                                title: "Enter the Card No:",
                                fontWeight: FontWeight.normal,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.2),
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.1)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextFormFieldWidget(
                                    onTap: () {},
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.length != 10) {
                                        return "Please enter valid card number";
                                      }
                                      return null;
                                    },
                                    autovalidateMode: AutovalidateMode.disabled,
                                  ),
                                ),
                              ),
                            ],
                          ), // Create a new widget for the form
                        );
                      },
                    );
                  },
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: Paddings.padding16,
                          right: Paddings.padding16,
                          bottom: Paddings.padding10,
                          top: Paddings.padding10),
                      height: Dimensions.dimen50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColor.greenColor.withOpacity(0.1),
                          borderRadius:
                              BorderRadius.circular(Dimensions.dimen35)),
                      child: const Center(
                          child: TextWidget(
                        title: "Add New Card",
                        fontSize: AppFontWeight.font12,
                        titleColor: AppColor.greenColor,
                        fontWeight: FontWeight.w700,
                      ))),
                ),
                const Divider(
                  thickness: 1,
                ),
              ]);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(
              left: Paddings.padding16,
              right: Paddings.padding16,
              top: Paddings.padding10,
              bottom: Paddings.padding20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: Dimensions.dimen50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColor.whiteColor,
                  backgroundColor:
                      AppColor.greenColor, // Set the button's text color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(36), // Set the corner radius here
                  ),
                ),
                onPressed: () {},
                child: const TextWidget(
                  title: "Apply",
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontWeight.font16,
                )),
          ),
        ),
      ),
    );
  }
}
