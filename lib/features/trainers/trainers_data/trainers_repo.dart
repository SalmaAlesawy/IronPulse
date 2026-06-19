import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/network/api_consumer.dart';
import 'package:fitness_app/core/network/api_endpoints.dart';
import 'package:fitness_app/features/trainers/trainers_model/trainers_model.dart';

class TrainersRepo {
  final ApiConsumer apiConsumer;

  TrainersRepo({required this.apiConsumer});
  Future<Either<String, List<TrainersModel>>> getTrainers() async {
    try {
      final response = await apiConsumer.get(ApiEndpoints.getTrainers);
      final List data = response is List
          ? response
          : response['trainers'] ?? [];
      final trainers = data
          .map((e) => TrainersModel.fromJson(e as Map<String, dynamic>))
          .toList();

      print('Trainers: $trainers');

      return Right(trainers);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
