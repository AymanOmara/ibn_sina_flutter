import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.isRead,
  });

  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      margin: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/images/success.svg",
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              ],
            ),
          ),
          SizedBox(
            width: 14,
          ),
        ],
      ),
    );
  }
}
