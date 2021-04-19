import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nvsfrontend/blocs/usertable/usertable_bloc.dart';
import 'package:nvsfrontend/library/Manager.dart';
import 'package:nvsfrontend/shared/models/fulluser.dart';

class UserTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocManager.getInstance().getBloc(UsertableBloc);
    var searchController = TextEditingController();
    bloc.add(LoadUsers(""));
    return Column(
      children: [
        TextField(
          controller: searchController,
          decoration: InputDecoration(border: InputBorder.none, hintText: 'Search'),
          onChanged: (_){
              bloc.add(LoadUsers(searchController.text));
          },
          ),

        BlocBuilder<UsertableBloc, UsertableState>(
          bloc: bloc,
          builder: (context, UsertableState state){
            if(state is UsertableLoaded){
              return _getLoadedWidget(state);
            }else {
              return Center(
                child: CircularProgressIndicator()
              );
            }
          }
        ),
      ],
    );
  }




  _getLoadedWidget(UsertableLoaded state){
    return DataTable(
      columns: [
        DataColumn(
            label: Text('Username',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Birthday',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Salary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      ],
      rows: _getRows(state.users),
    );
  }
  _getRows(List<FullUser> users) {
    var rows = [];
    for (FullUser user in users) {
      rows.add(
        DataRow(cells: [
          DataCell(Text(user.username)),
          DataCell(Text(user.birthdate)),
          DataCell(Text(user.salary)),
        ]),
      );
    }
    return rows;
  }
}
