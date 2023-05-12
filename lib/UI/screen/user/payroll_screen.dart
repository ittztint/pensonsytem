import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pensionsystem/UI/constant/size.dart';
import 'package:pensionsystem/UI/constant/sizeconfig.dart';
import 'package:pensionsystem/UI/constant/text_styles.dart';

import '../../../utils/utils.dart';
import '../../constant/colors.dart';

class PayrollScreen extends StatefulWidget {
  const PayrollScreen({super.key});

  @override
  State<PayrollScreen> createState() => _PayrollScreenState();
}

class _PayrollScreenState extends State<PayrollScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payroll",
              style: txStyle20Bold,
            ),
            vertical5,
            Text(
              "A short details about payroll",
              style: txStyle12.copyWith(color: Colors.grey),
            ),
            
            vertical20,

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transport Allowance:",
                      style: txStyle12.copyWith(color: Colors.grey),
                    ),
                    Text(
                      "+ ${convertStringCurrency("1000")}",
                      style: txStyle14.copyWith(color: Colors.green),
                    ),
                  ],
                ),
                vertical10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Housing Allowance",
                      style: txStyle12.copyWith(color: Colors.grey),
                    ),
                    Text(
                      "+ ${convertStringCurrency("1000")}",
                      style: txStyle14.copyWith(color: Colors.green),
                    ),
                  ],
                ),
                vertical10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Basic Allowance",
                      style: txStyle12.copyWith(color: Colors.grey),
                    ),
                    Text(
                      "+ ${convertStringCurrency("1000")}",
                      style: txStyle14.copyWith(color: Colors.green),
                    ),
                  ],
                ),
                vertical10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pension:",
                      style: txStyle12.copyWith(color: Colors.grey),
                    ),
                    horizontalx20,
                    Text(
                      "-${convertStringCurrency("10000")}",
                      style: txStyle14.copyWith(color: Colors.red),
                    ),
                  ],
                ),
                vertical10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Vacation and sick leave:",
                      style: txStyle12.copyWith(color: Colors.grey),
                    ),
                    horizontalx20,
                    Text(
                      "+ ${convertStringCurrency("0")}",
                      style: txStyle14.copyWith(color: Colors.green),
                    ),
                  ],
                ),
                 vertical10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date of payment:",
                      style: txStyle12.copyWith(color: Colors.grey),
                    ),
                    horizontalx20,
                    Text(
                      "30/4/23",
                      style: txStyle14.copyWith(color: Colors.green),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: txStyle16.copyWith(color: Colors.grey),
                ),
                Text(
                  "+ ${convertStringCurrency("500000")}",
                  style: txStyle16.copyWith(color: Colors.green),
                ),
              ],
            ),
            vertical50,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Contribution History",
            //       style: txStyle14,
            //     ),
            //     Text(
            //       "View all >>",
            //       style: txStyle12.copyWith(color: appPrimaryColor),
            //     )
            //   ],
            // ),
            // vertical20,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Details",
            //       style: txStyle12,
            //     ),
            //     Text(
            //       "Deducted",
            //       style: txStyle12,
            //     ),
            //     Text(
            //       "Balance",
            //       style: txStyle12,
            //     ),
            //   ],
            // ),
            // ListView.builder(
            //     itemCount: 5,
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) {
            //       return InkWell(
            //         onTap: () {
            //           // showDialog(
            //           //     context: context,
            //           //     builder: (BuildContext context) {
            //           //       return AlertDialog(
            //           //         title: const Text('Transaction Details'),
            //           //         content: Padding(
            //           //           padding: const EdgeInsets.symmetric(
            //           //               horizontal: 20, vertical: 20),
            //           //           child: SizedBox(
            //           //             width: SizeConfig.widthOf(50),
            //           //             child:
            //           //           ),
            //           //         ),
            //           //         actions: <Widget>[
            //           //           TextButton(
            //           //             child: const Text('Ok'),
            //           //             onPressed: () {
            //           //               Navigator.of(context).pop();
            //           //             },
            //           //           ),
            //           //         ],
            //           //       );
            //           //     });
            //         },
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(vertical: 10),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     "Salary-JAN-2023",
            //                     style: txStyle12Bold,
            //                   ),
            //                   Row(
            //                     children: [
            //                       Text(
            //                         "12-02-2023 • ",
            //                         style:
            //                             txStyle12.copyWith(color: Colors.grey),
            //                       ),
            //                       Text(
            //                         "Paid",
            //                         style: txStyle12.copyWith(
            //                             color: appPrimaryColor),
            //                       ),
            //                     ],
            //                   )
            //                 ],
            //               ),
            //               Text(
            //                 "10%",
            //                 style: txStyle14.copyWith(color: appPrimaryColor),
            //               ),
            //               Text(
            //                 "₦150,000",
            //                 style: txStyle14.copyWith(color: appPrimaryColor),
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     })
          ],
        ),
      ),
    );
  }
}
