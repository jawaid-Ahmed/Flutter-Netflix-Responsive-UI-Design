import 'package:flutter/material.dart';
import 'package:netflixui/assets.dart';
import 'package:netflixui/widgets/responsive.dart';
class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({Key? key, this.scrollOffset=0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      color: Colors.red.withOpacity((scrollOffset/350).clamp(0,1).toDouble()),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      )
    );
  }
}
class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppBarButton({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call(),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(width: 12.0,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(title: 'Tv Shows', onTap: () => print('TV Shows')),
                _AppBarButton(title: 'Movies', onTap: () => print('TV Shows')),
                _AppBarButton(title: 'My List', onTap: () => print('TV Shows')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(width: 12.0,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _AppBarButton(title: 'Home', onTap: () => print('TV Shows')),
                    SizedBox(width: 10.0,),
                    _AppBarButton(title: 'Tv Shows', onTap: () => print('TV Shows')),
                    SizedBox(width: 10.0,),

                    _AppBarButton(title: 'Latest', onTap: () => print('TV Shows')),
                    SizedBox(width: 10.0,),

                    _AppBarButton(title: 'Movies', onTap: () => print('TV Shows')),
                    SizedBox(width: 10.0,),

                    _AppBarButton(title: 'My List', onTap: () => print('TV Shows')),
                  ],
                ),
                Row(
                  children: [
                    _AppBarButton(title: 'Search', onTap: () => print('TV Shows')),
                    SizedBox(width: 10.0,),

                    _AppBarButton(title: 'Kids', onTap: () => print('TV Shows')),
                    SizedBox(width: 10.0,),
                    _AppBarButton(title: 'DVD', onTap: () => print('TV Shows')),
                    SizedBox(width: 10.0,),

                    _AppBarButton(title: 'Notifications', onTap: () => print('TV Shows')),


                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}