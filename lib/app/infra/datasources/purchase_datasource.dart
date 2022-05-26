import 'package:dartz/dartz.dart';
import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';

abstract class PurchaseDatasource {
  Future<Either<Exception, bool>> save(PurchaseEntity purchaseEntity);
  Future<Either<Exception, List<PurchaseEntity>>> getAll();
  Future<Either<Exception, bool>> delete(int key);
}
