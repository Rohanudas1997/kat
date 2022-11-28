import 'package:flutter/material.dart';
import 'package:kat_game/app/theme.dart';

class CustomRoundedButtom extends StatefulWidget {
  const CustomRoundedButtom({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
    this.padding,
    this.color,
    this.horizontalPadding = 12,
    this.verticalPadding = 16,
    this.fontSize = 16,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.w700,
  }) : super(key: key);
  final String title;
  final Function()? onPressed;
  final bool isDisabled;
  final bool isLoading;
  final Color? color;
  final EdgeInsets? padding;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;

  @override
  CustomRoundedButtomState createState() => CustomRoundedButtomState();
}

class CustomRoundedButtomState extends State<CustomRoundedButtom> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return InkWell(
      onTap: widget.onPressed,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: widget.padding ??
            EdgeInsets.symmetric(
              vertical: widget.verticalPadding,
              horizontal: widget.horizontalPadding,
            ),
        decoration: BoxDecoration(
          color: widget.isDisabled
              ? CustomTheme.lightGray.withOpacity(0.4)
              : (widget.color ?? _theme.primaryColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: _theme.textTheme.bodyText1!.copyWith(
                  fontWeight: widget.fontWeight,
                  color: widget.textColor,
                  fontSize: widget.fontSize,
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeOut,
                child: widget.isLoading
                    ? Container(
                        height: 14,
                        width: 14,
                        margin: const EdgeInsets.only(left: 8),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
