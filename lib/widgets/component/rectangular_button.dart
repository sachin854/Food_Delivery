import 'package:flutter/material.dart';
import '../../resources/constants/padding.dart';
import '../../widgets/component/text_widget.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';

class RectangleButtonWidget extends StatelessWidget {
  final String title;
  final bool rounded;
  final EdgeInsets? padding;
  final Color? titleColor;
  final Color? backgroundColor;
  final GestureTapCallback? onPressed;
  final ShapeBorder? shape;
  final double elevation;
  final BoxConstraints? boxConstraints;
  final MaterialTapTargetSize materialTapTargetSize;
  final bool disableRipple;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? suffixIconCenter;
  final Color? borderColor;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool isLoading;
  final double? width;
  final Color? loadingColor;
  final Color? progressColor;
  final String? subTitle;
  final Color? subTextColor;
  final double? subFontSize;
  final FontWeight? subFontWeight;
  final TextDecoration? textDecoration;

  const RectangleButtonWidget({super.key,
    required this.title,
    this.onPressed,
    this.rounded = false,
    this.padding,
    this.backgroundColor,
    this.shape,
    this.elevation = 0,
    this.boxConstraints ,
    this.materialTapTargetSize = MaterialTapTargetSize.shrinkWrap,
    this.disableRipple = false,
    this.titleColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.verticalPadding,
    this.horizontalPadding,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.isLoading = false,
    this.width,
    this.loadingColor,
    this.progressColor,
    this.subTitle,
    this.subTextColor,
    this.subFontSize,
    this.subFontWeight,
    this.textDecoration,
    this.suffixIconCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: elevation,
        fillColor: backgroundColor ?? Theme.of(context).primaryColor,
        onPressed: onPressed ,
        shape: shape ??
            (rounded ? const StadiumBorder() :  RoundedRectangleBorder(
                side: BorderSide(color: borderColor ?? Theme.of(context).primaryColor,),
                borderRadius: BorderRadius.circular(borderRadius ?? Paddings.buttonRadius)
            )),
        constraints: boxConstraints ?? const BoxConstraints(),
        materialTapTargetSize: materialTapTargetSize,
        padding:  EdgeInsets.symmetric(vertical: verticalPadding ?? 0.0, horizontal: horizontalPadding ?? 0.0),
        highlightColor:
        disableRipple ? Colors.transparent : Theme.of(context).highlightColor,
        splashColor:
        disableRipple ? Colors.transparent : Theme.of(context).splashColor,
        highlightElevation: disableRipple ? 0 : elevation,
        child: suffixIconCenter == true?
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
              children: [
                if(prefixIcon != null ) prefixIcon!,
                if(prefixIcon != null ) SizedBox(width: width ?? Dimensions.dimen15,),
                isLoading ?AbsorbPointer(
                  child: Container(
                    color: loadingColor ?? AppColor.primaryColor,
                    height: Dimensions.dimen15,
                    width: Dimensions.dimen15,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      strokeWidth: Dimensions.dimen2,
                      valueColor: AlwaysStoppedAnimation<Color>(progressColor ?? AppColor.whiteColor) ,
                    ),
                  ),
                ):TextWidget(
                  title: title,
                  textAlign: textAlign,
                  fontWeight: fontWeight,
                  titleColor: titleColor ?? AppColor.blackColor,
                  fontSize: fontSize,
                ),
                if(subTitle != null )
                  const SizedBox(height: Dimensions.dimen5,),
                if(subTitle != null )
                  TextWidget(title: subTitle.toString(), fontSize: subFontSize, fontWeight: subFontWeight, titleColor: subTextColor,),
              ],
            ),
            if(suffixIcon != null ) SizedBox(width: width ?? Dimensions.dimen15,),
            if(suffixIcon != null ) suffixIcon!
          ],
        ):
        (prefixIcon != null || suffixIcon != null) ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
              children: [
                if(prefixIcon != null ) prefixIcon!,
                if(prefixIcon != null ) SizedBox(width: width ?? Dimensions.dimen15,),
                isLoading ?AbsorbPointer(
                  child: Container(
                    color: loadingColor ?? AppColor.primaryColor,
                    height: Dimensions.dimen15,
                    width: Dimensions.dimen15,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      strokeWidth: Dimensions.dimen2,
                      valueColor: AlwaysStoppedAnimation<Color>(progressColor ?? AppColor.whiteColor) ,
                    ),
                  ),
                ):TextWidget(
                  title: title,
                  textAlign: textAlign,
                  fontWeight: fontWeight,
                  titleColor: titleColor ?? AppColor.blackColor,
                  fontSize: fontSize,
                ),
                if(suffixIcon != null ) SizedBox(width: width ?? Dimensions.dimen15,),
                if(suffixIcon != null ) suffixIcon!
              ],
            ),
            if(subTitle != null )
              const SizedBox(height: Dimensions.dimen15,),
            if(subTitle != null )
              TextWidget(title: subTitle.toString(), fontSize: subFontSize, fontWeight: subFontWeight, titleColor: subTextColor,),
          ],
        ):
        isLoading ?AbsorbPointer(
          child: Container(
            color: loadingColor ?? AppColor.primaryColor,
            height: Dimensions.dimen15,
            width: Dimensions.dimen15,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              strokeWidth: Dimensions.dimen2,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor ?? AppColor.whiteColor) ,
            ),
          ),
        ) : TextWidget(
            title: title,
            textAlign: textAlign,
            fontWeight: fontWeight,
            titleColor: titleColor ?? AppColor.blackColor,
            fontSize: fontSize,
            textDecoration: textDecoration
        )
    );
  }
}
