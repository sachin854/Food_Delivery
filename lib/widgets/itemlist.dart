import 'package:finalapppp/widgets/component/text_widget.dart';
import 'package:flutter/cupertino.dart';

import '../resources/assets/images.dart';
import '../resources/constants/dimensions.dart';

class ItemList extends StatefulWidget {
  String image;
   ItemList({required this.image,super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: /*itemcount<1 ?? 0 :*/ 200,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, rowIndex) {
          final rowItems = List.generate(8, (index) => 1);
          return Wrap(
            spacing: 14.0, // Space between items
            children: rowItems.map((itemIndex) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: Dimensions.dimen20,bottom: Dimensions.dimen20),
                    height: Dimensions.dimen80,
                    width: Dimensions.dimen80,
                    child: Image.asset(widget.image
                    ),
                  ),
                  const TextWidget(title: "Hamburg",fontWeight: FontWeight.bold,)
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
