import 'package:expensetracker/widgets/expenses_list/expenseslist.dart';
import 'package:expensetracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(title: 'Flutter Course', amount: 500, date: DateTime.now(), category: Category.work),
    Expense(title: 'Cinema', amount: 200, date: DateTime.now(), category: Category.leisure),
    Expense(title: 'Raquet', amount: 700, date: DateTime.now(), category: Category.leisure),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [
        const Text('Expenses'),
        Expanded(child: ExpensesList(expenses: _registeredExpenses)) ,
      ],
    ),);
  }
}