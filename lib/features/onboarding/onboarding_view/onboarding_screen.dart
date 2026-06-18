import 'package:fitness_app/core/constants/app_texts.dart';
import 'package:fitness_app/core/database/cache/cache_helper.dart';
import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/routes/page_route_names.dart';
import 'package:fitness_app/core/shared_widgets/custom_elevated_button.dart';
import 'package:fitness_app/core/themes/color_palette.dart';
import 'package:flutter/material.dart';
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(AppTexts.ironPulse, style: textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Assets.images.heroImageSection.image(fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppTexts.welcome,
                  style: textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  AppTexts.description,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorPalette.secondTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                CustomElevatedButton(buttonText: "GetStarted",onPressed: (){
                  CacheHelper().saveData(key: "isOnboardingVisited", value: true);
                  Navigator.pushReplacementNamed(context, PageRouteNames.layout);
                },),
                SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
