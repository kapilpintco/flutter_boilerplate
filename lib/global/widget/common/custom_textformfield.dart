import 'package:flutter_boilerplate/global/utility/index.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController container;
  final String hint;
  final String hintText;
  final String labelText;
  final double radius;
  final Widget prefixIcon;
  final TextStyle style;
  final bool obscureText;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final double padding;
  final Color fillColor;
  final int maxLines;

  const CustomTextFormField({
    Key key,
    this.container,
    this.hint,
    this.hintText,
    this.labelText,
    this.radius = 10.0,
    this.prefixIcon,
    this.style,
    this.obscureText = false,
    this.validator,
    this.padding = 10,
    this.fillColor,
    this.maxLines = 1,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: container,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: appScreenUtil.screenWidth(10)),
                child: prefixIcon,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(appScreenUtil.borderRadius(radius)),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
        filled: true,
        fillColor: fillColor ?? Color(0xFFF5F6FA),
        contentPadding: EdgeInsets.all(appScreenUtil.screenWidth(padding)),
        hintText: hintText,
        // hintStyle: TextStyle(color: Colors.black38, fontWeight: FontWeight.w300),
        labelText: labelText,
      ),
      style: style,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
    );
  }
}
