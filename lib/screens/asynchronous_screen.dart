import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/utils/custom_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AsynchronousScreen extends StatelessWidget {
  const AsynchronousScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AsynchronousProgramming(),
    );
  }
}

class AsynchronousProgramming extends StatefulWidget {
  const AsynchronousProgramming({super.key});

  @override
  State<AsynchronousProgramming> createState() => _AsynchronousProgrammingState();
}

class _AsynchronousProgrammingState extends State<AsynchronousProgramming> {
  
  final ctrl1 = TextEditingController();
  final ctrl2 = TextEditingController();
  final GetStorage box = GetStorage();
  String storageValue = "";
  List<String> storageList = ["Empty List"];
  Map<String, dynamic> storageMap = {"MapValue": "EmptyMap"};
  Person storagePerson = Person("unknown", 0);
  String storageListenValue = "female";
  String storageNullValue = "Not Null Value";

  @override
  void initState() {
    super.initState();
    // Write a value to storage and observe changes
    box.write('user_gender', 'female');
    getStorageValue();
  }
  
  @override
  void dispose() {
    super.dispose();
    ctrl1.dispose();
    ctrl2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(text: "Asynchronous Programming", size: 16),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            customText(text: "SharedPreferences", size: 14),
            Container(
              width: Get.width,
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  customText(text: "Previous Stored Value", size: 14, color: Colors.green),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: ctrl1,
                      readOnly: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)
                        ),
                        enabledBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Container(
              width: Get.width,
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  customText(text: "Store New Value", size: 14, color: Colors.green),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                       controller: ctrl2,
                      textInputAction: TextInputAction.send,
                      onFieldSubmitted: (value){
                         saveCurrentValue(value);
                      },
                      autofocus: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)
                        ),
                        enabledBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            customText(text: "GetStorage", size: 14),
            const SizedBox(height: 10),
            customElevated(pressed: (){
              setStorageValue();
            }, btnText: "Get Storage Value", ctx: context, widthSpace: 0.5),
            const SizedBox(height: 10),
            customText(text: storageValue, size: 14, color: Colors.green),
            const SizedBox(height: 10),
            customText(text: storageList.toString(), size: 14, color: Colors.green),
            const SizedBox(height: 10),
            customText(text: storageMap.values.toString(), size: 14, color: Colors.green),
            const SizedBox(height: 10),
            customText(text: "${storagePerson.name} ${storagePerson.age}", size: 14, color: Colors.green),
            const SizedBox(height: 10),
            customText(text: storageListenValue, size: 14, color: Colors.green),
            const SizedBox(height: 10),
            customText(text: storageNullValue, size: 14, color: Colors.green),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void getStorageValue() async{
    await GetStorage.init(); // initialize the storage system
    final prefs = await SharedPreferences.getInstance();
    ctrl1.text = prefs.getString("AsynchronousValue") ?? "No Previous Value Stored Yet!";
    storageValue = box.read('username') ?? "no storage value"; // to get the value from storage use read method
    //storageList = box.read('fruits') ?? <String>["Empty List"];
    storageMap = box.read('person') ?? {"MapValue": "EmptyMap"};
    final storedString = box.read('person_info') ?? jsonEncode(Person("Unknown", 0).toJson());
    storagePerson = Person.fromJson(jsonDecode(storedString));
    storageNullValue = box.read("null") ?? "Not Null Value";
    // Register a listener to observe changes to a stored value, but before that we have to write a value so it can ovserve that value
    box.listenKey('user_gender', (value){
         storageListenValue = value;
    });
    setState(() {

    });
  }
  
  void saveCurrentValue(String value){
    Get.putAsync<SharedPreferences>(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('AsynchronousValue', value);
      return prefs;
    },permanent: true);
  }

  void setStorageValue() async{
    box.write('username', 'john.doe'); // to store the value into storage use write method
    final myList = ['apple', 'banana', 'orange'];
    final myMap = {'name': 'JohnDoe', 'age': 30};
    // to store the list or map values directly pass the variable of data
    box.write('fruits', myList);
    box.write('person', myMap);
    final person = Person('John', 30); // To store an object, you need to serialize the object to a string before storing it. One way to do this is to use the dart:convert library and the jsonEncode() function to convert the object to a JSON string
    box.write('person_info', jsonEncode(person.toJson()));
    // Write a value only if the key does not already exist
    box.writeIfNull('null', 'null value');
    // Write a value to storage and observe changes
    box.write('user_gender', 'male');
    getStorageValue(); // call this method to see updated data instantly otherwise we have to come back to this screen again
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  Map<String, dynamic> toJson() => {'name': name, 'age': age};

  factory Person.fromJson(Map<String, dynamic> json) =>
      Person(json['name'], json['age']);
}

