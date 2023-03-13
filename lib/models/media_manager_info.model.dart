import 'dart:io';

class MediaManagerInfo {
  String url;
  File? file;
  Duration skipDuration;
  bool autoPlay = false;
  bool playInMute = true;
  bool looping = false;
  MediaDataSource source;
  double playbackSpeed = 0;
  double volume = 1;

  MediaManagerInfo({
    required this.url,
    this.file,
    this.skipDuration = Duration.zero,
    this.autoPlay = true,
    this.playInMute = false,
    this.looping = false,
    this.playbackSpeed = 1.0,
    this.volume = 1,
    this.source = MediaDataSource.network,
  });

  MediaManagerInfo.asset({
    required this.url,
    this.skipDuration = Duration.zero,
    this.autoPlay = true,
    this.playInMute = false,
    this.looping = false,
    this.playbackSpeed = 1.0,
    this.volume = 1.0,
    this.source = MediaDataSource.asset,
  });
}

enum MediaDataSource { network, fileSystem, asset }
