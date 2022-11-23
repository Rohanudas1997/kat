import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kat_game/common/constant/images.dart';
import 'package:kat_game/common/widgets/buttons/common_rounded_button.dart';
import 'package:kat_game/common/widgets/form_fields/text_field_with_names.dart';
import 'package:kat_game/feature/home/ui/screen/home_page.dart';
import 'package:kat_game/feature/login/controller/login_controller.dart';
import 'package:kat_game/feature/login/controller/register_controller.dart';
import 'package:kat_game/feature/login/ui/screen/forgot.dart';
import 'package:kat_game/feature/login/ui/screen/register.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObscure = true;
  IconData showPassword = Icons.visibility;
  
  @override
  void initState() {
    LoginController loginuser = Get.find();
    loginuser.isLogged.addListener((){
      if(loginuser.isLogged.value){
        Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }),
                        (route) => false,
                      );
      }else{
        Toast.show('Error while login');
      }
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginController loginuser = Get.find();
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
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
                    child: FormFieldsWithName(
                      name: 'Email',
                      textEditingController: email,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: FormFieldsWithName(
                      name: 'Password',
                      isObscure: isObscure,
                      textEditingController: password,
                      icon: showPassword,
                      onTap: () {
                        showPassword =
                            isObscure ? Icons.visibility_off : Icons.visibility;
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    )),
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
                                      builder: ((context) => const Register()),
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
                  child: CommonRoundedButton(
                    name: 'Login',
                    onTap: () {
                      loginuser.login(email.text, password.text);
                      
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
