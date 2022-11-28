import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kat_game/common/constant/images.dart';
import 'package:kat_game/common/navigation/navigation_service.dart';
import 'package:kat_game/common/widgets/other/custom_toast.dart';
import 'package:kat_game/common/widgets/other/loading_overlay.dart';
import 'package:kat_game/feature/authentication/cubit/authentication_cubit.dart';
import 'package:kat_game/feature/authentication/ui/screen/login_screen.dart';
import 'package:kat_game/feature/settings/ui/widget/privacy_policy.dart';
import 'package:kat_game/feature/settings/ui/widget/settings_tile.dart';
import 'package:kat_game/feature/settings/ui/widget/terms_and_condition.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoading) {
          setState(() {
            _isLoading = true;
          });
        } else {
          setState(() {
            _isLoading = false;
          });
        }
        if (state is AuthenticationError) {
          CustomToast.error(message: state.message);
        }
        if (state is AuthenticationLogoutSuccess) {
          NavigationService.pushAndRemoveUntil(
            const LoginPage(),
          );
        }
      },
      child: LoadingOverlay(
        isLoading: _isLoading,
        child: SafeArea(
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
                    title: 'Privacy policy',
                    hasBottomPadding: false,
                    onTap: () {
                      NavigationService.push(
                        const PrivacyPlicy(),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: SettingsTile(
                    title: 'Terms and condition',
                    hasBottomPadding: false,
                    onTap: () {
                      NavigationService.push(
                        const TermsAndCondition(),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: SettingsTile(
                    title: 'Logout',
                    onTap: () {
                      context.read<AuthenticationCubit>().logout();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
