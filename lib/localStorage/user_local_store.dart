import 'package:habitapp/models/user_data.model.dart';
import 'package:hive/hive.dart';

class UserDataLocal {
  final box = Hive.box('habitStorage');

  loadThemeColor() {
    if (box.get('THEME') == null) {}
  }

  createInitialData() {
    
  }

  saveData(UserDataModel userDataModel) {
    box.putAll(<String, int?>{
      'THEME': userDataModel.themeMode,
      'COLOR': userDataModel.colorIndex
    });
  }

  int loadTheme() {
    final themeIndex = box.get('THEME');
    final num = int.parse(themeIndex);
    return num;
  }

  int loadColor() {
    final colorIndex = box.get('COLOR');
    final num = int.parse(colorIndex);
    return num;
  }
}
