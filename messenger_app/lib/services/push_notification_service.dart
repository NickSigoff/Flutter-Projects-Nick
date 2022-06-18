import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:messenger_app/models/push_notification_model.dart';

class PushNotificationService {
  //https://fcm.googleapis.com/fcm/send

  static const String pushNotificationStart = 'https://';
  static const String pushNotificationDomainName = 'fcm.googleapis.com';
  static const String pushNotificationPath = '/fcm/send';
  static const String pushNotificationServerKey =
      'AAAAytM3wB0:APA91bGZpj6uCxOiarGz_L6wxtlLDOimQiwBXyLg36CPFHt43G2kwAbj_AxYnxJyp1zX6F-bG1aKr2YzVcRNV_HO6uGSPFIOUx5i95Jxle7ivzVespATwPs_LhsgJcEvkhKF9Sr_iblF';

  Future<void> push(
      {required String to, required String title, required String body}) async {
    //var uri = Uri.https(pushNotificationDomainName, pushNotificationPath);

    try {
      http.Response response = await http.post(
          Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': 'key=$pushNotificationServerKey',
          },
          body: jsonEncode(PushNotificationModel(
              notification: Notification(title: title, body: body), to: to)));
      if (response.statusCode == 200) {
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
