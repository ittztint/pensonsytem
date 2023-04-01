import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pensionsystem/UI/constant/colors.dart';
import 'package:pensionsystem/UI/constant/responsiveness.dart';
import 'package:pensionsystem/UI/constant/text_styles.dart';
import 'package:pensionsystem/UI/screen/authentication/login_screen.dart';
import 'package:pensionsystem/UI/screen/authentication/admin_login.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

@override
void initState() {
  clearData();
}

clearData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
}

class _AuthScreenState extends State<AuthScreen> {
  String authType = 'staff';

  bool login = false;
  bool register = false;
  @override
  void initState() {
    login = true;
    register = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PensionSystem',
                    style: txStyle27,
                  ),
                  InkWell(
                    onTap: () {
                      authType == 'staff'
                          ? setState(() {
                              authType = 'admin';
                            })
                          : setState(() {
                              authType = 'staff';
                            });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: appPrimaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Center(
                          child: Text(
                              authType == 'staff'
                                  ? 'continue as a admin'
                                  : 'continue as an staff',
                              style: txStyle16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              // height: size.height / 1.6,
              width: responsive.isMobile(context)
                  ? size.width
                  : responsive.isTablet(context)
                      ? size.width / 2
                      : size.width / 3,
              child: buldUi(authType),
            )
          ],
        ),
      ),
    );
  }

  buldUi(String authType) {
    if (authType == 'staff') {
      return LoginScreen();
    } else {
      return AdminLogin();
    }
  }
}
