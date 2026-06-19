import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/shared_widgets/CustomTextButton.dart';
import 'package:fitness_app/core/shared_widgets/CustomTextFormField.dart';
import 'package:fitness_app/core/themes/color_palette.dart';
import 'package:fitness_app/features/home/home_data/home_data.dart';
import 'package:fitness_app/core/shared_widgets/plans_item_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 20,
        elevation: 0,
        titleSpacing: 4,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Assets.icons.logoIcon.svg(width: 20, height: 25),
        ),
        title: Text("IronPulse", style: textTheme.titleLarge),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_sharp, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Customtextformfield(
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorPalette.inputTextColor,
                ),
                controller: searchController,
                hintText: "Search workouts...",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured Workout Plans", style: textTheme.titleLarge),
                  Customtextbutton(text: "See All"),
                ],
              ),
              Column(
                children: List.generate(3, (index) {
                  return PlansItemCard(homeModel: HomeData.homeData[index]);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
