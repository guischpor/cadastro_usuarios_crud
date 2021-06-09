import 'package:cadastro_usuarios_crud/provider/users.dart';
import 'package:cadastro_usuarios_crud/routes/app_routes.dart';
import 'package:cadastro_usuarios_crud/views/user_form.dart';
import 'package:cadastro_usuarios_crud/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Users(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: UserList(),
        routes: {
          AppRoutes.HOME: (context) => UserList(),
          AppRoutes.USER_FORM: (context) => UserForm(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
