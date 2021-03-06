import 'package:flutter/material.dart';
import 'package:netflixui/models/content.dart';
class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Previews({Key? key,
    required this.title,
    required this.contentList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style:const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder:(BuildContext context,int index){
              final Content content=contentList[index];
              return GestureDetector(
                onTap: (){},
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: content.color,width: 4.0),
                      ),
                    ),
                    Container(
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.black87,
                          Colors.black45,
                          Colors.transparent],
                          stops: [0,0.25,1],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: content.color,width: 4.0),
                      ),
                    ),
                    Positioned(
                        left:0,
                        right:0,
                        bottom:0,
                        child: SizedBox(child: Image.asset(content.titleImageUrl)))
                  ],
                ),
              );
            }
          ),
        )
      ],
    );
  }
}
