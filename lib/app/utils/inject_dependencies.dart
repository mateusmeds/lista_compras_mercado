import 'package:get_it/get_it.dart';
import 'package:lista_compras_mercado/app/domain/usecases/imp/delete_purchase_usecase_imp.dart';
import 'package:lista_compras_mercado/app/domain/usecases/imp/get_all_purchases_usecase_imp.dart';
import 'package:lista_compras_mercado/app/domain/usecases/imp/save_purchase_usecase_imp.dart';
import 'package:lista_compras_mercado/app/infra/datasources/imp/purchase_datasource_imp.dart';
import 'package:lista_compras_mercado/app/infra/repositories/purchase_repositoty_imp.dart';
import 'package:lista_compras_mercado/app/presentation/product_list/bloc/finalize_purchase_bloc.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_list/bloc/purchase_list_bloc.dart';

class InjectDependencies {
  static load() {
    GetIt getIt = GetIt.instance;

    if (!getIt.isRegistered<FinalizePurchaseBloc>()) {
      getIt.registerFactory<FinalizePurchaseBloc>(
        () => FinalizePurchaseBloc(SavePurchaseUseCaseImp(
            PurchaseRepositoryImp(PurchaseDatasourceImp()))),
      );
    }

    if (!getIt.isRegistered<PurchaseListBloc>()) {
      getIt.registerFactory<PurchaseListBloc>(
        () => PurchaseListBloc(
            GetAllPurchasesUseCaseImp(
                PurchaseRepositoryImp(PurchaseDatasourceImp())),
            DeletePurchaseUseCaseImp(
                PurchaseRepositoryImp(PurchaseDatasourceImp()))),
      );
    }
  }
}
