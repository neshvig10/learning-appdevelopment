import 'package:expensetracker/widgets/expenses_list/expenseslist.dart';
import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/widgets/newexpense.dart';
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

  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  //  function to open the screen on clicking the + button

  // this is used to open a modalbottom sheet when we click on the + icon
  void _openAddExpenseOverlay(){
    showModalBottomSheet(context: context, builder: (ctx)=> NewExpense(onAddExpense:_addExpense),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
      children: [
        Expanded(child: ExpensesList(expenses: _registeredExpenses)) ,
      ],
    ),);
  }
}