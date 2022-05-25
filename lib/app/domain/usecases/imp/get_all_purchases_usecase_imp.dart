import 'package:dartz/dartz.dart' show Either;
import 'package:lista_compras_mercado/app/domain/entities/purchase_entity.dart';
import 'package:lista_compras_mercado/app/domain/repositories/purchase_repository.dart';
import 'package:lista_compras_mercado/app/domain/usecases/get_all_purchases_usecase.dart';

class GetAllPurchasesUseCaseImp implements GetAllPurchasesUseCase {
  GetAllPurchasesUseCaseImp(this._purchaseRepository);

  final PurchaseRepository _purchaseRepository;

  @override
  Future<Either<Exception, List<PurchaseEntity>>> call() async {
    return await _purchaseRepository.getAll();
  }
}
