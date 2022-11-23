import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kat_game/common/constant/images.dart';
import 'package:kat_game/common/widgets/other/title.dart';
import 'package:kat_game/feature/home/controller/home_controller.dart';
import 'package:kat_game/feature/home/ui/widget/dashboard_carosel_section.dart';
import 'package:kat_game/feature/home/ui/widget/dashboard_games_list_item.dart';
import 'package:kat_game/feature/home/ui/widget/dashboard_leader_board_card.dart';
import 'package:kat_game/feature/home/ui/widget/dashboard_top_section.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  HomeController homeController = Get.find();

  
  List<Widget> leaderBoardItem = [
    const DashboardLeaderBoardCard(
      color: CupertinoColors.activeGreen,
      icon: Images.bowlingball,
    ),
    const DashboardLeaderBoardCard(
      color: CupertinoColors.systemRed,
      icon: Images.snooker,
    ),
    const DashboardLeaderBoardCard(
      color: CupertinoColors.activeOrange,
      icon: Images.control,
    ),
    const DashboardLeaderBoardCard(
      color: CupertinoColors.systemYellow,
      icon: Images.tennisIcon,
    )
  ];

  List<Widget> items = [
    const DashboardGameListItem(
      icon: Images.bowlingball,
      title: 'Bowling',
      color: CupertinoColors.activeGreen,
    ),
    const DashboardGameListItem(
      icon: Images.snooker,
      title: 'Pool',
      color: CupertinoColors.systemRed,
    ),
    const DashboardGameListItem(
      icon: Images.control,
      title: 'PlayStation',
      color: CupertinoColors.activeOrange,
    ),
    const DashboardGameListItem(
      icon: Images.tennisIcon,
      title: 'Ping pong',
      color: CupertinoColors.systemYellow,
    ),
  ];


  @override
  void initState() {
    homeController.getGamesStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 42,
            ),
          ),
          const SliverToBoxAdapter(
            child: DashboardTopSection(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          const SliverToBoxAdapter(
            child: DashboardCarouselSlider(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          const SliverToBoxAdapter(
            child: TitleWidget(
              title: 'Games',
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return items[index];
                },
                childCount: 4,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: 80,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          const SliverToBoxAdapter(
            child: TitleWidget(
              title: 'Leader Board',
              isView: true,
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                children: List.generate(
                  4,
                  (index) {
                    return leaderBoardItem[index];
                  },
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 64,
            ),
          ),
        ],
      ),
    );
  }
}
