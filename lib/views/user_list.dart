import 'package:cadastro_usuarios_crud/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:cadastro_usuarios_crud/data/dummy.users.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USERS};

    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Usuários'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, i) => UserTile(users.values.elementAt(i)),
        ));
  }
}
