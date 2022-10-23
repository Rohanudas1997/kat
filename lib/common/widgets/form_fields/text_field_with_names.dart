import 'package:flutter/material.dart';
import 'package:kat_game/common/widgets/form_fields/input_field_decoration.dart';

class FormFieldsWithName extends StatelessWidget {
  const FormFieldsWithName({
    required this.name, 
    required this.textEditingController,
    this.action = TextInputAction.next,
    this.isObscure = false,
    this.onTap,
    this.icon,
  });
  final String name;
  final TextEditingController textEditingController;
  final TextInputAction action;
  final bool isObscure;
  final Function? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: textEditingController,
          textInputAction: action,
          obscureText: isObscure,
          decoration: InputFieldDecoration.getInputFieldDecoration(context,onTap, icon),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}