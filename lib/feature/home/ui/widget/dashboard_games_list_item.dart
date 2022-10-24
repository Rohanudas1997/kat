import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kat_game/common/widgets/images/custom_cached_image.dart';

class DashboardGameListItem extends StatelessWidget {
  const DashboardGameListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    this.onTap,
  });
  final String icon;
  final String title;
  final Color color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 227, 225, 225),
              blurRadius: 10,
              offset: Offset(0, 8),
            )
          ],
        ),
        height: 30,
        child: Row(
          children: [
            ClipRRect(
              child: Container(
                height: 34,
                width: 34,
                child: Image.asset(
                  icon,
                  color: color,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
