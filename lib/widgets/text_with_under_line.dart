import 'package:flutter/material.dart';
import 'package:minha_saude/constants/app_constants.dart';

class TextWithUnderline extends StatelessWidget {
  final String text;
  final Color color;

  TextWithUnderline(
      {Key? key,
      required this.text,
      this.color = AppColors.orange,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.darkBlue,
              fontSize: AppFontSize.big,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(color: AppColors.orange),
          ),
        ),
      ),
    );
  }
}
