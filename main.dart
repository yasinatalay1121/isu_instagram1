import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Column(
          children: [
            Container(
                width: double.infinity,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.add_circle,
                              color: Colors.black87, size: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite,
                              color: Colors.black87, size: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 8, bottom: 8, right: 20),
                          child:
                              Icon(Icons.send, color: Colors.black87, size: 20),
                        ),
                      ],
                    )
                  ],
                )),
            Expanded(
                child: Container(
                    // width: 50,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(8.0),
                      child: Column
                      (children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              StoryWidget("assets/images/caracal.jpg", "kullanici_1"),
                              StoryWidget("assets/images/caracal1.jpg", "kullanici_2"),
                              StoryWidget("assets/images/yalvac.jpg", "kullanici_3"),
                              StoryWidget("assets/images/caracal.jpg", "kullanici_1"),
                              StoryWidget("assets/images/caracal1.jpg", "kullanici_2"),
                              StoryWidget("assets/images/yalvac.jpg", "kullanici_3"),
                              StoryWidget("assets/images/caracal.jpg", "kullanici_1"),
                              StoryWidget("assets/images/caracal1.jpg", "kullanici_2"),
                              StoryWidget("assets/images/yalvac.jpg", "kullanici_3"),
                            ],
                          ),
                        ),
                        PostItem("assets/images/caracal.jpg", "assets/images/post.jpg", "kullanici_1", "Moskova"),
                        PostItem("assets/images/caracal1.jpg", "assets/images/post1.jpg", "kullanici_2", "Tayland"),
                        PostItem("assets/images/yalvac.jpg", "assets/images/post2.jpg", "kullanici_3", "Beylikdüzü")
                      ]),
                    ),
                    color: Colors.white)),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Icon(Icons.home, size: 28, color: Colors.black87),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Icon(Icons.search, size: 28, color: Colors.black87),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Icon(Icons.smart_display,
                        size: 28, color: Colors.black87),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child:
                        Icon(Icons.favorite, size: 28, color: Colors.black87),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Icon(Icons.person, size: 28, color: Colors.black87),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container PostItem(String avatar, String photo, String name, String location) => Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            backgroundImage:
                                AssetImage(avatar),
                            radius: 23),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text(location,
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.normal))
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.more_horiz)
                  ],
                ),
              ),
              Image.asset(photo),
              LikeCommentBox(),
              CommentBox("kullanici_1", "Lovely cat! Keep posting this little boy.Lorem ipsum dolor sit amet, consectetur adipiscing"),
              CommentBox("kullanici_1", "Lovely cat! Keep posting this little boy.Lorem ipsum dolor sit amet, consectetur adipiscing")
            ],
          ),
        ),
      );

  Padding LikeCommentBox() {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.chat_bubble_outline, color: Colors.black87),
                    ],
                  ),
                  Icon(Icons.flag_outlined, color: Colors.black87)
                ],
              ),
            ),
          );
  }

  Padding CommentBox(String name, String comment) {
    return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: RichText(
                    maxLines: 3,
                    text: TextSpan(children: [
                      TextSpan(
                          text: name,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 12)),
                      TextSpan(text: "  "),
                      TextSpan(
                          text: comment,
                          style: TextStyle(color: Colors.black54, fontSize: 12))
                    ]),
                  ),
                ),
              ],
            ),
          );
  }

  Widget StoryWidget(String avatar, String name) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors:[
                const Color.fromRGBO(214, 71, 103, 1),
                const Color.fromRGBO(241, 166, 117, 1)])
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 35,
            ),
          ),
          SizedBox(height: 5),
          Text(name, style: TextStyle(fontSize: 13))
        ],
      ),
    );
  }
}