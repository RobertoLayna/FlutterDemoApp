import 'package:aplicaciones_moviles_app/domain/models/transactions_model.dart';
import 'package:equatable/equatable.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<TransactionsModel> transactions;

  TransactionLoaded({required this.transactions});

  @override
  List<Object> get props => [transactions];
}

class TransactionDetail extends TransactionState {
  final TransactionsModel transaction;

  TransactionDetail({required this.transaction});

  @override
  List<Object> get props => [transaction];
}

class TransactionError extends TransactionState {
  final String message;

  TransactionError({required this.message});

  @override
  List<Object> get props => [message];
}
