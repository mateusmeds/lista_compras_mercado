// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PurchaseEntityAdapter extends TypeAdapter<PurchaseEntity> {
  @override
  final int typeId = 0;

  @override
  PurchaseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseEntity(
      products: (fields[1] as List).cast<ProductEntity>(),
    )..date = fields[2] as DateTime;
  }

  @override
  void write(BinaryWriter writer, PurchaseEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.products)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
