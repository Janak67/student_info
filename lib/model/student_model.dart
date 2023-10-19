class StudentModel {
  String? name,std;
  int? id;

  StudentModel({this.id, this.name,this.std});

  factory StudentModel.fromMap(Map m1){
    StudentModel s1 =StudentModel(
      id: m1['grid'],
      name: m1['name'],
      std: m1['std'],
    );
    return s1;
  }
}