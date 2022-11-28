import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kat_game/app/theme.dart';

class CustomTextInputFieldWithBorder extends StatefulWidget {
  const CustomTextInputFieldWithBorder({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.inputType = TextInputType.name,
    this.inputAction = TextInputAction.next,
    this.validator,
    this.readOnly = false,
    this.obscureText = false,
    this.prefix,
    this.errorText,
    this.maxLength,
    this.onTap,
    this.onChanged,
    this.prefixIconSize = 22,
    this.prefixIconColor,
    this.maxLines,
    this.borderRadius = 50,
    this.bottomMargin = 24,
    this.leading,
    this.onEditingComplete,
    this.enableCounterText = false,
    this.fontSize = 16,
    this.inputFormatters,
    this.showSuffix = false,
  }) : super(key: key);
  final String title, hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final String? Function(String?)? validator;
  final bool readOnly, obscureText;
  final IconData? prefix;
  final String? errorText;
  final int? maxLength;
  final Function()? onTap;
  final Function(String)? onChanged;
  final double prefixIconSize;
  final Color? prefixIconColor;
  final int? maxLines;
  final double borderRadius;
  final double bottomMargin;
  final Widget? leading;
  final Function()? onEditingComplete;
  final bool enableCounterText;
  final double fontSize;
  final List<TextInputFormatter>? inputFormatters;
  final bool showSuffix;
  @override
  _CustomTextInputFieldStateWithBorder createState() =>
      _CustomTextInputFieldStateWithBorder();
}

class _CustomTextInputFieldStateWithBorder
    extends State<CustomTextInputFieldWithBorder> {
  bool _isObscureText = false;

  @override
  void initState() {
    super.initState();
    _isObscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(bottom: widget.bottomMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isNotEmpty)
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: _theme.textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: widget.fontSize,
                      letterSpacing: 0.28,
                      height: 1.3,
                    ),
                  ),
                  if (widget.leading != null) widget.leading!
                ],
              ),
            ),
          if (widget.title.isNotEmpty)
            SizedBox(
              height: 12,
            ),
          Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: widget.controller,
                      textInputAction: widget.inputAction,
                      keyboardType: widget.inputType,
                      validator: widget.validator,
                      cursorColor: _theme.primaryColor,
                      maxLength: widget.maxLength,
                      readOnly: widget.readOnly,
                      maxLines: widget.maxLines,
                      obscureText: _isObscureText,
                      inputFormatters: widget.inputFormatters,
                      onTap: widget.onTap ?? () {},
                      style: _theme.textTheme.headline5!.copyWith(
                        color: CustomTheme.primaryColor,
                        letterSpacing: 0.2,
                      ),
                      onChanged: widget.onChanged,
                      onEditingComplete: () {
                        if (widget.inputAction == TextInputAction.done) {
                          FocusScope.of(context).unfocus();
                        } else {
                          FocusScope.of(context).nextFocus();
                        }
                        if (widget.onEditingComplete != null) {
                          widget.onEditingComplete!();
                        }
                      },
                      decoration: InputDecoration(
                        errorText: widget.errorText,
                        contentPadding: EdgeInsets.only(
                          left: 8,
                          bottom: (widget.maxLines ?? 0) > 3 ? 20 : 8,
                          top: (widget.maxLines ?? 0) > 3 ? 20 : 8,
                          right: 8,
                        ),
                        counterText: widget.enableCounterText ? null : "",
                        counterStyle: _theme.textTheme.bodyText1!.copyWith(
                          fontSize: 10,
                          letterSpacing: 0.1,
                        ),
                        errorStyle: _theme.textTheme.bodyText1!.copyWith(
                          color: Colors.red,
                          letterSpacing: 0.2,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: widget.prefix == null
                            ? null
                            : Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  widget.prefix,
                                  size: widget.prefixIconSize,
                                  color: widget.prefixIconColor,
                                ),
                              ),
                        hintText: widget.hintText,
                        hintStyle: _theme.textTheme.headline5!.copyWith(
                          letterSpacing: 0.2,
                          color: CustomTheme.lightTextColor.withOpacity(0.5),
                        ),
                        fillColor: Colors.white,
                        border: _border(),
                        focusedBorder: _border(color: CustomTheme.primaryColor),
                        enabledBorder: _border(),
                        errorBorder: _border(isErrorBorder: true),
                      ),
                    ),
                  ),
                ],
              ),
              if (widget.showSuffix)
                Positioned(
                  right: 0,
                  top: 3,
                  bottom: 11,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscureText = !_isObscureText;
                      });
                    },
                    icon: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        _isObscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 18,
                        color: CustomTheme.primaryColor,
                      ),
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }

  OutlineInputBorder _border({bool isErrorBorder = false, Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color == null ? CustomTheme.lightGray.withOpacity(0.5) : color,
        width: 1,
      ),
    );
  }
}
