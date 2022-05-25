import 'package:dartz/dartz.dart' show Either;
import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';

abstract class PurchaseRepository {
  Future<Either<Exception, bool>> save(PurchaseEntity purchaseEntity);
  Future<Either<Exception, List<PurchaseEntity>>> getAll();
}
