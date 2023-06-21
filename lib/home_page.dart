import 'package:flutter/material.dart';
import 'package:todo_app/style.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List toDoList = [];
  String iteam = "";
  myInputValue(value) {
    setState(() {
      iteam = value;
    });
  }

  addInputValue() {
    setState(() {
      toDoList.add({"iteam": iteam});
    });
  }

  // removeInputValue(index) {
  //   setState(() {
  //     toDoList.removeAt(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
                      child: TextFormField(
                        onChanged: (value) {
                          myInputValue(value);
                        },
                        decoration: appInputDeco("Add List Iteam"),
                      ),
                    ),
                    Expanded(
                        flex: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ElevatedButton.icon(
                              onPressed: () {
                                addInputValue();
                              },
                              icon: const Icon(Icons.add),
                              label: const Text("Add List")),
                        ))
                  ],
                )),
            Expanded(
              flex: 90,
              child: ListView.builder(
                  itemCount: toDoList.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      child: Container(
                        color: index % 2 == 0
                            ? Colors.grey[200]
                            : Colors.grey[100],
                        child: ListTile(
                          contentPadding: newMethod(),
                          title: Text(toDoList[index]["iteam"].toString()),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  toDoList.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.deepPurple,
                              )),
                        ),
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }

  EdgeInsets newMethod() => const EdgeInsets.all(16);
}
