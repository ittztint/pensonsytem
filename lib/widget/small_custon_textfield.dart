import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../UI/constant/sizeconfig.dart';
import '../UI/constant/text_styles.dart';


typedef StringCallback<T> = String? Function(String?);

class SmallCustomTextField extends StatefulWidget {
  final bool? isDate;
  final bool? isPassword;
  final bool? readOnly;
  final int? maxLines;
  final int? minLines;
  final StringCallback? validator;
  final Widget? prefix;
  final Widget? suffixData;
  final String? hintText;
  final String? labelText;
  final String? labelText2;
  final bool? obscureText;
  final Widget? trailing;
  final bool? hasBorder;
  final VoidCallback? onTap;
  final Color? fillColor;
  final StringCallback? onChanged;
  final IconData? icondata;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final AutovalidateMode? autovalidateMode;
  final StringCallback? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormtter;

  ///labelText cannot be used when hintText is used
  SmallCustomTextField(
      {Key? key,
      this.validator,
      this.hintText,
      this.obscureText = false,
      this.onTap,
      this.isPassword = false,
      this.controller,
      this.readOnly = false,
      this.textInputAction = TextInputAction.done,
      this.textInputType,
      this.trailing,
      this.autovalidateMode,
      this.labelText = '',
      this.labelText2,
      this.prefix,
      this.maxLines,
      this.icondata,
      this.hasBorder = true,
      this.suffixData,
      this.onFieldSubmitted,
      this.onChanged,
      this.minLines,
      this.fillColor = Colors.white,
      this.inputFormtter = const [],
      this.isDate = false});

  @override
  _SmallCustomTextFieldState createState() => _SmallCustomTextFieldState();
}

class _SmallCustomTextFieldState extends State<SmallCustomTextField> {
  late bool hide;

  @override
  void initState() {
    super.initState();
    hide = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText!.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthOf(1), vertical: 2.75),
                child: Text(widget.labelText!,
                    style: txStyle12.copyWith(
                        fontWeight: FontWeight.w300, color: Colors.grey)),
              )
            : SizedBox.shrink(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.icondata != null ? Icon(widget.icondata) : Container(),
            widget.icondata != null
                ? SizedBox(
                    width: 16,
                  )
                : Container(),
            Expanded(
              child: TextFormField(
                autocorrect: false,
                textAlign:
                    widget.isPassword! ? TextAlign.center : TextAlign.left,
                enableSuggestions: false,
                scrollPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                autovalidateMode: widget.autovalidateMode,
                keyboardType: widget.textInputType,
                textInputAction: widget.textInputAction,
                readOnly: widget.readOnly!,
                controller: widget.controller,
                onTap: widget.onTap,
                inputFormatters: widget.inputFormtter,
                obscureText: hide,
                minLines: widget.minLines,
                onFieldSubmitted: widget.onFieldSubmitted,
                maxLines: widget.maxLines ?? 1,
                validator: widget.validator,
                onChanged: widget.onChanged ?? widget.onChanged,
                decoration: InputDecoration(
                  prefixIcon: widget.prefix,
                  isDense: false,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  labelText: widget.labelText2,
                  fillColor: widget.fillColor,
                  errorStyle: TextStyle(height: 0.5, fontSize: 10),
                  // errorBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.amber),
                  //   borderRadius: BorderRadius.all(Radius.circular(5)),
                  // ),
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
                                  color: Theme.of(context).primaryColor,
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                  color: Theme.of(context).primaryColor,
                                ),
                        )
                      : widget.suffixData != null
                          ? widget.suffixData
                          : Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: widget.trailing ?? null,
                            ),
                  // filled: true,
                  // labelText: widget.labelText,
                  hintText: widget.hintText,
                  hintStyle: txStyle13.copyWith(color: Colors.grey),

                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  // fillColor: Color(0xffD8D8D8).withOpacity(.3),
                  enabledBorder: widget.hasBorder!
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).hintColor, width: .6),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )
                      : UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).hintColor),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  border: widget.hasBorder!
                      ? OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )
                      : UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).hintColor),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
