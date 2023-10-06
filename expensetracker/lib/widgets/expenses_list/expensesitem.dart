import 'package:expensetracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense,{super.key});


  final Expense expense;

  @override
  Widget build(BuildContext context) {
    //  this is a card widget which displays a card shaped box
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4,), 
            Row(
              children: [Text('\$ ${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(height: 8,),
                    Text(expense.formattedDate.toString())
                  ],
                )
              ],

            )
          ],
        ),
      ),
      
      
    );
  }
}