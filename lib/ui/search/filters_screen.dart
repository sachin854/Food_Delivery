// import 'package:finalapppp/resources/constants/color.dart';
// import 'package:finalapppp/resources/constants/font_weight.dart';
// import 'package:flutter/material.dart';
//
// import '../../resources/constants/padding.dart';
//
// class ApplyFiltersScreen extends StatefulWidget {
//   const ApplyFiltersScreen({super.key});
//
//   @override
//   State<ApplyFiltersScreen> createState() => _ApplyFiltersScreenState();
// }
//
// class _ApplyFiltersScreenState extends State<ApplyFiltersScreen> {
//  late TabController _controller;
//   int _selectedIndex = 0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _controller = TabController(length: 5, vsync: this);
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return DefaultTabController(
//         length: 5,
//         child: Scaffold(
//           backgroundColor: AppColor.transparentColor,
//           appBar: AppBar(
//             backgroundColor: AppColor.transparentColor,
//             elevation: 0,
//             title:  Text(
//               "Filter",
//               style: TextStyle(
//                   color: AppColor.blackColor, fontSize: AppFontWeight.font16),
//             ),
//             leading: const Icon(
//               Icons.close,
//               color: AppColor.blackColor,
//             ),
//             bottom:  TabBar(
//
//               controller: _controller,
//                 indicatorColor: AppColor.greenColor,
//                 indicatorWeight: 3,
//                 indicatorPadding: EdgeInsets.all(2),
//                 labelColor: AppColor.blackColor,
//                 tabs: [
//                   Tab(
//                     text: "Sort By",
//                   ),
//                   Tab(
//                     text: "Restaurant",
//                   ),
//                   Tab(
//                     text: "Delivery Fee",
//                   ),
//                   Tab(
//                     text: "Mode",
//                   ),
//                   Tab(
//                     text: "Cuisines",
//                   ),
//                 ]),
//           ),
//           body: TabBarView(children: [
//             Container(
//               margin: const EdgeInsets.only(
//                   left: Paddings.padding16,right: Paddings.padding16, ),
//               color: AppColor.transparentColor,
//               child: Container(
//                 height: 100,
//                 width: MediaQuery.of(context).size.width,
//                 margin: const EdgeInsets.only(top: Paddings.padding10, bottom: Paddings.padding10),
//                 padding: const EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                     color: AppColor.redColor,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: AppColor.greyColor.withOpacity(0.1),
//                         spreadRadius: 5,
//                         blurRadius: 10,
//                         offset: const Offset(1, 2),
//                       ),
//                     ]),
//               ),
//             ),
//
//
//
//           ],),
//         ));
//   }
// }
