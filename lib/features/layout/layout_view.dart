import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/themes/color_palette.dart';
import 'package:fitness_app/features/layout/layout_view_model/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        final cubit=context.read<LayoutCubit>();
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory
            ),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              currentIndex: cubit.currentIndex,
              onTap: cubit.onChangeScreen,
              enableFeedback: false,
              unselectedItemColor: ColorPalette.secondTextColor,
              selectedItemColor: ColorPalette.blue,
              showUnselectedLabels: true,
              showSelectedLabels: true,

              items: [
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Assets.icons.activeHomeIcon.svg(),
                  label: "Home",
                  activeIcon: Assets.icons.activeHomeIcon.svg(),
                ),
                BottomNavigationBarItem(
                  icon: Assets.icons.inactiveTrainersIcon.svg(),
                  label: "trainers",
                  activeIcon: Assets.icons.activeTrainersIcon.svg(),
                ),
                BottomNavigationBarItem(
                  icon: Assets.icons.inactivePlansIcon.svg(),
                  label: "Plans",
                  activeIcon: Assets.icons.activePlansIcon.svg(),
                ),
                BottomNavigationBarItem(
                  icon: Assets.icons.inactiveFavouriteIcon.svg(),
                  label: "Favourite",
                  activeIcon: Assets.icons.activeFavouriteIcon.svg(),
                ),
                BottomNavigationBarItem(
                  icon: Assets.icons.inactiveProfileIcon4.svg(),
                  label: "Profile",
                  activeIcon: Assets.icons.inactiveProfileIcon4.svg(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
