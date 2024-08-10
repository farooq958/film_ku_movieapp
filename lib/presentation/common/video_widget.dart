import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:film_ku/application/utils/Extensions/responsive_extention.dart';
import 'package:film_ku/data/text_styles/text_styles.dart';
import 'package:film_ku/presentation/common/custom_app_bar.dart';
import 'package:flutter/material.dart';


class AppVideoScreen extends StatefulWidget {
  const AppVideoScreen({super.key,required this.videoUrl});
  final String videoUrl;
  @override
  State<AppVideoScreen> createState() => _AppVideoScreenState();
}

class _AppVideoScreenState extends State<AppVideoScreen> {

  late CachedVideoPlayerPlusController _controller;

  bool isPlaying=false;

  @override
  void initState() {
    // TODO: implement initState

    _controller = CachedVideoPlayerPlusController.networkUrl(Uri.parse(widget.videoUrl),
        httpHeaders: {
          'Connection': 'keep-alive',
        },
        invalidateCacheIfOlderThan: const Duration(minutes: 100),
        videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true
          //webOptions: VideoPlayerWebOptions(),
        ))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        isPlaying=_controller.value.isPlaying;
//_controller.videoPlayerOptions?.webOptions?.controls.enabled;
        _controller.setLooping(false);
        _controller.setVolume(1);
        _controller.addListener((){
          print(_controller.value.isCompleted);
          if(_controller.value.isCompleted==true)
          {
            _controller.seekTo(const Duration(seconds: 0));
            _controller.pause();
            isPlaying=false;
            setState(() {

            });
          }
        });
      });

    super.initState();
  }
  @override
  void dispose() {

    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Video',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body:   _controller.value.isInitialized
          ?  Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                      children: [
              AspectRatio(aspectRatio: _controller.value.aspectRatio,
              child: CachedVideoPlayerPlus(_controller,)),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: InkWell(
                    onTap: () {
                      setState(() {
                        if( isPlaying)
                        { _controller.pause();
                        isPlaying=false;
                        }
                        else
                        {
                          _controller.play();
                          isPlaying=true;
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(80),
                      child: isPlaying
                          ? const SizedBox(
                        width: 50,
                        height: 50,
                      )
                          : const Icon(
                        Icons.play_circle,
                        size: 40,
                        color: Colors.white,
                      ),
                    )),
              ),
              Positioned(
                bottom: 15,
                left: 1.sw *0.15,
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Visibility(
                          visible: _controller.value.isPlaying,
                          maintainState: true,
                          maintainAnimation: true,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(right: 1.0),
                                child: ValueListenableBuilder(
                                    valueListenable: _controller,
                                    builder: (context, val, child) {
                                      return Text(
                                        videoDuration(val.position),
                                        style: const TextStyle(
                                            color:
                                           Colors.white,
                                            fontSize: 14,
                                            fontWeight:
                                            FontWeight.w700),
                                      );
                                    }),
                              ),
                              Text(
                                "/",
                                style: AppTextStyles.merriRegular(color: Colors.white
                                    ),
                              ),
                              // const Spacer(),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0),
                                  child: Text(
                                    videoDuration(
                                        _controller.value.duration),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 1.sw,
                          child: Visibility(
                            visible: _controller.value.isPlaying,
                            maintainAnimation: true,
                            maintainState: true,
                            child: VideoProgressIndicator(
                              _controller,
                              padding: const EdgeInsets.only(top: 8,bottom: 8),
                              colors:  VideoProgressColors(
                                playedColor:
                                Theme.of(context).primaryColor,
                                backgroundColor: Colors.white,
                                bufferedColor: Color(0x90656464),
                              ),
                              allowScrubbing: false,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                      ],
                    ),
            ],
          )
          : const Center(child: CircularProgressIndicator()),);
  }
  String videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
