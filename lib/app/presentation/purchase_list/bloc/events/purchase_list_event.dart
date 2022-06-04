abstract class PurchaseListEvent {}

class GetAllPurchasesEvent extends PurchaseListEvent {}

class DeletePurchaseEvent extends PurchaseListEvent {
  DeletePurchaseEvent(this.key);

  int key;
}
