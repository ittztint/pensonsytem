import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pensionsystem/UI/constant/colors.dart';
import 'package:pensionsystem/UI/constant/responsiveness.dart';
import 'package:pensionsystem/UI/constant/size.dart';
import 'package:pensionsystem/UI/constant/text_styles.dart';
import 'package:pensionsystem/UI/responsiveState/view_state.dart';
import 'package:pensionsystem/UI/screen/admin/admin_dashboard.dart';
import 'package:pensionsystem/widget/custom_button_load.dart';
import 'package:provider/provider.dart';

import '../../../core/repositories/user_repository.dart';
import '../../../widget/custom_txt_field.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        width: responsive.isMobile(context)
            ? size.width
            : responsive.isTablet(context)
                ? size.width / 2
                : size.width / 3,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: appPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hello admin',
                style: txStyle25,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                labelText: 'Email address',
                hintText: 'pretevest@example.com',
                controller: email,
                validator: (value) => userProv.validateEmail(value!),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                labelText: 'Password',
                hintText: '••••••••',
                obscureText: true,
                controller: password,
                validator: (value) => userProv.validatePassword(value!),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Having difficulties remembering your password?',
                style: txStyle12,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: CustomButtonLoad(
                      userProv: ViewState.Idle,
                      onTap: () async {
                        Get.to(AdminDashboard());
                        // if (!_key.currentState!.validate()) return;

                        // bool response = await authProv.login(
                        //     email.text, password.text);

                        // if (response) {

                        // }
                      },
                      label: 'Login')),
            ],
          ),
        ),
      ),
    );
  }
}
