import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kat_game/common/constant/images.dart';
import 'package:kat_game/common/navigation/navigation_service.dart';
import 'package:kat_game/common/widgets/buttons/common_rounded_button.dart';
import 'package:kat_game/common/widgets/form_fields/custom_formfield.dart';
import 'package:kat_game/common/widgets/other/custom_toast.dart';
import 'package:kat_game/feature/authentication/cubit/authentication_cubit.dart';
import 'package:kat_game/feature/authentication/ui/screen/register_screen.dart';
import 'package:kat_game/feature/authentication/ui/widget/forgot.dart';
import 'package:kat_game/feature/authentication/ui/widget/register.dart';
import 'package:kat_game/feature/home/ui/screen/home_page.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool _isLoading = false;

    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoading) {
          setState(() {
            _isLoading = true;
          });
        } else {
          setState(() {
            _isLoading = true;
          });
        }
        if (state is AuthenticationError) {
          CustomToast.show(message: state.message);
        }
        if (state is AuthenticationLoginSuccess) {
          NavigationService.pushAndRemoveUntil(
            const HomePage(),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: width,
            child: Column(
              children: [
                const SizedBox(
                  height: 128,
                ),
                Image.asset(
                  Images.bigbearkat,
                  height: 120,
                ),
                const SizedBox(
                  height: 64,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomTextInputFieldWithBorder(
                    title: 'Email',
                    hintText: 'Emial',
                    controller: email,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomTextInputFieldWithBorder(
                    title: 'Password',
                    hintText: 'Password',
                    showSuffix: true,
                    obscureText: isObscure,
                    maxLines: 1,
                    controller: password,
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RichText(
                    text: TextSpan(
                        text: 'Forgot Password? ',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => const Forgot()),
                                    ),
                                  );
                                },
                              text: 'Forgot Password ?',
                              style: TextStyle(
                                fontSize: 14,
                                color: theme.primaryColor,
                              ))
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RichText(
                    text: TextSpan(
                        text: 'Do you have an account? ',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const RegisterPage()),
                                    ),
                                  );
                                },
                              text: 'Sign up',
                              style: TextStyle(
                                fontSize: 14,
                                color: theme.primaryColor,
                              ))
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomRoundedButtom(
                    isLoading: _isLoading,
                    title: 'Login',
                    onPressed: () {
                      context.read<AuthenticationCubit>().login(
                            email: email.text,
                            password: password.text,
                          );
                    },
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
