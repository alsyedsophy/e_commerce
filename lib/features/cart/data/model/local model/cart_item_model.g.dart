// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCartItemModelAdapter extends TypeAdapter<HiveCartItemModel> {
  @override
  final int typeId = 0;

  @override
  HiveCartItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCartItemModel(
      id: fields[0] as String,
      productId: fields[1] as String,
      name: fields[2] as String,

      image: fields[3] as String,
      price: fields[4] as double,
      quantity: fields[5] as int,
      size: fields[6] as String,
      color: fields[7] as String,
      inStock: fields[8] as bool,
      createdAt: fields[9] as DateTime,
      updatedAt: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCartItemModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.quantity)
      ..writeByte(6)
      ..write(obj.size)
      ..writeByte(7)
      ..write(obj.color)
      ..writeByte(8)
      ..write(obj.inStock)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCartItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
