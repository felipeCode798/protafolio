import 'package:flutter/material.dart';
import 'proyects.dart';

class Cart extends ChangeNotifier {
  List<Proyects> proyectsdev = [
    Proyects(
      name: 'Contador',
      description: 'Incrementa y decrementa',
      tecnologi: 'Flutter',
      image: 'assets/images/contador-1.jpg',
    ),
    Proyects(
      name: 'Lista de tareas',
      description: 'Lista tareas pendientes',
      tecnologi: 'Flutter',
      image: 'assets/images/lista_tareas-1.jpg',
    ),
    Proyects(
      name: 'Integrity',
      description: 'Analisa la integirdad de documentos',
      tecnologi: 'Python',
      image: 'assets/images/integrity-1.jpg',
    ),
    Proyects(
      name: 'Control de Permisos',
      description: 'Getina los permisos de los empleados',
      tecnologi: 'Flutter',
      image: 'assets/images/control_permisos.jpg',
    ),
  ];

  List<Proyects> userCart = [];

  List<Proyects> getProyectsList() {
    return proyectsdev;
  }

  List<Proyects> getUserCart() {
    return userCart;
  }

  void addProyects(Proyects proyects) {
    userCart.add(proyects);
    notifyListeners();
  }

  void removeProyects(Proyects proyects) {
    userCart.remove(proyects);
    notifyListeners();
  }
}

class ChangeTheme extends ChangeNotifier {
  bool _isGrey = false;

  bool get isGrey => _isGrey;

  void toggleTheme() {
    _isGrey = !_isGrey;
    notifyListeners();
  }
}
