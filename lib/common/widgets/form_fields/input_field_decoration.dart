import 'package:flutter/material.dart';

class InputFieldDecoration{
  static getInputFieldDecoration(context){
    return InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          )
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          )
                        )
                      );
  }
}