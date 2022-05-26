import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:lista_compras_mercado/app/domain/repositories/purchase_repository.dart';
import 'package:lista_compras_mercado/app/infra/datasources/purchase_datasource.dart';

class PurchaseRepositoryImp implements PurchaseRepository {
  PurchaseRepositoryImp(this._purchaseDatasource);

  final PurchaseDatasource _purchaseDatasource;

  @override
  Future<Either<Exception, bool>> save(PurchaseEntity purchaseEntity) async {
    return await _purchaseDatasource.save(purchaseEntity);
  }

  @override
  Future<Either<Exception, List<PurchaseEntity>>> getAll() async {
    return await _purchaseDatasource.getAll();
  }

  @override
  Future<Either<Exception, bool>> delete(int key) async {
    return await _purchaseDatasource.delete(key);
  }
}
