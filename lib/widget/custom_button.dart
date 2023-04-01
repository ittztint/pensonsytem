// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pensionsystem/UI/constant/colors.dart';

import '../UI/constant/text_styles.dart';


class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.label,
      this.textColor = Colors.white,
      this.borderColor,
      this.height = 58,
      this.buttonColor,
      this.loading = false})
      : super(key: key);

  final String label;
  final double height;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;

  final VoidCallback onTap;
  final bool loading;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: widget.height,
        decoration: BoxDecoration(
            color: widget.buttonColor ?? appPrimaryColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: widget.borderColor ?? Colors.white)),
        child: Center(
          child: Text(
            widget.label,
            textAlign: TextAlign.center,
            style: txStyle16.copyWith(
                color: widget.textColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
