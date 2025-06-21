import 'package:fightvlearning_app/entity/movement.dart';


class Combo {
  int id;
  String name;
  bool safe;
  List<Movement> listMovements;

  Combo({required this.id, required this.name, required this.safe, required this.listMovements});

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'safe': safe, 'listMovements': listMovements};
  }

  @override
  String toString(){
    return 'Combo{id: $id, name: $name, safe: $safe, listMovements: $listMovements}';
  }

  factory Combo.fromMap(Map<String, dynamic> map){
    return Combo(
      id: map['id'], 
      name: map['name'], 
      safe: map['safe'],
      listMovements: map['listMovements'],
      );
  }

}