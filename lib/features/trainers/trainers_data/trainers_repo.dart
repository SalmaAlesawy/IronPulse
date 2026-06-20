import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/network/api_endpoints.dart';
import 'package:fitness_app/core/network/dio_consumer.dart';
import 'package:fitness_app/features/trainers/trainers_model/trainers_model.dart';
import 'package:flutter/foundation.dart';

class TrainersRepo {
  final DioConsumer dioConsumer;

  TrainersRepo({required this.dioConsumer});
  Future<Either<String, List<TrainersModel>>> getTrainers() async {
    try {
      final response = await dioConsumer.get(ApiEndpoints.getTrainers);
      final List data = response is List
          ? response
          : response['trainers'] ?? [];
      final trainers = data
          .map((e) => TrainersModel.fromJson(e as Map<String, dynamic>))
          .toList();

      print('Trainers: $trainers');

      return Right(trainers);
    } catch (e, stackTrace) {
      debugPrint('TrainersRepo error: $e');
      debugPrintStack(stackTrace: stackTrace);

      return Left(e.toString());
    }
  }
}
