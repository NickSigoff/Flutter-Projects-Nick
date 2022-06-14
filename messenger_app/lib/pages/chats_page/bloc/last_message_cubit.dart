import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'last_message_state.dart';

class LastMessageCubit extends Cubit<LastMessageState> {
  LastMessageCubit() : super(LastMessageInitial());

  void downloadLastMessage(){
    // try {
    //   Stream<DocumentSnapshot<Map<String, dynamic>>> stream =
    //   FirebaseService().getChatRoomStream();
    //
    //   StreamController<DocumentSnapshot<Map<String, dynamic>>> controller =
    //   StreamController();
    //
    //   controller.addStream(stream);
    //   controller.stream.listen((event) async {
    //     List<dynamic> chatRoomList = event.get('chatRoomList');
    //     if (chatRoomList.isEmpty) {
    //       emit(ChatEmptyChats(chatRoomList: chatRoomList));
    //     } else {
    //       emit(ChatLoading());
    //       List<UserChatModel> chatRoomModelList =
    //       await _createUserChatModelList(chatRoomList);
    //
    //       emit(ChatDownloadedChats(chatRoomModelList: chatRoomModelList));
    //     }
    //   });
    // } catch (e) {
    //   emit(ChatError());
    // }
  }






}
