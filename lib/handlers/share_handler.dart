import 'package:catcher/model/report.dart';
import 'package:catcher/model/platform_type.dart';
import 'package:catcher/model/report_handler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:share_plus/share_plus.dart';

class ShareHandler extends ReportHandler {
  @override
  List<PlatformType> getSupportedPlatforms() => [
        PlatformType.android,
        PlatformType.iOS,
        PlatformType.web,
        PlatformType.linux,
        PlatformType.macOS,
        PlatformType.windows,
      ];
  @override
  Future<bool> handle(Report error, BuildContext? context) async {
    await Share.share(processReport(error));
    return true;
  }

  String processReport(Report report) {
    String error = "";
    if (report.error != null) {
      error = report.error.toString();
    } else if (report.errorDetails != null) {
      error = report.errorDetails.toString();
    }
    error = error + "\n" + report.stackTrace.toString();

    return error;
  }
}
