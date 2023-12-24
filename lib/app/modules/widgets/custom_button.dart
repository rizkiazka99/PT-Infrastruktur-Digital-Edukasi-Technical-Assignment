import 'package:flutter/material.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget content;
  final Size buttonSize;
  final Color? color;

  const CustomButton({
    super.key,
    required this.content,
    required this.onPressed,
    this.buttonSize = const Size(0, 0),
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: buttonSize == const Size(0, 0)
            ? Size(
              MediaQuery.of(context).size.width * 0.9, 
              MediaQuery.of(context).size.height * 0.06
            ) : buttonSize,
        elevation: 2,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashFactory: NoSplash.splashFactory,
        backgroundColor: color,
        enableFeedback: true
      ),
      onPressed: onPressed,
      child: content
    );
  }
}