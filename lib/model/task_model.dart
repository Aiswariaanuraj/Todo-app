import 'package:hive/hive.dart';

// part task.g.dart;
@HiveType(typeId: 1)
class Task {
  Task(
      {required this.tname,
      required this.tdescription,
      required this.tpriority,
      required this.tfrmdate,
      required this.ttodate});

  @HiveField(0)
  String tname;
  @HiveField(1)
  String tdescription;
  @HiveField(2)
  String tpriority;
  @HiveField(3)
  String tfrmdate;
  @HiveField(4)
  String ttodate;
}
