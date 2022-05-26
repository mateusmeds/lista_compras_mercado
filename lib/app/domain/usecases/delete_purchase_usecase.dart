import 'package:dartz/dartz.dart';

abstract class DeletePurchaseUseCase {
  Future<Either<Exception, bool>> call(int key);
}
