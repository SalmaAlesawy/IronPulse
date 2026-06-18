import 'package:fitness_app/core/themes/color_palette.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.backGroundColor,
    this.forGroundColor,
    this.image,
  });
  final String buttonText;
  final void Function()? onPressed;
  final WidgetStateProperty<Color?>? backGroundColor;
  final WidgetStateProperty<Color?>? forGroundColor;
  final String? image;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        backgroundColor:
            backGroundColor ??
            WidgetStatePropertyAll(ColorPalette.blue),
        foregroundColor: forGroundColor ?? WidgetStatePropertyAll(Colors.white),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 15)),
        textStyle: WidgetStatePropertyAll(textTheme.titleLarge),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      onPressed: onPressed,
      child: image == null
          ? Text(buttonText, style: textTheme.titleLarge)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image!, width: 24, height: 24),
                const SizedBox(width: 10),
                Text(buttonText),
              ],
            ),
    );
  }
}
