import 'package:cadastro_usuarios_crud/models/user.dart';
import 'package:cadastro_usuarios_crud/provider/users.dart';
import 'package:cadastro_usuarios_crud/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

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
          itemCount: users.count,
          itemBuilder: (context, i) => UserTile(users.byIndex(i)),
        ));
  }
}
