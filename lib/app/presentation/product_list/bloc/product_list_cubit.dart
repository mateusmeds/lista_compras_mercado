import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_compras_mercado/app/domain/entities/product_entity.dart';

class ProductListCubit extends Cubit<List<ProductEntity>> {
  ProductListCubit(List<ProductEntity> productEntityList)
      : super(productEntityList);

  double get totalValue {
    return state.fold<double>(
        0, (previousValue, element) => previousValue + element.totalPrice);
  }

  void add(ProductEntity productEntity) {
    state.add(productEntity);
    emit(List.of(state));
  }

  void incrementProduct(int index) {
    state[index].add();
    emit(List.of(state));
  }

  void decrementProduct(int index) {
    state[index].remove();
    emit(List.of(state));
  }

  void removeProduct(int index) {
    state.removeAt(index);
    emit(List.of(state));
  }
}
