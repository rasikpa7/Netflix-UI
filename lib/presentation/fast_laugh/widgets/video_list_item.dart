import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  VideoListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  var videoUrlList = [
    'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-portrait-of-a-woman-in-a-pool-1259-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-red-frog-on-a-log-1487-large.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // color: Colors.accents[index % Colors.accents.length],
          child: FastVideoPlayer(
            index: index,
            videoUrls: videoUrlList,
            onStateChanged: (bool) {},
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //left section
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30.r,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.volume_off,
                      size: 30.sp,
                    ),
                  ),
                ),
                //right section
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/img2.jpeg'),
                      ),
                    ),
                   const  VideoActionsWidget(
                        icon: Icons.emoji_emotions, title: "LOL"),
                   const  VideoActionsWidget(icon: Icons.add, title: "My List"),
                  const   VideoActionsWidget(icon: Icons.share, title: "Share"),
                  const   VideoActionsWidget(icon: Icons.play_arrow, title: "Play"),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class FastVideoPlayer extends StatefulWidget {
  final List<String> videoUrls;
  final index;
  final void Function(bool isPlaying) onStateChanged;
  const FastVideoPlayer({
    Key? key,
    required this.index,
    required this.videoUrls,
    required this.onStateChanged,
  }) : super(key: key);

  @override
  State<FastVideoPlayer> createState() => _FastVideoPlayerState();
}

class _FastVideoPlayerState extends State<FastVideoPlayer> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    _videoController = VideoPlayerController.network(
        widget.videoUrls[widget.index % widget.videoUrls.length]);
    _videoController.initialize().then((value) {
      setState(() {
        _videoController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: _videoController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              )
            : const Center(child: CircularProgressIndicator()));
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}
