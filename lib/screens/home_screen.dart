import 'package:flutter/material.dart';
import 'package:student_info/utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            return Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.2,
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
                      "GRID : ${Global.g1.stdlist[index]['Grid']}",
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      "Name : ${Global.g1.stdlist[index]['Name']}",
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Std : ${Global.g1.stdlist[index]['Std']}",
                      style: const TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder()),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            });
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              Global.g1.stdlist
                                  .remove(Global.g1.stdlist[index]);
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
}
