import 'package:json_annotation/json_annotation.dart';

part 'transactions_model.g.dart';

@JsonSerializable()
class TransactionsModel {
  final int id;
  final String account;
  final double amount;

  TransactionsModel(
      {required this.id, required this.account, required this.amount});

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsModelToJson(this);
}
