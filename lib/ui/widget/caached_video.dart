
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../_lib.dart';

class FirebaseCachedVideoPlayer extends StatefulWidget {
  final String firebaseVideoUrl;
  const FirebaseCachedVideoPlayer({super.key, required this.firebaseVideoUrl});

  @override
  State<FirebaseCachedVideoPlayer> createState() =>
      _FirebaseCachedVideoPlayerState();
}

class _FirebaseCachedVideoPlayerState extends State<FirebaseCachedVideoPlayer> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  Future<void> _loadVideo() async {
    final cachedFile = await cacheFirebaseVideo(widget.firebaseVideoUrl);
    _videoController = VideoPlayerController.file(cachedFile);
    await _videoController!.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoController!,
      autoPlay: false,
      looping: false,
    );

    setState(() {});
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Chewie(controller: _chewieController!);
  }
}



class AutoPlayVideoWidget extends StatefulWidget {
  final String firebaseVideoUrl;
  const AutoPlayVideoWidget({super.key, required this.firebaseVideoUrl});

  @override
  State<AutoPlayVideoWidget> createState() => _AutoPlayVideoWidgetState();
}

class _AutoPlayVideoWidgetState extends State<AutoPlayVideoWidget> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _prepareVideo();
  }

  Future<void> _prepareVideo() async {
    final file = await cacheFirebaseVideo(widget.firebaseVideoUrl);
    _videoController = VideoPlayerController.file(file);
    await _videoController!.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoController!,
      autoPlay: false,
      looping: false,
      showControls: true,
    );

    if (mounted) setState(() {});
  }

  void _handleVisibilityChanged(VisibilityInfo info) {
    final fullyVisible = info.visibleFraction == 1.0;

    if (fullyVisible && !_isVisible) {
      _videoController?.play();
      _isVisible = true;
    } else if (!fullyVisible && _isVisible) {
      _videoController?.pause();
      _isVisible = false;
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController == null) {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return VisibilityDetector(
      key: Key(widget.firebaseVideoUrl),
      onVisibilityChanged: _handleVisibilityChanged,
      child: AspectRatio(
        aspectRatio: _videoController!.value.aspectRatio,
        child: Chewie(controller: _chewieController!),
      ),
    );
  }
}


Future<File> cacheFirebaseVideo(String firebaseUrl) async {
  final dir = await getApplicationDocumentsDirectory();
  final filename = Uri.parse(firebaseUrl).pathSegments.last;
  final filePath = '${dir.path}/$filename';
  final file = File(filePath);

  if (await file.exists()) {
    return file;
  }

  await Dio().download(firebaseUrl, filePath);
  return file;
}
