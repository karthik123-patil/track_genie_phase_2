import 'package:package_info_plus/package_info_plus.dart';

class PackageInformation {
  Future<PackageInfo> getPackageData() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }

  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
