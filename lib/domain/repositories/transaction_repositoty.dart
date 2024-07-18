import 'package:aplicaciones_moviles_app/domain/models/transactions_model.dart';

abstract class TransactionsRepository {
  Future<void> addTransaction(String account, double amount);
  Future<List<TransactionsModel>> getTransactions();
  Future<TransactionsModel> getTransactionById(int id);
}
