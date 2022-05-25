import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_compras_mercado/app/domain/usecases/get_all_purchases_usecase.dart';
import 'package:lista_compras_mercado/app/domain/usecases/save_purchase_usecase.dart';
import 'package:lista_compras_mercado/app/presentation/product_list/bloc/events/finalize_purchase_event.dart';
import 'package:lista_compras_mercado/app/presentation/product_list/bloc/states/finalize_purchase_state.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_list.dart/bloc/events/purchase_list_event.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_list.dart/bloc/states/purchase_list_state.dart';

class PurchaseListBloc extends Bloc<PurchaseListEvent, PurchaseListState> {
  final GetAllPurchasesUseCase _getAllPurchasesUseCase;

  PurchaseListBloc(this._getAllPurchasesUseCase)
      : super(GetAllPurchasesStartState()) {
    on<GetAllPurchasesEvent>(
        (event, emit) async => await _getAllPurchases(event, emit));
  }

  _getAllPurchases(GetAllPurchasesEvent event, Emitter emit) async {
    emit(GetAllPurchasesLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    var result = await _getAllPurchasesUseCase.call();
    result.fold((l) => emit(GetAllPurchasesErrorState()),
        (r) => emit(GetAllPurchasesSuccessState(r)));
  }
}
