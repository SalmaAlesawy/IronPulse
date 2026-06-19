import 'package:dio/dio.dart';
import 'package:fitness_app/core/network/dio_consumer.dart';
import 'package:fitness_app/core/shared_widgets/CustomTextFormField.dart';
import 'package:fitness_app/core/themes/color_palette.dart';
import 'package:fitness_app/features/trainers/trainers_data/trainers_repo.dart';
import 'package:flutter/material.dart';

class TrainersView extends StatefulWidget {
  const TrainersView({super.key});

  @override
  State<TrainersView> createState() => _TrainersViewState();
}

class _TrainersViewState extends State<TrainersView> {
  @override
  void initState() {
    final repo = TrainersRepo(dioConsumer: DioConsumer(Dio()));

    repo.getTrainers().then((result) {
      result.fold(
        (error) {
          debugPrint('Error: $error');
        },
        (trainers) {
          debugPrint('Trainers count: ${trainers.length}');
          debugPrint('First trainer: ${trainers.first.name}');
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 20,
        elevation: 0,
        titleSpacing: 20,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: ColorPalette.mainTextColor),
        ),
        title: Text("Trainers", style: textTheme.titleLarge),
      ),
      body: Column(
        children: [
          Customtextformfield(
            prefixIcon: Icon(Icons.search, color: ColorPalette.inputTextColor),
            controller: searchController,
            hintText: "Search by name or specialty",
          ),
        ],
      ),
    );
  }
}
