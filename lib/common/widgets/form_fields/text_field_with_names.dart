import 'package:flutter/material.dart';
import 'package:kat_game/common/widgets/form_fields/input_field_decoration.dart';

class FormFieldsWithName extends StatelessWidget {
  const FormFieldsWithName({
    required this.name, 
    required this.textEditingController,
    this.action = TextInputAction.next,
  });
  final String name;
  final TextEditingController textEditingController;
  final TextInputAction action;

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
          decoration: InputFieldDecoration.getInputFieldDecoration(context),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}