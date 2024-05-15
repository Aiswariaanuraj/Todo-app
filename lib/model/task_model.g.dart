// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      tname: fields[0] as String,
      tdescription: fields[1] as String,
      tpriority: fields[2] as String,
      tfrmdate: fields[3] as String,
      ttodate: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.tname)
      ..writeByte(1)
      ..write(obj.tdescription)
      ..writeByte(2)
      ..write(obj.tpriority)
      ..writeByte(3)
      ..write(obj.tfrmdate)
      ..writeByte(4)
      ..write(obj.ttodate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
