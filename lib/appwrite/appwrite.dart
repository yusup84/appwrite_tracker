import 'package:appwrite/appwrite.dart';

class Appwrite {
  Client client = Client();
  Appwrite() {
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('appwrite-tracker');
  }
}
