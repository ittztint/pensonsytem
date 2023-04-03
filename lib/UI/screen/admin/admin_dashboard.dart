import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pensionsystem/UI/constant/colors.dart';
import 'package:pensionsystem/UI/constant/responsiveness.dart';
import 'package:pensionsystem/UI/constant/size.dart';
import 'package:pensionsystem/UI/constant/sizeconfig.dart';
import 'package:pensionsystem/UI/constant/text_styles.dart';
import 'package:pensionsystem/UI/screen/admin/add_user_screen.dart';
import 'package:pensionsystem/UI/screen/admin/user_profile_screen.dart';
import 'package:pensionsystem/widget/small_custon_textfield.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
        child: Column(
          children: [
            vertical20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Text(
                    //   "Pension system",
                    //   style: txStyle14Bold,
                    // ),
                    // horizontalx10,
                    SizedBox(
                        width: 200,
                        child: SmallCustomTextField(
                          hintText: "Search system",
                          prefix: Icon(Icons.search),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          shape: BoxShape.circle),
                    ),
                    horizontalx5,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Busari Muiz",
                          style: txStyle14,
                        ),
                        // vertical5,
                        Text(
                          "Admin",
                          style: txStyle12,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
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
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: appPrimaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to PensionSystem",
                      style: txStyle16Boldwt,
                    ),
                    vertical10,
                    Text(
                      "The best place for pension schem",
                      style: txStyle12wt,
                    ),
                    vertical10,
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
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
                      ],
                    )
                  ],
                ),
              ),
            ),
            vertical20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: SizeConfig.screenWidth! / 2.5,
                  decoration: BoxDecoration(
                      border: Border.all(color: appPrimaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Registered User",
                                style: txStyle14,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(AddUserScreen());
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Add User",
                                      style: txStyle12.copyWith(
                                          color: appPrimaryColor),
                                    ),
                                    Icon(
                                      Icons.add,
                                      size: 13,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(UserProfileScreen());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            shape: BoxShape.circle),
                                      ),
                                      title: Text(
                                        "Adeola Adebusuyi",
                                        style: txStyle14,
                                      ),
                                      subtitle: Text(
                                        "Role: Head Teacher",
                                        style: txStyle12,
                                      ),
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth! / 2.5,
                  decoration: BoxDecoration(
                      border: Border.all(color: appPrimaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Active Staffs",
                                style: txStyle14,
                              ),
                              Text(
                                "View all >> ",
                                style:
                                    txStyle12.copyWith(color: appPrimaryColor),
                              ),
                            ],
                          ),
                          ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          shape: BoxShape.circle),
                                    ),
                                    title: Text(
                                      "Adeola Adebusuyi",
                                      style: txStyle14,
                                    ),
                                    subtitle: Text(
                                      "Role: Head Teacher",
                                      style: txStyle12,
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
