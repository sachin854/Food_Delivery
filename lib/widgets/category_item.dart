import 'package:flutter/cupertino.dart';
import '../resources/constants/dimensions.dart';
import 'component/text_widget.dart';

class CategoryItem extends StatefulWidget {
  String image;
  String name;
   CategoryItem({required this.image,required this.name,super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: Dimensions.dimen10,bottom: Dimensions.dimen10),
          padding: const EdgeInsets.only(top: Dimensions.dimen20,bottom: Dimensions.dimen10),
          height: Dimensions.dimen80,
          width: Dimensions.dimen80,
          child: Image.asset(widget.image,)
          // SvgPicture.asset(widget.image),
        ),
        TextWidget(title: widget.name,fontWeight: FontWeight.bold,),
        const SizedBox(height: Dimensions.dimen10,)
      ],
    );
  }
}
