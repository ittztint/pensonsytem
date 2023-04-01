// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pensionsystem/UI/constant/colors.dart';

import '../UI/constant/text_styles.dart';
import '../UI/responsiveState/responsive_state.dart';
import '../UI/responsiveState/view_state.dart';

class CustomButtonLoad extends StatefulWidget {
  const CustomButtonLoad({
    Key? key,
    required this.onTap,
    required this.label,
    this.textColor = Colors.white,
    this.buttonColor,
    this.borderColor,
    required this.userProv,
  }) : super(key: key);

  final String label;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final VoidCallback onTap;
  final ViewState userProv;

  @override
  _CustomButtonLoadState createState() => _CustomButtonLoadState();
}

class _CustomButtonLoadState extends State<CustomButtonLoad> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: widget.buttonColor ?? appPrimaryColor,
          border: Border.all(color: widget.borderColor ?? appPrimaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: ResponsiveState(
            state: widget.userProv,
            idleWidget: Text(
              widget.label,
              textAlign: TextAlign.center,
              style:
                  txStyle14.copyWith(color: widget.textColor ?? Colors.black),
            ),
            busyWidget: SpinKitThreeInOut(
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
