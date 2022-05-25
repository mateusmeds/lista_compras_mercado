import 'package:dartz/dartz.dart' show Either;
import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';
import 'package:lista_compras_mercado/app/domain/repositories/purchase_repository.dart';
import 'package:lista_compras_mercado/app/domain/usecases/save_purchase_usecase.dart';

class SavePurchaseUseCaseImp implements SavePurchaseUseCase {
  SavePurchaseUseCaseImp(this._purchaseRepository);

  final PurchaseRepository _purchaseRepository;

  @override
  Future<Either<Exception, bool>> call(PurchaseEntity purchaseEntity) async {
    return await _purchaseRepository.save(purchaseEntity);
  }
}
