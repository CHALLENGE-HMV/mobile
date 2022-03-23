import 'package:flutter/material.dart';

import 'app_text.dart';

class BulletItem extends StatelessWidget {
  final String text;

  BulletItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(
          text: String.fromCharCode(0x2022),
        ),
        SizedBox(width: 10),
        Container(width: 310, child: AppText(text: this.text, color: Colors.white,)),
      ],
    );
  }
}