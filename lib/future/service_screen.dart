import 'dart:async';
import 'package:api_flutter/future/future_model_class.dart';

class PersonService {

  static List<Person> personList = [];

  Future<void> createPerson(Person person)async{
    await Future.delayed(const Duration(seconds: 1));
    return personList.add(person);
  }

  Future<List<Person>> getAllPerson()async{
    await Future.delayed(const Duration(seconds: 1));
    return personList;
  }

  Future<void> updatePerson(int index,Person updatePerson)async{
    await Future.delayed(const Duration(seconds: 1));
     personList[index] = updatePerson;
  }

  Future<void> deletePerson(int index)async{
    await Future.delayed(const Duration(seconds: 1));
    personList.removeAt(index);
  }
}