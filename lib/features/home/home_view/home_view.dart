import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/shared_widgets/CustomTextButton.dart';
import 'package:fitness_app/core/shared_widgets/CustomTextFormField.dart';
import 'package:fitness_app/core/themes/color_palette.dart';
import 'package:fitness_app/features/home/home_data/home_data.dart';
import 'package:fitness_app/core/shared_widgets/plans_item_card.dart';
import 'package:fitness_app/features/home/home_view_model/search_cubit/search_cubit.dart';
import 'package:fitness_app/features/plans/plans_view_model/plans_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    TextTheme textTheme = Theme.of(context).textTheme;
    SearchCubit searchCubit=context.read<SearchCubit>();
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
                onChanged: searchCubit.searchMethod,
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

                  return BlocBuilder<PlansCubit, PlansState>(
                    builder: (context, state) {

                      switch (state) {
                        case PlansInitial():
                          return CircularProgressIndicator();
                        case LoadingPlansState():
                          return CircularProgressIndicator();
                        case SuccessPlansState():
                          return PlansItemCard(
                            homeModel: HomeData.homeData[index],
                            plansModel: state.plans[index],
                            index: index,
                          );
                        case ErrorPlansState():
                          return Text("error");
                      }
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
