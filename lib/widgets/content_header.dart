import 'package:flutter/material.dart';
import 'package:netflixui/models/content.dart';
// import 'package:video_player/video_player.dart';
import 'widgets.dart';
class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key? key, required this.featuredContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: _ContentHeaderMobile(featuredContent: featuredContent),
        desktop: _ContentHeaderMobile(featuredContent: featuredContent),
    );
  }
}
class _ContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;


  const _ContentHeaderDesktop({Key? key, required this.featuredContent}) : super(key: key);

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  // late VideoPlayerController _videoController;
  // bool _isMuted=true;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _videoController=VideoPlayerController.network(
  //     widget.featuredContent.videoUrl
  //   )..initialize().then((_) => setState(() {}));
  //
  // }
  //
  // @override
  // void dispose() {
  //   _videoController.dispose();
  //   super.dispose();
  // }
  //
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => _videoController.value.isPlaying
      //     ? _videoController.pause()
      //     : _videoController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: 500.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.featuredContent.imageUrl),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Container(
            height: 500.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
         Positioned(
           left: 60.0,
           right: 60.0,
           bottom: 150.0,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(
                 width: 250.0,
                 child: Image.asset(widget.featuredContent.titleImageUrl),
               ),
               const SizedBox(height: 15.0,),
               Text(
                 widget.featuredContent.description,
                 style: const TextStyle(
                   color: Colors.white,
                   fontSize: 15.0,
                   fontWeight: FontWeight.w500,
                   shadows: [Shadow(
                     color: Colors.black,
                     offset: Offset(2.0,4.0),
                     blurRadius: 6.0
                   ),],
                 
                 ),
               )
             ],
           ),
         ),
          const SizedBox(height: 20.0,),
          Row(
            children: [
              const _PlayButton(),
              const SizedBox(width: 20.0,),
              TextButton.icon(
                  onPressed: (){},
                  icon: const Icon(Icons.info_outline),
                  label: const Text(
                    'More Info',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              const SizedBox(width: 20.0,),
              // if (_videoController.value.initialized)
              //   IconButton(
              //     icon:Icon(
              //     _isMuted ? Icons.volume_off : Icons.volume_up
              //     ),
              //     color: Colors.white,
              //     iconSize: 30.0,
              //     onPressed: () { setState(() {
              //       _isMuted
              //         ? _videoController.setVolume(100)
              //           : _videoController.setVolume(0);
              //       _isMuted = _videoController.value.volume==0;
              //     }); },
              //   ),
            ],
          )
        ],
      ),
    );
  }
}
class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const _ContentHeaderMobile({Key? key, required this.featuredContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(featuredContent.imageUrl),
                fit: BoxFit.cover,
              )
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          child: SizedBox(width: 250,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                  icon: Icons.add,
                  title:'List',
                  onTap: () {},

                ),
                const _PlayButton(),
                VerticalIconButton(
                  icon: Icons.info_outline,
                  title:'Info',
                  onTap: () {},
                ),
              ],
            ))
      ],
    );
  }
}


class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
      child: TextButton.icon(

        onPressed: (){},

        icon: const Icon(Icons.play_arrow,size: 30.0,),
        label: const Text('Play',style:
          TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),),
      ),
    );
  }
}
