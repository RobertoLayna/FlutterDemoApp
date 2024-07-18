import 'package:aplicaciones_moviles_app/data/repositories/transactions_repo_impl.dart';
import 'package:aplicaciones_moviles_app/domain/usecases/transactions.dart'
    as usecases;
import 'package:aplicaciones_moviles_app/presentation/bloc/transactions/transactions_bloc.dart';
import 'package:aplicaciones_moviles_app/presentation/bloc/transactions/transactions_event.dart';
import 'package:aplicaciones_moviles_app/presentation/bloc/transactions/transactions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page3 extends StatelessWidget {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(
        addTransactionUseCase: usecases.AddTransaction(TransactionsRepoImpl()),
        getTransactionsUseCase:
            usecases.GetTransactions(TransactionsRepoImpl()),
        getTransactionByIdUseCase:
            usecases.GetTransactionsById(TransactionsRepoImpl()),
      )..add(FetchTransactions()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Transactions'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: accountController,
                    decoration: InputDecoration(labelText: 'Account'),
                  ),
                  TextField(
                    controller: amountController,
                    decoration: InputDecoration(labelText: 'Amount'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final account = accountController.text;
                      final amount =
                          double.tryParse(amountController.text) ?? 0.0;
                      context.read<TransactionBloc>().add(
                          AddTransaction(account: account, amount: amount));
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is TransactionLoaded) {
                    return ListView.builder(
                      itemCount: state.transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = state.transactions[index];
                        return ListTile(
                          title: Text(transaction.account),
                          subtitle: Text(transaction.amount.toString()),
                          onTap: () {
                            context
                                .read<TransactionBloc>()
                                .add(ViewTransaction(id: transaction.id));
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return BlocBuilder<TransactionBloc,
                                    TransactionState>(
                                  builder: (context, state) {
                                    if (state is TransactionDetail) {
                                      return Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Account: ${state.transaction.account}'),
                                            Text(
                                                'Amount: ${state.transaction.amount}'),
                                          ],
                                        ),
                                      );
                                    } else if (state is TransactionLoading) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    } else if (state is TransactionError) {
                                      return Center(child: Text(state.message));
                                    } else {
                                      return SizedBox.shrink();
                                    }
                                  },
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  } else if (state is TransactionError) {
                    return Center(child: Text(state.message));
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
