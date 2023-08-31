import 'package:flutter/material.dart';

class MoreCategory extends StatefulWidget {
  static const routeName = "/more_category";
  const MoreCategory({super.key});

  @override
  State<MoreCategory> createState() => _MoreCategoryState();
}

class _MoreCategoryState extends State<MoreCategory> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text("See all")),
          ],
        ),
      ),
    ));
  }
}
