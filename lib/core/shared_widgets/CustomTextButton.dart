import 'package:fitness_app/core/themes/color_palette.dart';
import 'package:flutter/material.dart';

class Customtextbutton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const Customtextbutton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(textTheme.labelLarge),
            foregroundColor: WidgetStatePropertyAll(ColorPalette.blue),
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          child: Text(
            text,
            style: textTheme.titleMedium?.copyWith(color: ColorPalette.blue),
          ),
        ),
      ],
    );
  }
}
