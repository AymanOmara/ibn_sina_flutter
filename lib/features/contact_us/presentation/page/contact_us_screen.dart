import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/helper/constants.dart';
import 'package:ibn_sina_flutter/core/helper/utils.dart';
import 'package:ibn_sina_flutter/core/ui/sina_top_navigation_bar.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SinaTopNavigationBar(
            title: "contact_us".tr,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "contact_us_facebook".tr,
                  style: TextStyle(
                    color: orangeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async {
                    await openUrl(Misc.sinaMTI);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/face.png",
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        Misc.sinaMTI,
                        textDirection: TextDirection.ltr,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    await openUrl(Misc.sinaProfile);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/face.png",
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          Misc.sinaProfile,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "contact_whatsapp".tr,
                  style: TextStyle(
                    color: orangeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                _whatsITem(Misc.phoneNumber1),
                SizedBox(
                  height: 30,
                ),
                _whatsITem(Misc.phoneNumber2),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _whatsITem(String number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () async {
            await makePhoneCall(number);
          },
          child: Image.asset(
            "assets/images/phone_icon.png",
            width: 30,
          ),
        ),
        Text(number),
        InkWell(
          onTap: () async {
            await openWhatsApp(number);
          },
          child: Image.asset(
            "assets/images/whats.png",
            width: 30,
          ),
        ),
      ],
    );
  }
}
