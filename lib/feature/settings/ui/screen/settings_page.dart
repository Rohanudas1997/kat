import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kat_game/common/constant/images.dart';
import 'package:kat_game/common/database/shared_pref.dart';
import 'package:kat_game/feature/login/controller/login_controller.dart';
import 'package:kat_game/feature/login/ui/screen/login.dart';
import 'package:kat_game/feature/settings/ui/widget/settings_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.onLogoutTap,});
  final Function() onLogoutTap;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 64,
              ),
            ),
            SliverToBoxAdapter(
              child: Image.asset(
                Images.bigbearkat,
                height: 128,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 64,
              ),
            ),
            SliverToBoxAdapter(
              child: SettingsTile(
                title: 'Logout',
                
                onTap: (){
                  SharedPref pref = SharedPref();
                  loginController.logout();
                  pref.saveUser(false);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context){
                        return const Login();
                      },), (route) => false);
                  
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}