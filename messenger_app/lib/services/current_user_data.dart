import 'package:messenger_app/models/user_model.dart';

abstract class CurrentUserData {
  static UserModel currentUser =
      UserModel(id: '', name: '', email: '', chatRoomList: []);
}
