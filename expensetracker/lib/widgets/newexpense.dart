import 'package:expensetracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key,required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}



class _NewExpenseState extends State<NewExpense> {


  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;



  // whenever you are storing the future value you have to use async await (then function is used to store future value)
  void _currentDate()async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year-1,now.month,now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now
      );

      setState(() {
        _selectedDate=pickedDate;
      });
  }

  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountcontroller.text);
    final amountIsValid = (enteredAmount==null) || (enteredAmount<=0);
    if (amountIsValid || _selectedDate==null || _titlecontroller.text.trim().isEmpty){
      // raise error !
      showDialog(context: context, builder: (ctx)=> 
        AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Enter Valid Data !'),
          actions: [
            TextButton(onPressed: (){
             Navigator.pop(ctx);
             } ,
             child: const Text('Close'))
          ],
        ),
      );
      return;
    }    
    // widget.onAddExpense
    widget.onAddExpense(Expense(title: _titlecontroller.text, amount: enteredAmount, date: _selectedDate!, category: _selectedCategory));
    Navigator.pop(context);
  }

  

  // dispose is required to delete 
  @override
  void dispose(){
    _titlecontroller.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            // whenever this input field changes , we wil change the value of _enteredTitle using this onchanged function
            controller: _titlecontroller,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title')
            ),
          ),
          TextField(
            controller: _amountcontroller,
            keyboardType: TextInputType.number,
            maxLength: 30,
            decoration: const InputDecoration(
              // prefixText is used to add a symbol before the amount
              prefixText: '\$',
              label: Text('Amount')
            ),
          ),

          Row(
            children: [
              Text(_selectedDate == null ? 'No Date Selected' : formatter.format(_selectedDate!)),
              IconButton(onPressed: _currentDate, icon: const Icon(Icons.calendar_month)),
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map((e) => DropdownMenuItem(
                  value:e,
                  child: Text(e.name.toString().toUpperCase())
                )
              ).toList(), onChanged: (value){
                if (value==null){
                  return;
                }
                setState(() {
                  _selectedCategory=value;
                });
              })
            ],
          ),
          Row(
            children: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text('Cancel')),
              ElevatedButton(onPressed:
                _submitExpenseData
              , child: const Text('Save Expense'))
            ],
          )
          
        ],
      ),

    );
  }
}