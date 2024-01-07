// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:habitapp/localStorage/user_storage.dart';
// import 'package:habitapp/models/user_data.model.dart';

// final userStateNotifier =
//     StateNotifierProvider(
//         (ref) => UserDataNotifier(UserDataModel()));

// class UserDataNotifier extends StateNotifier<UserDataModel> {
//   final UserDataModel _userDataModel;
//   final UserStorage _userDataLocal;

//   UserDataNotifier(this._userDataModel)
//       : super(UserDataModel(userName: 'userName'));

//   loadData() {
//     _userDataLocal.getUsername();
//     // final usrname = _userDataLocal.
//   }

//   setUsername(String userName) {
//     _userDataLocal.saveData(UserDataModel(userName: userName));
//     state.copyWith(userName: userName);
//   }

//   getUsername() {
//     // state.userName;
//     return _userDataLocal.getUsername();
//   }
// }
