import 'package:hive/hive.dart';

part 'cat.g.dart';

@HiveType(typeId: 1)
class Cat {
  @HiveField(0)
  final String fact;
  @HiveField(1)
  final int length;
  @HiveField(2)
  final String? createdDate;

  const Cat({required this.fact, required this.length, this.createdDate});

  factory Cat.fromJson(Map<String, dynamic> json) =>
      Cat(fact: json['fact'], length: json['length']);

  Map<String, dynamic> toJson() => {
        'fact': fact,
        'length': length,
      };
}
