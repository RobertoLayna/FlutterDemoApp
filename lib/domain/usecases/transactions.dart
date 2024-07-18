import 'package:aplicaciones_moviles_app/domain/models/transactions_model.dart';
import 'package:aplicaciones_moviles_app/domain/repositories/transaction_repositoty.dart';

class AddTransaction {
  final TransactionsRepository repository;

  AddTransaction(this.repository);

  Future<void> call(String account, double amount) {
    return repository.addTransaction(account, amount);
  }
}

class GetTransactions {
  final TransactionsRepository repository;

  GetTransactions(this.repository);

  Future<List<TransactionsModel>> call() {
    return repository.getTransactions();
  }
}

class GetTransactionsById {
  final TransactionsRepository repository;

  GetTransactionsById(this.repository);

  Future<TransactionsModel> call(int id) {
    return repository.getTransactionById(id);
  }
}
