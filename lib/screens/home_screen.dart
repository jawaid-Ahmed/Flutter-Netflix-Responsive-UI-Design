import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflixui/data/data.dart';
import 'package:netflixui/screens/nav_screen.dart';
import 'package:netflixui/widgets/previews.dart';
import 'package:netflixui/widgets/widgets.dart';
class HomeScreen extends StatefulWidget {


  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late ScrollController _scrollController;
  double _scrollOffset=0.0;
  @override
  void initState(){
    _scrollController=ScrollController()..addListener(() {
      setState(() {
        _scrollOffset=_scrollController.offset;
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: Colors.grey[850],
          child: const Icon(Icons.cast),
        onPressed: () => print('Cast'),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(),
        
      ),
      body: CustomScrollView(

        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
              padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                  key: PageStorageKey('previews'),
                  title: 'Previews',
                  contentList:previews),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('previews'),
              title:'My List',
              contentList:myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('previews'),
              title:'Originals',
              contentList:originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              key: PageStorageKey('previews'),
              child: ContentList(
                title:'Trending',
                contentList:trending,
              ),
            ),
          ),

        ],
      ),

    );
  }
}
