import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HiveService {
  String keyFlashCard = "currentData";

  isExists({String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }

  addBoxes<T>(List<T> items, String boxName) async {
    print("adding boxes");
    final openBox = await Hive.openBox(boxName);

    for (var item in items) {
      openBox.add(item);
    }
  }

  putBoxesWithKey(String key, dynamic items, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    openBox.put(key, items);
  }

  getBoxesWithKey<T>(String key, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    return openBox.get(key);
  }

  getBoxes<T>(String boxName) async {
    List boxList = [];

    final openBox = await Hive.openBox(boxName);

    int length = openBox.length;

    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }

    return boxList;
  }

  clearBoxes(String boxName) async {
    final openBox = await Hive.openBox(boxName);
    openBox.clear();
    print('clear box success');
  }
}
