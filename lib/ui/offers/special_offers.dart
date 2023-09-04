import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/bloc/offers/offers_bloc.dart';
import '../../controller/bloc/offers/offers_state.dart';
import '../../resources/constants/color.dart';
import '../../widgets/offer_card.dart';
import '../home_screen/home_page.dart';

class SpecialOffers extends StatefulWidget {
  static const routeName = "/SpecialOffers";

  const SpecialOffers({super.key});

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  final List<Color> cardColors = [
    Colors.green,
    Colors.orange,
    Colors.pink,
    Colors.blue,
    // Add more colors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Special Offers',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColor.blackColor),
          ),
          backgroundColor: AppColor.primaryColor,
          leading:  BackButton(
            onPressed: (){
              Navigator.pushNamed(context, HomePage.routeName);
            },
            color: Colors.black,
          ),
        ),
          body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Column(children: [
            SingleChildScrollView(
              child: BlocBuilder<OffersBloc, OffersState>(
                builder: (context, state) {
                  if (state is OffersLoadingState) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.offerdata.length,
                          itemBuilder: (context, index) {
                            final selectedColor = cardColors[index % cardColors.length];
                            return Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: OfferCard(
                                color: selectedColor,
                               // color: cardColors[index % cardColors.length],
                                widget: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            state.offerdata[index]
                                                ["percentage"]!,
                                            style: const TextStyle(
                                                fontSize: 40,
                                                color: AppColor.whiteColor,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            state.offerdata[index]
                                                ["discountText"]!,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: AppColor.whiteColor,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            state.offerdata[index]
                                                ["validText"]!,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: AppColor.whiteColor,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ]),
        ),
      )),
    );
  }
}
