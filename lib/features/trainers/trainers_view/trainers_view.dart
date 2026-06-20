import 'package:fitness_app/core/shared_widgets/CustomTextFormField.dart';
import 'package:fitness_app/core/shared_widgets/custom_item_card.dart';
import 'package:fitness_app/core/themes/color_palette.dart';
import 'package:fitness_app/features/trainers/trainers_view_model/trainers_cubit.dart';
import 'package:fitness_app/features/trainers/trainers_view_model/trainers_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainersView extends StatefulWidget {
  const TrainersView({super.key});

  @override
  State<TrainersView> createState() => _TrainersViewState();
}

class _TrainersViewState extends State<TrainersView> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

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
          CustomTextFormField(
            prefixIcon: Icon(Icons.search, color: ColorPalette.inputTextColor),
            controller: searchController,
            hintText: "Search by name or specialty",
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<TrainersCubit, TrainersState>(
              builder: (context, state) {
                if (state is TrainersLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TrainersErrorState) {
                  return Center(child: Text(state.errorMessage));
                } else if (state is TrainersLoadedState) {
                  final trainers = state.trainers;
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: trainers.length,
                    itemBuilder: (context, index) {
                      final trainer = trainers[index];
                      return CustomItemCard(
                        image: trainer.image,
                        title: trainer.name,
                        subtitle: trainer.specialty,
                        experienceYears: trainer.experienceYears,
                        clients: trainer.clients,
                        rating: trainer.rating,
                        onPressed: () {},
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
