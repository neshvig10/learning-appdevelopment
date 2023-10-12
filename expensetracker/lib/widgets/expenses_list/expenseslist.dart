import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/widgets/expenses_list/expensesitem.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key,required this.expenses});


  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    //  scrollable list widget provided by flutter !
    // In Flutter, ListView.builder is a widget that allows you to create a scrollable list of items efficiently.
    return ListView.builder(itemCount: expenses.length ,itemBuilder: (ctx,index) => Dismissible(
      key: ValueKey(expenses[index]),
      child: ExpenseItem(expenses[index]))  ,);
  }
}