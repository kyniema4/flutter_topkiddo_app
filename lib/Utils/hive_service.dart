import 'package:hive/hive.dart';

class HiveService {
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

  putBoxesWithId(String id, List items, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    openBox.put(id, items);
  }

  getBoxesWithId<T>(String id, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    return openBox.get(id);
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
