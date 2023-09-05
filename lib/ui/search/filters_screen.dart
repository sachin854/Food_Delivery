import 'package:finalapppp/resources/constants/font_weight.dart';
import 'package:finalapppp/resources/constants/padding.dart';
import 'package:finalapppp/widgets/component/text_widget.dart';
import 'package:flutter/material.dart';

import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';

class ApplyFiltersScreen extends StatefulWidget {
  static const routeName="applyFilters";
  const ApplyFiltersScreen({Key? key}) : super(key: key);

  @override
  State<ApplyFiltersScreen> createState() => _ApplyFiltersScreenState();
}

class _ApplyFiltersScreenState extends State<ApplyFiltersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedOption = 1;
  List sortBy = ['Recommended', 'Popularity', 'Rating', 'Distance'];
  List restaurant = [
    'Promo',
    'Priority Restaurant',
    'Rating',
    'Small MSME Restaurant'
  ];
  List deliveryFee = [
    'Any',
    'Less than \$2.00',
    'Less than \$4.00',
  ];
  List mode = ['Delivery', 'Self Pick-up', 'Rating', 'Distance'];
  List cuisine = [
    {
      'title': 'Dessert',
      'isChecked': false,
    },
    {
      'title': 'Beverages',
      'isChecked': false,
    },
    {
      'title': 'Snack',
      'isChecked': true,
    },
    {
      'title': 'Chicken',
      'isChecked': true,
    },
    {
      'title': 'Bakery and Cakes',
      'isChecked': true,
    },
  ];
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const TextWidget(
          titleColor: AppColor.blackColor,
            fontSize: AppFontWeight.font18,
         title: "Filter",
        ),
        leading:  InkWell(
          onTap: (){Navigator.pop(context);},
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        bottom: TabBar(
          isScrollable: true,
          controller: _controller,
          indicatorColor: Colors.green,
          indicatorWeight: 3,
          indicatorPadding: EdgeInsets.all(2),
          labelColor: Colors.black,
          tabs: const [
            Tab(
              text: "Sort By",
            ),
            Tab(
              text: "Restaurant",
            ),
            Tab(
              text: "Delivery Fee",
            ),
            Tab(
              text: "Mode",
            ),
            Tab(
              text: "Cuisines",
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: 350,
        child: TabBarView(
          controller: _controller,
          children: [
            Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 16,
                  right: 16,
                ),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      title: "Sort by",
                      fontWeight: FontWeight.w500,
                      fontSize: AppFontWeight.font18,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                          itemCount: sortBy.length,
                          itemBuilder: (context, index) {
                            return RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: TextWidget(
                                title: sortBy[index],
                                fontWeight: FontWeight.w500,
                                fontSize: AppFontWeight.font16,
                              ),
                              value: index,
                              groupValue: _selectedOption,
                              fillColor:
                                  MaterialStateProperty.all(Colors.green),
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              },
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 16,
                  right: 16,
                ),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      title: "Restaurant",
                      fontWeight: FontWeight.w500,
                      fontSize: AppFontWeight.font18,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                          itemCount: restaurant.length,
                          itemBuilder: (context, index) {
                            return RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: TextWidget(
                                title: restaurant[index],
                                fontWeight: FontWeight.w500,
                                fontSize: AppFontWeight.font16,
                              ),
                              value: index,
                              groupValue: _selectedOption,
                              fillColor:
                                  MaterialStateProperty.all(Colors.green),
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              },
                            );
                          }),
                    ),
                    // Add more RadioListTile widgets for other options
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 16,
                  right: 16,
                ),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      title: "Delivery Fee",
                      fontWeight: FontWeight.w500,
                      fontSize: AppFontWeight.font18,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                          itemCount: deliveryFee.length,
                          itemBuilder: (context, index) {
                            return RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: TextWidget(
                                title: deliveryFee[index],
                                fontWeight: FontWeight.w500,
                                fontSize: AppFontWeight.font16,
                              ),
                              value: index,
                              groupValue: _selectedOption,
                              fillColor:
                                  MaterialStateProperty.all(Colors.green),
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              },
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 16,
                  right: 16,
                ),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      title: "Mode",
                      fontWeight: FontWeight.w500,
                      fontSize: AppFontWeight.font18,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                          itemCount: mode.length,
                          itemBuilder: (context, index) {
                            return RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: TextWidget(
                                title: mode[index],
                                fontWeight: FontWeight.w500,
                                fontSize: AppFontWeight.font16,
                              ),
                              value: index,
                              groupValue: _selectedOption,
                              fillColor:
                                  MaterialStateProperty.all(Colors.green),
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              },
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 16,
                right: 16,
              ),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(1, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    title: "Mode",
                    fontWeight: FontWeight.w500,
                    fontSize: AppFontWeight.font18,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  for (int i = 0; i < cuisine.length; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(
                                  width: 2, color: Colors.green),
                            ),
                            activeColor: Colors.green.withOpacity(1.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            value: cuisine[i]['isChecked'],
                            onChanged: (newValue) {
                              setState(() {
                                cuisine[i]['isChecked'] = newValue!;
                              });
                            }),
                        TextWidget(
                          title: cuisine[i]['title'],
                          fontWeight: FontWeight.w500,
                          fontSize: AppFontWeight.font16,
                        ),
                      ],
                    ),
                ],
              ),
            ),

            // Repeat the container for other tabs as needed
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
            left: Paddings.padding16,
            right: Paddings.padding16,
            bottom: Paddings.padding20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: Dimensions.dimen50,
                width: 170,
                decoration: BoxDecoration(
                    color: AppColor.greenColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40)),
                child: const Center(
                    child: TextWidget(
                  title: "Reset",
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontWeight.font16,
                  titleColor: AppColor.greenColor,
                ))),
            SizedBox(
              width: 170,
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
                  onPressed: () {},
                  child: const TextWidget(
                    title: "Apply",
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontWeight.font16,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
