import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pensionsystem/UI/constant/colors.dart';
import 'package:pensionsystem/UI/constant/responsiveness.dart';
import 'package:pensionsystem/UI/constant/size.dart';
import 'package:pensionsystem/UI/constant/sizeconfig.dart';
import 'package:pensionsystem/UI/constant/text_styles.dart';
import 'package:pensionsystem/UI/responsiveState/responsive_state.dart';
import 'package:pensionsystem/UI/screen/admin/add_user_screen.dart';
import 'package:pensionsystem/UI/screen/admin/user_profile_screen.dart';
import 'package:pensionsystem/UI/screen/user/investment_screen.dart';
import 'package:pensionsystem/UI/screen/user/payroll_screen.dart';
import 'package:pensionsystem/utils/utils.dart';
import 'package:pensionsystem/widget/custom_imaga.dart';
import 'package:pensionsystem/widget/small_custon_textfield.dart';
import 'package:provider/provider.dart';

import '../../../core/repositories/user_repository.dart';
import '../authentication/auth_screen.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  bool dismissed = false;
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserProvider>(context);

    return Scaffold(
      body: ResponsiveState(
        state: userProv.state,
        busyWidget: Center(
          child: SpinKitThreeInOut(
            color: appPrimaryColor,
            size: 30.0,
          ),
        ),
        idleWidget: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthOf(5), vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomNetworkImage(
                        imageUrl:
                            "${userProv.staffProfileModel.data?.profilePicture}",
                        radius: 50,
                      ),
                      horizontalx5,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${userProv.staffProfileModel.data?.firstName} ${userProv.staffProfileModel.data?.lastName}",
                            style: txStyle14,
                          ),
                          // vertical5,
                          Text(
                            "Staff",
                            style: txStyle12,
                          )
                        ],
                      ),
                    ],
                  ),
                  horizontalx20,
                  IconButton(
                      onPressed: () {
                        Get.offAll(AuthScreen());
                      },
                      icon: Icon(
                        Icons.logout,
                        color: appPrimaryColor,
                      ))
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    vertical20,
                    Row(
                      children: [
                        Text(
                          "Dashboard",
                          style: txStyle16Bold.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    vertical10,
                    dismissed
                        ? SizedBox.shrink()
                        : Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: appPrimaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome to PensionSystem",
                                    style: txStyle16Boldwt,
                                  ),
                                  vertical10,
                                  Text(
                                    "The best place to monitor and manage your pension scheme",
                                    style: txStyle12wt,
                                  ),
                                  vertical10,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 15),
                                          child: Center(
                                              child: Text(
                                            "Learn More",
                                            style: txStyle12,
                                          )),
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              dismissed = true;
                                            });
                                          },
                                          child: Text(
                                            "DIsmiss",
                                            style: txStyle12wt,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                    vertical20,
                    Center(
                      child: Text(
                        convertStringCurrency("500000"),
                        style: txStyle27Bold,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Total contributed",
                        style: txStyle12,
                      ),
                    ),
                    vertical20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Activities",
                          style: txStyle14,
                        ),
                        Text(
                          "View all >>",
                          style: txStyle12.copyWith(color: appPrimaryColor),
                        )
                      ],
                    ),
                    vertical10,
                    dashboardActivities(
                      activity: "Contribution summary",
                      ontap: () {},
                    ),
                    vertical10,
                    dashboardActivities(
                      activity: "Payroll",
                      ontap: () {
                        Get.to(PayrollScreen());
                      },
                    ),
                    vertical10,
                    dashboardActivities(
                      activity: "Payout options",
                      ontap: () {},
                    ),
                    vertical10,
                    dashboardActivities(
                      activity: "Investment",
                      ontap: () {
                        Get.to(InvestmentScreen());
                      },
                    ),
                    vertical30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Contribution History",
                          style: txStyle14,
                        ),
                        Text(
                          "View all >>",
                          style: txStyle12.copyWith(color: appPrimaryColor),
                        )
                      ],
                    ),
                    vertical20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Details",
                          style: txStyle12,
                        ),
                        Text(
                          "Deducted",
                          style: txStyle12,
                        ),
                        Text(
                          "Balance",
                          style: txStyle12,
                        ),
                      ],
                    ),
                    ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Salary-JAN-2023",
                                      style: txStyle12Bold,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "12-02-2023 • ",
                                          style: txStyle12.copyWith(
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Paid",
                                          style: txStyle12.copyWith(
                                              color: appPrimaryColor),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                  "10%",
                                  style: txStyle14.copyWith(
                                      color: appPrimaryColor),
                                ),
                                Text(
                                  "₦150,000",
                                  style: txStyle14.copyWith(
                                      color: appPrimaryColor),
                                ),
                              ],
                            ),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class dashboardActivities extends StatelessWidget {
  final String activity;
  final VoidCallback ontap;
  const dashboardActivities({
    Key? key,
    required this.activity,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: appPrimaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                activity,
                style: txStyle14,
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
