// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pensionsystem/UI/constant/text_styles.dart';



class CustomTextField extends StatefulWidget {
  final bool? hasLeading;
  final bool? isDate;
  final bool isCard;
  final bool? readOnly;
  final bool? changePhoneNumber;
  final int? maxLines;
  final Widget? prefix;
  final String? hintText;
  final String? labelText;
  final bool? hasBorder;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final IconData? suffixData;
  final VoidCallback? onTap;
  final String? imgUri;
  final TextInputFormatter? formatters;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final AutovalidateMode? autovalidateMode;

  ///labelText cannot be used when hintText is used
  CustomTextField({
    Key? key,
    this.hasLeading = false,
    this.isDate = false,
    this.isCard = false,
    this.readOnly = false,
    this.changePhoneNumber = false,
    this.formatters,
    this.maxLines,
    this.validator,
    this.prefix,
    this.hintText,
    this.labelText,
    this.hasBorder,
    this.obscureText = false,
    this.suffixData,
    this.onTap,
    this.imgUri,
    this.controller,
    this.textInputAction = TextInputAction.done,
    this.textInputType,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hide = false;
  @override
  void initState() {
    super.initState();
    hide = widget.obscureText!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: TextFormField(
                autocorrect: false,
                inputFormatters: [
                  widget.formatters ?? FilteringTextInputFormatter.deny(''),
                ],
                autovalidateMode: widget.autovalidateMode,
                keyboardType: widget.textInputType,
                textInputAction: widget.textInputAction,
                readOnly: widget.readOnly!,
                controller: widget.controller,
                onTap: widget.onTap,
                obscureText: hide,
                obscuringCharacter: '•',
                maxLines: widget.maxLines ?? 1,
                validator: widget.validator,
                style: txStyle14,
                decoration: InputDecoration(
                  labelText: widget.labelText,

                  prefixIcon: widget.prefix,
                  isDense: false,
                  fillColor: Colors.white,
                  suffixIcon: widget.obscureText!
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              hide = !hide;
                            });
                          },
                          icon: !hide
                              ? Icon(
                                  Icons.visibility_outlined,
                                  color: Color(0xffA5D0DB),
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                  color: Color(0xffA5D0DB),
                                ),
                        )
                      : widget.suffixData != null
                          ? Icon(
                              widget.suffixData,
                              color: Colors.black,
                            )
                          : null,
                  filled: true,
                  //labelText: widget.labelTex
                  hintText: widget.hintText,
                  hintStyle: txStyle14
                      .copyWith(color: Colors.black.withOpacity(0.5)),
                  labelStyle: txStyle14,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff667080).withOpacity(0.4)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
