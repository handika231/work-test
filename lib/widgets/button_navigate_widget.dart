import 'package:flutter/material.dart';

import '../common/app_style.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 50),
        backgroundColor: AppStyle.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
      ),
    );
  }
}
