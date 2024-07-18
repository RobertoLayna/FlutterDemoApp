import 'package:equatable/equatable.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();

  @override
  List<Object> get props => [];
}

class AddTransaction extends TransactionsEvent {
  final String account;
  final double amount;

  AddTransaction({required this.account, required this.amount});

  @override
  List<Object> get props => [account, amount];
}

class FetchTransactions extends TransactionsEvent {}

class ViewTransaction extends TransactionsEvent {
  final int id;

  ViewTransaction({required this.id});

  @override
  List<Object> get props => [id];
}
