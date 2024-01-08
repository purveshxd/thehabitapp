import 'package:hive/hive.dart';

class UserStorage {
  // final _userDataModel = UserDataModel();
  final box = Hive.box('habitStorage');
// UserDataModel();
  int getColor() {
    if (box.get('colorIndex') == null) {
      box.put('colorIndex', 6);
      return box.get('colorIndex');
    } else {
      return box.get('colorIndex');
    }
  }

  // saveData(UserDataModel userDataModel) {
  //   box.putAll(userDataModel.toMap());
  // }

  setDateJoined(DateTime date) {
    box.put('dateJoined', date);
  }

  String getDateJoined() {
    final date = box.get('dateJoined');
    return date.toString();
  }

  setColor(int index) {
    box.put('colorIndex', index);
  }

  setUsername(String userName) {
    box.put('userName', userName);
  }

  String getUsername() {
    final data = box.get('userName');
    print(data);
    return data.toString();
  }
}
