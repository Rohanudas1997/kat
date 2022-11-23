import 'package:flutter/material.dart';

class SettingsTile extends StatefulWidget {
  const SettingsTile({super.key, required this.title, required this.onTap});
  final String title;
  final Function() onTap;

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16
        ),
        
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromARGB(255, 209, 209, 209),
              blurRadius: 8,
              offset: Offset(0,4),
            )
          ]
        ),
        child: Row(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}