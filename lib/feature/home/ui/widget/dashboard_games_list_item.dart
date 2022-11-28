import 'package:flutter/material.dart';

class DashboardGameListItem extends StatelessWidget {
  const DashboardGameListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.available,
    required this.total,
    this.onTap,
  });
  final String icon;
  final String title;
  final Color color;
  final String available;
  final String total;
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
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  available + ' / ' + total + '\nAvailable',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
