import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_compras_mercado/app/domain/usecases/delete_purchase_usecase.dart';
import 'package:lista_compras_mercado/app/domain/usecases/get_all_purchases_usecase.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_list.dart/bloc/events/purchase_list_event.dart';
import 'package:lista_compras_mercado/app/presentation/purchase_list.dart/bloc/states/purchase_list_state.dart';

class PurchaseListBloc extends Bloc<PurchaseListEvent, PurchaseListState> {
  final GetAllPurchasesUseCase _getAllPurchasesUseCase;
  final DeletePurchaseUseCase _deletePurchaseUseCase;

  PurchaseListBloc(this._getAllPurchasesUseCase, this._deletePurchaseUseCase)
      : super(GetAllPurchasesStartState()) {
    on<GetAllPurchasesEvent>(
        (event, emit) async => await _getAllPurchases(event, emit));
    on<DeletePurchaseEvent>(
        (event, emit) async => await _deletePurchase(event, emit));
  }

  _getAllPurchases(GetAllPurchasesEvent event, Emitter emit) async {
    emit(GetAllPurchasesLoadingState());

    var result = await _getAllPurchasesUseCase.call();
    result.fold(
        (l) => emit(GetAllPurchasesErrorState()),
        (r) => emit(r.isEmpty
            ? GetAllPurchasesEmptyState()
            : GetAllPurchasesSuccessState(r)));
  }

  _deletePurchase(DeletePurchaseEvent event, Emitter emit) async {
    emit(DeletePurchaseLoadingState());

    var result = await _deletePurchaseUseCase.call(event.key);
    result.fold((l) => emit(DeletePurchaseErrorState()),
        (r) => emit(DeletePurchaseSuccessState()));
  }
}
