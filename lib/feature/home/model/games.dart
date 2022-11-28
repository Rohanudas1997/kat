import 'package:flutter/cupertino.dart';
import 'package:kat_game/common/constant/images.dart';
import 'package:kat_game/feature/home/ui/widget/dashboard_games_list_item.dart';

class Games {
  Games({
    required this.id,
    required this.name,
    required this.available,
    required this.total,
  });

  int id;
  String name;
  int available;
  int total;

  factory Games.fromJson(Map<String, dynamic> json) => Games(
        id: json["id"],
        name: json["name"],
        available: json["available"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "available": available,
        "total": total,
      };

  factory Games.inital() => Games(
        id: 0,
        name: "",
        available: 0,
        total: 0,
      );

  DashboardGameListItem get getItem {
    if (name == 'bowling') {
      return DashboardGameListItem(
        icon: Images.bowlingball,
        title: 'Bowling',
        available: available.toString(),
        total: total.toString(),
        color: CupertinoColors.activeGreen,
      );
    } else if (name == 'ping_pong') {
      return DashboardGameListItem(
        icon: Images.tennisIcon,
        title: 'Ping pong',
        available: available.toString(),
        total: total.toString(),
        color: CupertinoColors.systemYellow,
      );
    } else if (name == "pool") {
      return DashboardGameListItem(
        icon: Images.snooker,
        title: 'Pool',
        available: available.toString(),
        total: total.toString(),
        color: CupertinoColors.systemRed,
      );
    } else {
      return DashboardGameListItem(
        icon: Images.control,
        title: 'PlayStation',
        available: available.toString(),
        total: total.toString(),
        color: CupertinoColors.activeOrange,
      );
    }
  }
}
