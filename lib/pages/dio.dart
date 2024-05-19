import "package:flutter/material.dart";
import 'package:dio/dio.dart';

class DioPage extends StatefulWidget {
  const DioPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return DioPageElement();
  }
}

class DioPageElement extends State<DioPage> {
  var jsonList;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio().get('https://dummyjson.com/products');
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['products'] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF233976),
        title: const Text(
          "Dio Package",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 10,
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: jsonList == null ? 0 : jsonList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.network(
                  jsonList[index]['thumbnail'],
                  fit: BoxFit.fill,
                  width: 50,
                  height: 50,
                ),
              ),
              title: Text(jsonList[index]['title']),
              subtitle: Text(jsonList[index]['description']),
            ),
          );
        },
      ),
    );
  }
}
