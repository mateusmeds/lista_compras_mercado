import 'package:dartz/dartz.dart';
import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';

abstract class GetAllPurchasesUseCase {
  Future<Either<Exception, List<PurchaseEntity>>> call();
}
