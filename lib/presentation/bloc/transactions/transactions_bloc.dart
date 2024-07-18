import 'package:aplicaciones_moviles_app/domain/usecases/transactions.dart'
    as usecase;
import 'package:aplicaciones_moviles_app/presentation/bloc/transactions/transactions_event.dart';
import 'package:aplicaciones_moviles_app/presentation/bloc/transactions/transactions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionBloc extends Bloc<TransactionsEvent, TransactionState> {
  final usecase.AddTransaction addTransactionUseCase;
  final usecase.GetTransactions getTransactionsUseCase;
  final usecase.GetTransactionsById getTransactionByIdUseCase;

  TransactionBloc({
    required this.addTransactionUseCase,
    required this.getTransactionsUseCase,
    required this.getTransactionByIdUseCase,
  }) : super(TransactionInitial()) {
    on<FetchTransactions>(_onFetchTransactions);
    on<AddTransaction>(_onAddTransaction);
    on<ViewTransaction>(_onViewTransaction);
  }

  Future<void> _onFetchTransactions(
    FetchTransactions event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionLoading());
    try {
      final transactions = await getTransactionsUseCase();
      emit(TransactionLoaded(transactions: transactions));
    } catch (e) {
      emit(TransactionError(message: e.toString()));
    }
  }

  Future<void> _onAddTransaction(
    AddTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      await addTransactionUseCase(event.account, event.amount);
      add(FetchTransactions());
    } catch (e) {
      emit(TransactionError(message: e.toString()));
    }
  }

  Future<void> _onViewTransaction(
    ViewTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionLoading());
    try {
      final transaction = await getTransactionByIdUseCase(event.id);
      emit(TransactionDetail(transaction: transaction));
    } catch (e) {
      emit(TransactionError(message: e.toString()));
    }
  }
}
