
class Person {

  String? name;
  int? age;

  Person({this.name,this.age});

  Map<String,dynamic> toMap(){
    return{
      'name':name,
      'age': age
    };
  }

  factory Person.frommap(Map<String,dynamic>map){
    return Person(
      name: map['name'],
      age: map['age']
    );
  }
}