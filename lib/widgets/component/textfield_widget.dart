import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../resources/constants/color.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
   final Iterable<String>? autofillHints;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final void Function(String?)? onFieldSubmitted;
  final int? inputFormatterLength;
  final TextEditingController? textEditingController;
  final double? height;
  final double? width;
  final Color? fillColor;
  final Color? textColor;
  final double? textSize;
  bool? fill;
  bool? autoFocus;
  FloatingLabelBehavior? floatingLabelBehavior;

   TextFormFieldWidget({super.key,
    this.keyboardType,
    this.inputAction,
    this.hintText,
    this.errorText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.autovalidateMode,
     this.autofillHints,
    this.onSaved,
    this.inputFormatterLength,
    this.textEditingController,
    this.width,
    this.height,
    this.fillColor,
    this.textColor,
    this.textSize,
    this.fill,
     this.floatingLabelBehavior,
     this.onTap,
     this.onChanged,
     this.onFieldSubmitted,
     this.autoFocus,
     //this.focusNode
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        controller: textEditingController,
        inputFormatters: [LengthLimitingTextInputFormatter(inputFormatterLength ?? -1)],
        keyboardType: keyboardType,
        autofocus: autoFocus ?? false,
        textInputAction: inputAction ?? TextInputAction.done,
        decoration: InputDecoration(
          filled: fill,
          fillColor: fillColor,
          floatingLabelBehavior: floatingLabelBehavior ?? FloatingLabelBehavior.always,
          border: UnderlineInputBorder( // Add underline border
             borderSide: BorderSide(width: 1, color: AppColor.greyColor.withOpacity(0.3))
          ),
          focusedBorder: UnderlineInputBorder( // Add underline border when focused
              borderSide: BorderSide(width: 1, color: AppColor.greyColor.withOpacity(0.3))
          ),
          enabledBorder: UnderlineInputBorder( // Add underline border when enabled
              borderSide: BorderSide(width: 1, color: AppColor.greyColor.withOpacity(0.3))
          ),
          suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText ?? "",
          labelText: labelText ?? "",
          hintStyle:  TextStyle(
            color: textColor, fontSize: textSize,),
          labelStyle: TextStyle(
              color: textColor, fontSize: textSize),
          errorText: errorText,
          errorStyle: TextStyle(
              color: Colors.red, fontSize: textSize),
        ),
        validator: validator ,
        autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
        onSaved: onSaved,
        onTap: onTap,
        onChanged: onChanged,
        // onFieldSubmitted: (value) => onFieldSubmitted!(value)
      ),
    );
  }
}
