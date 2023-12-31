import 'package:hive/hive.dart';
import 'package:hive_project_tests/model.dart';

class ImfoEmployee extends TypeAdapter<Employee> {
  @override
  final int typeId = 1;

  @override
  Employee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Employee()
      ..id = fields[0] as int
      ..name = fields[1] as String
      ..sex = fields[2] as String
      ..position = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, Employee obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.sex)
      ..writeByte(10)
      ..write(obj.position);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImfoEmployee &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
