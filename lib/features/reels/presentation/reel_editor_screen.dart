// import 'dart:io';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:path_provider/path_provider.dart';

// class ReelEditorScreen extends StatefulWidget {
//   final String videoPath;
//   const ReelEditorScreen({super.key, required this.videoPath});

//   @override
//   State<ReelEditorScreen> createState() => _ReelEditorScreenState();
// }

// class _ReelEditorScreenState extends State<ReelEditorScreen> {
//   late VideoPlayerController _controller;
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   String? _selectedMusicUrl;
//   final TextEditingController _overlayTextController = TextEditingController(
//     text: 'Dummy Text',
//   );
//   bool _exporting = false;
//   String? _exportedPath;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.file(File(widget.videoPath))
//       ..setLooping(true)
//       ..initialize().then((_) {
//         if (mounted) setState(() {});
//         _controller.play();
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _audioPlayer.dispose();
//     _overlayTextController.dispose();
//     super.dispose();
//   }

//   Future<void> _playMusic(String url) async {
//     _selectedMusicUrl = url;
//     await _audioPlayer.stop();
//     await _audioPlayer.play(UrlSource(url));
//     setState(() {});
//   }

//   Future<void> _export() async {
//     if (_exporting) return;
//     setState(() => _exporting = true);
//     final dir = await getTemporaryDirectory();
//     final outPath =
//         '${dir.path}/reel_export_${DateTime.now().millisecondsSinceEpoch}.mp4';
//     final audioInput = _selectedMusicUrl ?? '';
//     if (audioInput.isEmpty) {
//       setState(() {
//         _exporting = false;
//         _exportedPath = widget.videoPath;
//       });
//       return;
//     }

//     final cmd =
//         "-y -i '${widget.videoPath}' -i '$audioInput' -shortest -map 0:v:0 -map 1:a:0 -c:v copy -c:a aac '$outPath'";
//     await FFmpegKit.execute(cmd);
//     setState(() {
//       _exporting = false;
//       _exportedPath = outPath;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Reel'),
//         actions: [
//           TextButton(
//             onPressed: _exporting ? null : _export,
//             child: _exporting
//                 ? const SizedBox(
//                     width: 18,
//                     height: 18,
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   )
//                 : const Text('Save'),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 if (_controller.value.isInitialized)
//                   FittedBox(
//                     fit: BoxFit.cover,
//                     child: SizedBox(
//                       width: _controller.value.size.width,
//                       height: _controller.value.size.height,
//                       child: VideoPlayer(_controller),
//                     ),
//                   )
//                 else
//                   const Center(child: CircularProgressIndicator()),
//                 Positioned(
//                   left: 16,
//                   right: 16,
//                   bottom: 40,
//                   child: Text(
//                     _overlayTextController.text,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border(top: BorderSide(color: Colors.grey.shade200)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: _overlayTextController,
//                         decoration: const InputDecoration(
//                           labelText: 'Overlay Text',
//                           border: OutlineInputBorder(),
//                         ),
//                         onChanged: (_) => setState(() {}),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     IconButton(
//                       onPressed: () {
//                         if (_controller.value.isPlaying) {
//                           _controller.pause();
//                         } else {
//                           _controller.play();
//                         }
//                         setState(() {});
//                       },
//                       icon: Icon(
//                         _controller.value.isPlaying
//                             ? Icons.pause_circle
//                             : Icons.play_circle,
//                         size: 32,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 const Text('Music'),
//                 const SizedBox(height: 8),
//                 Wrap(
//                   spacing: 8,
//                   children: [
//                     _MusicChip(
//                       label: 'Track 1',
//                       url:
//                           'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
//                       onTap: _playMusic,
//                       selectedUrl: _selectedMusicUrl,
//                     ),
//                     _MusicChip(
//                       label: 'Track 2',
//                       url:
//                           'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
//                       onTap: _playMusic,
//                       selectedUrl: _selectedMusicUrl,
//                     ),
//                     _MusicChip(
//                       label: 'Track 3',
//                       url:
//                           'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
//                       onTap: _playMusic,
//                       selectedUrl: _selectedMusicUrl,
//                     ),
//                   ],
//                 ),
//                 if (_exportedPath != null)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8),
//                     child: Text(
//                       'Saved: $_exportedPath',
//                       style: const TextStyle(fontSize: 12),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _MusicChip extends StatelessWidget {
//   final String label;
//   final String url;
//   final String? selectedUrl;
//   final Future<void> Function(String url) onTap;
//   const _MusicChip({
//     required this.label,
//     required this.url,
//     required this.onTap,
//     required this.selectedUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final selected = selectedUrl == url;
//     return ChoiceChip(
//       label: Text(label),
//       selected: selected,
//       onSelected: (_) => onTap(url),
//     );
//   }
// }
