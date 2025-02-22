import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class GetHomeBannerRequest extends IRemoteTarget {
  @override
  String? get path => Urls.banner;

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  get body => {"Content": ""};

  @override
  get headers => {"Content-Type": "application/x-www-form-urlencoded"};
}
