import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class PathProviderService extends GetxService {
  /// ------------------------
  /// METHODS
  /// ------------------------

  /// Get app directory path
  Future<String> get appDirectoryPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /// Get temporary directory path
  Future<String> get temporaryDirectoryPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  /// Get app external directory path
  Future<String?> get externalAppDirectoryPath async {
    final directory = await getExternalStorageDirectory();

    if (directory != null) {
      return directory.path;
    }
    return null;
  }
}
