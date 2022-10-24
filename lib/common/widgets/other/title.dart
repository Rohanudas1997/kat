import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({required this.title, this.isView, this.function});
  final String title;
  final bool? isView;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          isView ?? false
              ? GestureDetector(
                  onTap: () => function,
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
