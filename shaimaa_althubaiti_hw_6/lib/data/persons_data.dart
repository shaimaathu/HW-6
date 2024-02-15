import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:shaimaa_althubaiti_hw_6/model/persons_model.dart';

class PersonsData {
  List<Persons> personData = [];
  final storage = GetStorage();

  PersonsData() {
    loudData();
  }

  addData({required Persons person}) async {
    personData.add(person);
    List personeMap = [];

    personData.forEach((element) {
      personeMap.add(element.toMap());
    });

    await storage.write("person", jsonEncode(personeMap));
  }

  loudData() {
    if (storage.hasData("person")) {
      final reedingList = jsonDecode(storage.read("person"));
      for (var element in reedingList) {
        personData.add(Persons.fromJson(element));        
      }
    }
  }
}
