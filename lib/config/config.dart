import 'package:delivery_app_customer/config/interface/i_config.dart';

class Config implements IConfig {
  @override
  get basePath {
    return 'http://ec2-35-92-23-237.us-west-2.compute.amazonaws.com';
  }
}
