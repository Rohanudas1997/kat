import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kat_game/common/constant/images.dart';
import 'package:kat_game/common/database/shared_pref.dart';
import 'package:kat_game/common/widgets/buttons/common_rounded_button.dart';
import 'package:kat_game/common/widgets/form_fields/input_field_decoration.dart';
import 'package:kat_game/common/widgets/form_fields/text_field_with_names.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController samId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void initState() {
    SharedPref().saveFirstTimeLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  Images.register,
                  color: theme.primaryColor,
                  height: 80,
                ),
                const SizedBox(
                  height: 64,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: FormFieldsWithName(
                      name: 'Sam Id',
                      textEditingController: samId,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: FormFieldsWithName(
                      name: 'Name',
                      textEditingController: name,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: FormFieldsWithName(
                      name: 'Sam Email',
                      textEditingController: email,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: FormFieldsWithName(
                      name: 'Password',
                      textEditingController: password,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: FormFieldsWithName(
                      name: 'Confirm Password',
                      textEditingController: confirmPassword,
                    )),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CommonRoundedButton(
                    name: 'Register',
                    onTap: () {},
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
