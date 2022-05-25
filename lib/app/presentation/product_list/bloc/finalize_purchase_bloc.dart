import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_compras_mercado/app/domain/usecases/save_purchase_usecase.dart';
import 'package:lista_compras_mercado/app/presentation/product_list/bloc/events/finalize_purchase_event.dart';
import 'package:lista_compras_mercado/app/presentation/product_list/bloc/states/finalize_purchase_state.dart';

class FinalizePurchaseBloc
    extends Bloc<FinalizePurchaseEvent, FinalizePurchaseState> {
  final SavePurchaseUseCase _savePurchaseUseCase;

  FinalizePurchaseBloc(this._savePurchaseUseCase)
      : super(SavePurchaseStartState()) {
    on<SavePurchaseEvent>(
        (event, emit) async => await _savePurchase(event, emit));
  }

  _savePurchase(SavePurchaseEvent event, Emitter emit) async {
    emit(SavePurchaseLoadingState());

    // await Future.delayed(const Duration(seconds: 2));

    var result = await _savePurchaseUseCase.call(event.purchaseEntity);
    result.fold((l) => emit(SavePurchaseErrorState()),
        (r) => emit(SavePurchaseSuccessState()));
  }
}
