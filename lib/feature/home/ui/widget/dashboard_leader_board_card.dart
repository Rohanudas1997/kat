import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class DashboardLeaderBoardCard extends StatefulWidget {
  const DashboardLeaderBoardCard({
    super.key,
    required this.color,
    required this.icon,
  });
  final String icon;
  final Color color;

  @override
  State<DashboardLeaderBoardCard> createState() =>
      _DashboardLeaderBoardCardState();
}

class _DashboardLeaderBoardCardState extends State<DashboardLeaderBoardCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 227, 225, 225),
            blurRadius: 10,
            offset: Offset(0, 8),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: 150,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Image.asset(
                widget.icon,
                height: 80,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  8,
                  (index) => Row(
                    children: const [
                      Icon(
                        Icons.brightness_1_rounded,
                        size: 6,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Rohan Udas'),
                      Spacer(),
                      Text('400')
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
