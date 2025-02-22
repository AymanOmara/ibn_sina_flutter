import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class DeleteAccountRequest extends IRemoteTarget {
  final String userId;

  DeleteAccountRequest({required this.userId}) {
    path = Urls.deleteAccount+userId;
  }
}
