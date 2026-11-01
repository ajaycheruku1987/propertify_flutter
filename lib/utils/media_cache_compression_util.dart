import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';

class MediaCacheCompressionUtil {
  /// Compresses and resizes an image file for fast upload and cached display.
  static Future<File> compressImage(File file, {int maxWidth = 1080, int quality = 80}) async {
    try {
      final bytes = await file.readAsBytes();
      final originalImage = img.decodeImage(bytes);
      if (originalImage == null) return file;

      // Resize if image width exceeds maxWidth
      img.Image resizedImage = originalImage;
      if (originalImage.width > maxWidth) {
        resizedImage = img.copyResize(originalImage, width: maxWidth);
      }

      final compressedBytes = img.encodeJpg(resizedImage, quality: quality);

      final tempDir = await getTemporaryDirectory();
      final targetPath = '${tempDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final compressedFile = File(targetPath);
      await compressedFile.writeAsBytes(compressedBytes);

      debugPrint('Image compressed: ${file.lengthSync()} bytes -> ${compressedFile.lengthSync()} bytes');
      return compressedFile;
    } catch (e) {
      debugPrint('Error compressing image: $e');
      return file;
    }
  }

  /// Compresses a video file for fast upload and efficient streaming.
  static Future<File> compressVideo(File file) async {
    try {
      debugPrint('Compressing video: ${file.path}');
      final mediaInfo = await VideoCompress.compressVideo(
        file.path,
        quality: VideoQuality.MediumQuality,
        deleteOrigin: false,
        includeAudio: true,
      );

      if (mediaInfo != null && mediaInfo.file != null) {
        debugPrint('Video compressed successfully: ${mediaInfo.file!.path}');
        return mediaInfo.file!;
      }
      return file;
    } catch (e) {
      debugPrint('Error compressing video: $e');
      VideoCompress.cancelCompression();
      return file;
    }
  }

  /// Generates a local thumbnail from a video file for instant preview.
  static Future<File?> generateVideoThumbnail(File videoFile) async {
    try {
      final thumbnailFile = await VideoCompress.getFileThumbnail(
        videoFile.path,
        quality: 75,
        position: -1, // first frame
      );
      return thumbnailFile;
    } catch (e) {
      debugPrint('Error generating video thumbnail: $e');
      return null;
    }
  }
}
