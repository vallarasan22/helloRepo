import 'package:flutter/material.dart';
import 'future/future_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: StudentClass(),
    );
  }
}


class StudentClass extends StatefulWidget {
  const StudentClass({super.key});
  @override
  State<StudentClass> createState() => _StudentClassState();
}

class _StudentClassState extends State<StudentClass> {
      final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Student DataBase"),),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
               GestureDetector(
                 onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FuturePage()));
                 },
                 child: Container(
                  height: 40,
                  width: 80,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(8,),color: Colors.blueAccent),
                  child: const Center(child: Text("Next Page",style: TextStyle(color: Colors.white),)),),
               ),
              const SizedBox(height: 16),



            ],
          ),
        ),
      ),
    );
  }
}

