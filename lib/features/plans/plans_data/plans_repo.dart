import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/network/api_endpoints.dart';
import 'package:fitness_app/core/network/dio_consumer.dart';
import 'package:fitness_app/features/plans/plans_model/plans_model.dart';

 class PlansRepo {
  final DioConsumer dioConsumer;
  PlansRepo({required this.dioConsumer});
  Future<Either<String, List<PlansModel>>> getPlans() async {
    try {
      final response = await dioConsumer.get(ApiEndpoints.getPlans);
      final data = (response as List).map(
        (e) => PlansModel.fromJson(e as Map<String, dynamic>),
      ).toList();
      return Right(data);
    } catch (e) {
      return left(e.toString());
    }
  }
}
