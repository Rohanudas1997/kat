import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kat_game/common/widgets/images/custom_cached_image.dart';

class DashboardTopSection extends StatelessWidget {
  const DashboardTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: const CustomCachedNetworkImage(
              url:
                  "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80",
              fit: BoxFit.cover,
              height: 32,
              width: 32,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bell_fill,
              color: CupertinoColors.systemGrey,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
