import 'package:hive/hive.dart';
import 'package:lista_compras_mercado/app/domain/entities/product_entity.dart';
import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:lista_compras_mercado/app/infra/datasources/purchase_datasource.dart';

class PurchaseDatasourceImp implements PurchaseDatasource {
  PurchaseDatasourceImp() {
    _registerAdapter();
  }

  final String nameBox = 'purchase_list_tb_purchases';

  late Box<PurchaseEntity> context;

  @override
  Future<Either<Exception, bool>> save(PurchaseEntity purchaseEntity) async {
    try {
      await _openBox();
      await context.add(purchaseEntity);
      return const Right(true);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<PurchaseEntity>>> getAll() async {
    try {
      await _openBox();
      var result = context.values;
      return Right(result.toList());
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> delete(int key) async {
    try {
      await _openBox();
      await context.delete(key);
      return const Right(true);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future _openBox() async {
    try {
      context = await Hive.openBox<PurchaseEntity>(nameBox);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  _registerAdapter() {
    if (!Hive.isAdapterRegistered(PurchaseEntityAdapter().typeId)) {
      Hive.registerAdapter<PurchaseEntity>(PurchaseEntityAdapter());
      Hive.registerAdapter<ProductEntity>(ProductEntityAdapter());
    }
  }
}
