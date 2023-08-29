import 'package:flutter/cupertino.dart';

class DiscountCard extends StatefulWidget {
  const DiscountCard({super.key});

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: /*itemcount<1 ?? 0 :*/ 500,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Image.network(
                "https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg"),
          );
        },
      ),
    );
  }
}
