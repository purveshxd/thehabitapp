import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitapp/localStorage/user_local_store.dart';
import 'package:habitapp/models/user_data.model.dart';

class UserDataNotifier extends StateNotifier {
  final UserDataLocal _userDataLocal;
  UserDataNotifier(this._userDataLocal) : super(_userDataLocal);

  saveThemeData(int colorIndex, int themeIndex) {
    _userDataLocal
        .saveData(UserDataModel(colorIndex: colorIndex, themeMode: themeIndex));
  }

  


}
