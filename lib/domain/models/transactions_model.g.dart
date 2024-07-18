// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionsModel _$TransactionsModelFromJson(Map<String, dynamic> json) =>
    TransactionsModel(
      id: (json['id'] as num).toInt(),
      account: json['account'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$TransactionsModelToJson(TransactionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account': instance.account,
      'amount': instance.amount,
    };
