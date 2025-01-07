import 'package:api_flutter/custom_button.dart';
import 'package:api_flutter/custom_text_field.dart';
import 'package:api_flutter/future/future_model_class.dart';
import 'package:api_flutter/future/service_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final PersonService personService = PersonService();
  List<Person> personList = [];


  void addPerson()async{
      String name = nameController.text;
      int age = int.tryParse(ageController.text) ?? 0;

      if(name.isNotEmpty && age >0){

        Person newPerson = Person(name: name,age: age);
        await personService.createPerson(newPerson);
        loadPerson();
      }
  }

  void loadPerson()async{
     List<Person> persons = await personService.getAllPerson();
     setState(() {
       personList = persons;
     });
  }

  void deletePerson(int index)async{
    await personService.deletePerson(index);
    loadPerson();
  }

  void updatePerson(int index)async{
    String name = nameController.text;
    int age = int.tryParse(ageController.text) ?? 0;
     Person updatePerson = Person(name: name,age: age);
     await personService.updatePerson(index, updatePerson);
    loadPerson();
  }

  @override
  void initState() {
    super.initState();
    loadPerson();
  }

  void _showEditDialog(int index) {
    nameController.text = personList[index].name!;
    ageController.text = personList[index].age.toString();

    showDialog(context: context, builder: (context){
      return AlertDialog(title: const Text("Edit Person"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              String name = nameController.text;
              int age = int.tryParse(ageController.text) ?? 0;

              if (name.isNotEmpty && age > 0) {
                Person updatedPerson = Person(name: name, age: age);
                personService.updatePerson(index, updatedPerson);
                loadPerson();
                Navigator.of(context).pop();
              }
            },
            child:const Text('Save'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Don/t want'),
          ),
        ],
      );
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          CustomTextField(controller: nameController,
            labelText: 'Email',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
            if(value == null || value.isEmpty){
              return 'Please enter an email';
            }
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
              }
              return null;
          },),
          CustomTextField(controller: nameController,
            labelText: 'Password',
            icon: Icons.password,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
            if(value == null || value.isEmpty){
              return 'Please enter an password';
            }
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
              }
              return null;
          },),
          CustomTextField(controller: nameController,
            labelText: 'Phone Num',
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
            validator: (value) {
            if(value == null || value.isEmpty){
              return 'Please enter your phone no';
            }
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid phone';
              }
              return null;
          },),


          /*TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),*/
          TextField(
            controller: ageController,
            decoration: const InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
          ),
             const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtonWidget(
                text: 'Submit',
                icon: Icons.check,
                color: Colors.blue, // Set loading state to true
                onPressed: () {
                  // Button press action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Submit Button Pressed')),
                  );
                }, height: 50, width: 150,
              )

            ],
          ),
         const SizedBox(height: 30),
          Expanded(child: ListView.builder(itemCount: personList.length,itemBuilder: (context,index){
            return ListTile(
              title: Text(personList[index].name!),
              subtitle: Text('age : ${personList[index].age}'),
              leading:IconButton(onPressed: () => _showEditDialog(0), icon: const Icon(Icons.edit)),
              trailing:IconButton(onPressed: () => deletePerson(0), icon: const Icon(Icons.delete)),

            );

          }))
        ],
      ),
    ),
    );
  }
}
