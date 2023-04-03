import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pensionsystem/UI/constant/colors.dart';
import 'package:pensionsystem/UI/constant/size.dart';
import 'package:pensionsystem/UI/constant/text_styles.dart';

import '../../../widget/custom_button.dart';
import '../../constant/sizeconfig.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vertical120,
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.circle),
              ),
            ),
            vertical50,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Name:",
                          style: txStyle13,
                        ),
                        horizontalx5,
                        Text(
                          "Adeola Adebusuyi",
                          style: txStyle13.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                    vertical20,
                    Row(
                      children: [
                        Text(
                          "Email:",
                          style: txStyle13,
                        ),
                        horizontalx5,
                        Text(
                          "Adeola@gmail.com",
                          style: txStyle13.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                    vertical20,
                    Row(
                      children: [
                        Text(
                          "Phone number:",
                          style: txStyle13,
                        ),
                        horizontalx5,
                        Text(
                          "090123448992",
                          style: txStyle13.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                    vertical20,
                    Row(
                      children: [
                        Text(
                          "DOB:",
                          style: txStyle13,
                        ),
                        horizontalx5,
                        Text(
                          "12-02-1993",
                          style: txStyle13.copyWith(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Organization:",
                          style: txStyle13,
                        ),
                        horizontalx5,
                        Text(
                          "LAG",
                          style: txStyle13.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                    vertical20,
                    Row(
                      children: [
                        Text(
                          "Department:",
                          style: txStyle13,
                        ),
                        horizontalx5,
                        Text(
                          "Agric",
                          style: txStyle13.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                    vertical20,
                    Row(
                      children: [
                        Text(
                          "ID:",
                          style: txStyle13,
                        ),
                        horizontalx5,
                        Text(
                          "032220123448992",
                          style: txStyle13.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                    vertical20,
                    Row(
                      children: [
                        Text(
                          "Supervisor:",
                          style: txStyle13,
                        ),
                        horizontalx5,
                        Text(
                          "Busari Muiz",
                          style: txStyle13.copyWith(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            vertical20,
            Center(
              child: SizedBox(
                  width: SizeConfig.screenWidth! / 2.5,
                  child: CustomButton(onTap: () {}, label: "Edit Profile")),
            ),
            vertical30,
            Text(
              "Transactions",
              style: txStyle15Bold,
            ),
            vertical20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transaction", style: txStyle14,),
                Text("Pension Percentage", style: txStyle14,),
                Text("Pension balance", style: txStyle14,)

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
                              style: txStyle14Bold,
                            ),
                            Row(
                              children: [
                                Text(
                                  "12-02-2023 • ",
                                  style: txStyle12.copyWith(color: Colors.grey),
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
                          style: txStyle14.copyWith(color: appPrimaryColor),
                        ),
                        Text(
                          "₦150,000",
                          style: txStyle14.copyWith(color: appPrimaryColor),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
