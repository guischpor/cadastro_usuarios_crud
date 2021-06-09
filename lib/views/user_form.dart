import 'package:cadastro_usuarios_crud/models/user.dart';
import 'package:cadastro_usuarios_crud/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Formulário de Usuário'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState.validate();

                if (isValid) {
                  _form.currentState.save();
                  Provider.of<Users>(context, listen: false).put(
                    User(
                      id: _formData['id'],
                      name: _formData['name'],
                      email: _formData['email'],
                      avatarUrl: _formData['avatarUrl'],
                    ),
                  );
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe o seu nome completo';
                      }

                      if (value.trim().length < 5) {
                        return 'Nome muito pequeno. No minimo 5 letras!';
                      }

                      return null;
                    },
                    onSaved: (value) => _formData['name'] = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          value.length < 8) {
                        return 'Informe o seu email completo';
                      }

                      return null;
                    },
                    onSaved: (value) => _formData['email'] = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'URL do Avatar',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe a URL da sua foto de perfil!';
                      }

                      return null;
                    },
                    onSaved: (value) => _formData['avatarUrl'] = value,
                  ),
                ],
              ),
            )));
  }
}
