import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kat_game/common/constant/images.dart';
import 'package:kat_game/common/widgets/other/title.dart';
import 'package:kat_game/feature/home/controller/home_controller.dart';
import 'package:kat_game/feature/home/cubit/home_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return CustomScrollView(
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
                SliverToBoxAdapter(
                  child: StreamBuilder(
                    stream: state.games,
                    builder: ((context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('');
                      }
                      return const TitleWidget(
                        title: 'Games',
                      );
                    }),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: StreamBuilder(
                    stream: state.games,
                    builder: ((context, snapshot) {
                      if (snapshot.hasError) {
                        return SliverToBoxAdapter(
                            child: Text(snapshot.error.toString()));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SliverToBoxAdapter(child: Text(''));
                      }
                      return SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return snapshot.data![index].getItem;
                          },
                          childCount: 4,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          mainAxisExtent: 80,
                        ),
                      );
                    }),
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
            );
          } else if (state is HomeError) {
            return Center(
              child: Text(
                state.message,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
