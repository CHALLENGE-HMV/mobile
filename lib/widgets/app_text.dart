import 'package:flutter/material.dart';
import 'package:minha_saude/constants/app_constants.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;

  AppText({Key? key, required this.text, this.color = AppColors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: this.text,
      child: Text(
        this.text,
        style: TextStyle(
          color: this.color,
          fontSize: AppFontSize.normal,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
