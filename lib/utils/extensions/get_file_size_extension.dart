import 'dart:io';

extension XFileSizeExtension on File {
  /// Returns the file size in bytes
  Future<int> getSizeInBytes() async {
    final file = File(path);
    return await file.length();
  }

  /// Returns the file size in kilobytes (KB)
  Future<double> getSizeInKB() async {
    final bytes = await getSizeInBytes();
    return bytes / 1024;
  }

  /// Returns the file size in megabytes (MB)
  Future<double> getSizeInMB() async {
    final kb = await getSizeInKB();
    return kb / 1024;
  }
}
