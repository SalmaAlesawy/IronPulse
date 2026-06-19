import 'package:fitness_app/core/themes/color_palette.dart';
import 'package:fitness_app/features/home/home_model/home_model.dart';
import 'package:flutter/material.dart';

class PlansItemCard extends StatelessWidget {
  const PlansItemCard({super.key, required this.homeModel});
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: ColorPalette.inputColor,
        border: Border.all(color: ColorPalette.borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 15,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.asset(homeModel.image, width: 118, height: 160,fit: BoxFit.cover,),
          ),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: ColorPalette.levelContainerColor,
                      borderRadius: BorderRadiusGeometry.circular(6),
                    ),
                    child: Text(
                      homeModel.level,
                      style: TextStyle(color: ColorPalette.levelTextColor),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 1 / 4),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border, size: 25),
                  ),
                ],
              ),
              Text(homeModel.title, style: textTheme.titleLarge),
              Text(homeModel.description, style: textTheme.bodySmall),
              Row(
                spacing: 15,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          baseline: TextBaseline.alphabetic,
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Icon(
                              Icons.access_time,
                              color: ColorPalette.secondTextColor,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: "${homeModel.time} min",
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          baseline: TextBaseline.alphabetic,
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Icon(
                              size: 18,
                              homeModel.icon,
                              color: ColorPalette.secondTextColor,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: homeModel.type,
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
