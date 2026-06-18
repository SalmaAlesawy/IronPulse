import 'package:fitness_app/core/database/cache/cache_helper.dart';
import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/routes/page_route_names.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
   bool isOnboardingVisited= CacheHelper().getData(key: "isOnboardingVisited")??false;
   if(isOnboardingVisited==true){
     Future.delayed(Duration(seconds: 2), () {
       Navigator.pushReplacementNamed(context, PageRouteNames.signIn);
     });
   }else{
     Future.delayed(Duration(seconds: 2), () {
       Navigator.pushReplacementNamed(context, PageRouteNames.onBoardingScreen);
     });
   }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Assets.images.splashScreen.image(fit: BoxFit.cover),
      ),
    );
  }
}
