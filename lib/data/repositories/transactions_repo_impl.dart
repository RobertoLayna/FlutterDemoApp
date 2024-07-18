import 'package:aplicaciones_moviles_app/domain/models/transactions_model.dart';
import 'package:aplicaciones_moviles_app/domain/repositories/transaction_repositoty.dart';
import 'package:dio/dio.dart';

class TransactionsRepoImpl implements TransactionsRepository {
  final Dio _dio = Dio();

  @override
  Future<void> addTransaction(String account, double amount) async {
    final transaction =
        TransactionsModel(id: 0, account: account, amount: amount);
    await _dio.post("url", data: transaction.toJson());
  }

  @override
  Future<TransactionsModel> getTransactionById(int id) async {
    final result = await _dio.get('/transactions/$id');
    return TransactionsModel.fromJson(result.data);
  }

  @override
  Future<List<TransactionsModel>> getTransactions() async {
    final result = await _dio.get('/transactions');
    return (result as List)
        .map((tr) => TransactionsModel.fromJson(tr))
        .toList();
  }
}
