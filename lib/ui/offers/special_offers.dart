import 'package:finalapppp/controller/bloc/offers/offers_bloc.dart';
import 'package:finalapppp/controller/bloc/offers/offers_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resources/constants/color.dart';
import '../../widgets/offerbadge.dart';

class SpecialOffers extends StatefulWidget {
  static const routeName = "/SpecialOffers";

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back)),
                Text(
                  'Special Offers',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SingleChildScrollView(
              child: BlocBuilder<OffersBloc, OffersState>(
                builder: (context, state) {
                  if (state is OffersLoadingState) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.offerdata.length,
                          itemBuilder: (context, index) {
                            List<Color> cardColors = [
                              Colors.green,
                              Colors.orange,
                              Colors.pink.shade300,
                              Colors.blue.shade300
                            ];
                            return Container(
                              margin: EdgeInsets.only(top: 20),
                              child: OfferCard(
                                color: cardColors[index % cardColors.length],
                                widget: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            state.offerdata[index]
                                                ["percentage"]!,
                                            style: TextStyle(
                                                fontSize: 40,
                                                color: AppColor.whiteColor,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            state.offerdata[index]
                                                ["discountText"]!,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: AppColor.whiteColor,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            state.offerdata[index]
                                                ["validText"]!,
                                            style: TextStyle(
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
                    return Center(
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
