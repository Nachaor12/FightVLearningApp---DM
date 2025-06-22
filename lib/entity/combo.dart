
class Combo {
  int id; //ID del combo
  String name; //Nombre del combo
  bool safe; //Si es seguro el combo en caso de no golpear 
  List<int> listMovements; //Lista de movimientos

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