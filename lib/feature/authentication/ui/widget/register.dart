import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kat_game/common/constant/images.dart';
import 'package:kat_game/common/constant/utils/form_validator.dart';
import 'package:kat_game/common/database/shared_pref.dart';
import 'package:kat_game/common/navigation/navigation_service.dart';
import 'package:kat_game/common/widgets/buttons/common_rounded_button.dart';
import 'package:kat_game/common/widgets/form_fields/custom_formfield.dart';
import 'package:kat_game/common/widgets/other/custom_toast.dart';
import 'package:kat_game/feature/authentication/cubit/authentication_cubit.dart';
import 'package:kat_game/feature/authentication/ui/screen/login_screen.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController samId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isObscure = true;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    SharedPref.setFirstTimeAppOpen(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
          CustomToast.error(message: state.message);
        }
        if (state is AuthenticationRegisterSuccess) {
          NavigationService.pushAndRemoveUntil(
            const LoginPage(),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                width: width,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 18,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 64,
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
                        title: 'Sam Id',
                        hintText: 'Sam Id',
                        controller: samId,
                        validator: (val) => FormValidator.validateFieldNotEmpty(
                            val, "Sam Id cannot be empty"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CustomTextInputFieldWithBorder(
                        title: 'Name',
                        hintText: 'Name',
                        controller: name,
                        validator: (val) => FormValidator.validateFieldNotEmpty(
                            val, "Name cannot be empty"),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CustomTextInputFieldWithBorder(
                          title: 'Sam Email',
                          hintText: 'Sam Email',
                          controller: email,
                          validator: (val) => FormValidator.validateEmail(val),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CustomTextInputFieldWithBorder(
                          title: 'Password',
                          hintText: 'Password',
                          obscureText: isObscure,
                          showSuffix: true,
                          maxLines: 1,
                          validator: (val) =>
                              FormValidator.validatePassword(val),
                          controller: password,
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CustomTextInputFieldWithBorder(
                          title: 'Confirm Password',
                          hintText: 'Confirm Password',
                          obscureText: isObscure,
                          controller: confirmPassword,
                          maxLines: 1,
                          showSuffix: true,
                          validator: (val) =>
                              FormValidator.validateConfirmPassword(
                            val,
                            password.text,
                          ),
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CustomRoundedButtom(
                        title: 'Register',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<AuthenticationCubit>()
                                .registerWithEmail(
                                  name: name.text,
                                  email: email.text,
                                  password: password.text,
                                  samId: samId.text,
                                );
                          }
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
        ),
      ),
    );
  }
}
