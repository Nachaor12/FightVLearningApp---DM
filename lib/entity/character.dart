import 'package:my_aplication_proeyctdm1/entity/combo.dart';
import 'package:my_aplication_proeyctdm1/entity/movement.dart';


class Character{
  String name;
  String description;
  List<Movement> listMovements;
  List<Combo> listCombos;

  Character({required this.name, required this.description, 
            required this.listMovements, required this.listCombos});
}