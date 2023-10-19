import 'package:flutter/material.dart';
import 'package:student_info/utils/global.dart';

import '../model/student_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtGrid = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtStd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "Student Info",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            StudentModel student = Global.g1.stdlist[index];
            return Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "GRID : ${student.id}",
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      "Name : ${student.name}",
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Std : ${student.std}",
                      style: const TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            StudentModel s1 = Global.g1.stdlist[index];
                            txtName.text = s1.name!;
                            txtGrid.text = s1.id.toString();
                            txtStd.text = s1.std!;
                            updateDialog(index);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              Global.g1.stdlist.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: Global.g1.stdlist.length,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, 'edit').then((value) {
                setState(() {});
              });
            },
            child: const Icon(
              Icons.add_circle,
              color: Colors.black,
              size: 25,
            )),
      ),
    );
  }

  Future<dynamic> updateDialog(int index) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtGrid,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "GRID"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtStd,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Std"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Global.g1.stdlist[index] = StudentModel(
                      name: txtName.text,
                      std: txtStd.text,
                      id: int.tryParse(txtGrid.text));
                });
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
