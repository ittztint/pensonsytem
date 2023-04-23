import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pensionsystem/UI/constant/colors.dart';
import 'package:pensionsystem/UI/constant/responsiveness.dart';
import 'package:pensionsystem/UI/constant/size.dart';

import '../../constant/sizeconfig.dart';
import '../../constant/text_styles.dart';

class InvestmentScreen extends StatelessWidget {
  const InvestmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthOf(5), vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Investify",
                style: txStyle16Bold.copyWith(fontSize: 27, height: 1.5)),
            RichText(
              text: TextSpan(
                text:
                    'Want higher return from your pension? Invest it to yield great profit ',
                style: txStyle12.copyWith(height: 1.5),
                children: [
                  TextSpan(
                      text: 'T&C applied',
                      style: txStyle10.copyWith(color: Colors.grey)),
                ],
              ),
            ),
            vertical30,
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                      height: SizeConfig.heightOf(60),
                      width: responsive.isMobile(context)
                          ? SizeConfig.screenWidth
                          : SizeConfig.screenWidth! / 2,
                      decoration: BoxDecoration(
                          border: Border.all(color: appPrimaryColor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://techcrunch.com/wp-content/uploads/2017/12/farmcrowdy-image-1.jpg"),
                              fit: BoxFit.cover)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Investment starts: 12-02-23",
                                  style: txStyle12,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: '5000 ',
                                    style: txStyle12,
                                    children: [
                                      TextSpan(
                                          text: 'per share',
                                          style: txStyle10.copyWith(
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Farm Crowdy",
                                    style: txStyle25Bold,
                                  ),
                                  vertical10,
                                  Text(
                                    "Farmcrowdy is Nigeria's first digital agriculture platform that connects small scale farmers across with smart farming techniques, quality farm inputs, and access to the superior markets to earn a decent profit margin compared to what they get from trading within",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: txStyle12.copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                );
              })
            )
          ],
        ),
      ),
    );
  }
}
