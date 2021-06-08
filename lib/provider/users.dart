import 'dart:math';
import 'package:cadastro_usuarios_crud/data/dummy.users.dart';
import 'package:cadastro_usuarios_crud/models/user.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  Map<String, User> _items = {...DUMMY_USERS};

  //lista busca todos os dados
  List<User> get all {
    return [..._items.values];
  }

  //lista que faz a contagem de dados
  int get count {
    return _items.length;
  }

  //retorna por indice
  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  //funcao adicionar ou alterar
  void put(User user) {
    if (user == null) {
      return;
    }

    //teste pra saber se vai adicionar ou alterar
    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
        user.id,
        (_) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }

    notifyListeners();
  }

  //metodo para exclusão de dados
  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
