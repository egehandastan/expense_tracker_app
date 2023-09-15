import 'package:expense_tracker_app/widgets/chart/chart.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 69.99,
        date: DateTime.now(),
        cataegory: Category.shopping),
    Expense(
        title: 'Borsa',
        amount: 3000,
        date: DateTime.now(),
        cataegory: Category.investment)
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Gider silindi'),
        action: SnackBarAction(
          label: 'Geri al', 
          onPressed: (){
            setState(() {
              _registeredExpenses.insert(expenseIndex,expense);
            });
          }),
        ),
        );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text('Hiç gider bulunamadı.'),);
    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(
            expenses: _registeredExpenses,
            onRemoveExpense: _removeExpense,
          );
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text("Gider Takip"),
          backgroundColor: const Color.fromARGB(255, 133, 187, 101),
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            )
          ],
          ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
              child: mainContent )
        ],
      ),
    );
  }
}
