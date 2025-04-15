import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SwipePub extends StatefulWidget {
  final VoidCallback onClose;

  const SwipePub({
    super.key,
    required this.onClose,
  });

  @override
  State<SwipePub> createState() => _SwipePubState();
}

class _SwipePubState extends State<SwipePub> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;
  bool _hasError = false;
  bool _showCloseButton = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      print('Initializing video from assets/videos/ad.mp4');

      // Vérifier si le fichier existe
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
      final bool exists = manifestMap.containsKey('assets/videos/ad.mp4');
      print('Video file exists in manifest: $exists');

      if (!exists) {
        throw Exception('Video file not found in assets');
      }

      // Charger le fichier vidéo
      final videoData = await rootBundle.load('assets/videos/ad.mp4');
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/ad.mp4');
      await tempFile.writeAsBytes(videoData.buffer.asUint8List());

      _controller = VideoPlayerController.file(tempFile)
        ..initialize().then((_) {
          print('Video initialized successfully');
          if (mounted) {
            setState(() {
              _isVideoInitialized = true;
            });
            _controller.play();
            _controller.setLooping(true);

            // Afficher le bouton de fermeture après 5 secondes
            Future.delayed(const Duration(seconds: 5), () {
              if (mounted) {
                setState(() {
                  _showCloseButton = true;
                });
              }
            });
          }
        }).catchError((error) {
          print('Error initializing video: $error');
          if (mounted) {
            setState(() {
              _hasError = true;
            });
          }
        });
    } catch (e) {
      print('Error creating video controller: $e');
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _hasError
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.white,
                              size: 48,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Erreur de chargement de la vidéo',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    : _isVideoInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
          if (_showCloseButton)
            Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                onTap: widget.onClose,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
