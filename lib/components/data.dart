import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nvsfrontend/blocs/dataformbloc/dataform_bloc.dart';
import 'package:nvsfrontend/library/Manager.dart';

class DataForm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var birthController = TextEditingController();
    var salaryController = TextEditingController();
    return Form(
      child: Column(
        children: [
            TextField(
              controller: birthController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Birthday'
              ),
            ),
            TextField(
              controller: salaryController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Salary'
              ),
            ),
            TextButton(
              onPressed: () { 
                BlocManager.getInstance().getBloc(DataformBloc).add(DataEntered(birthController.text, salaryController.text));
               },
              child: Text("Send")
            ),
        ]
      ),
    );
  }
  
}