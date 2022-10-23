import 'package:flutter/material.dart';

class InputFieldDecoration{
  static getInputFieldDecoration(context, onTap, icon){
    return InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12
                        ),
                        suffixIcon: IconButton(
                          onPressed: (){
                            onTap();
                          },
                          icon: Icon(
                            icon,
                            color: Theme.of(context).primaryColor,
                          ),
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