import 'package:dartz/dartz.dart' show Either;
import 'package:lista_compras_mercado/app/domain/repositories/purchase_repository.dart';
import 'package:lista_compras_mercado/app/domain/usecases/delete_purchase_usecase.dart';

class DeletePurchaseUseCaseImp implements DeletePurchaseUseCase {
  DeletePurchaseUseCaseImp(this._purchaseRepository);

  final PurchaseRepository _purchaseRepository;

  @override
  Future<Either<Exception, bool>> call(int key) async {
    return await _purchaseRepository.delete(key);
  }
}
