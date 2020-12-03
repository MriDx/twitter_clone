import 'package:flutter/material.dart';
import 'tweets.dart';

Tweets tweets = Tweets();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //app bar
        Material(
          elevation: 5.0,
          color: Colors.white,
          child: Container(
            height: 56.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  //Profile icon
                  Container(
                    height: 40.0,
                    width: 40.0,
                    //color: Colors.blue,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  //Header text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  //left icon
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/free-gaana-bb7d7.appspot.com/o/trends.png?alt=media',
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return _TweetView(context, index);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 5.0,
                );
              },
              itemCount: tweets.tweets.length),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class _TweetView extends StatefulWidget {
  BuildContext _context;
  int _index;

  _TweetView(this._context, this._index);

  BuildContext get context => _context;

  @override
  __TweetViewState createState() => __TweetViewState();

  int get index => _index;
}

class __TweetViewState extends State<_TweetView> {
  BuildContext get _context => widget._context;
  int get _index => widget._index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  tweets.tweets[_index].userThumb,
                  height: 40,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tweets.tweets[_index].userName,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            tweets.tweets[_index].userMName,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        tweets.tweets[_index].tweetText,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    tweets.tweets[_index].tweetImage != ''
                        ? Material(
                            borderRadius: BorderRadius.circular(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                tweets.tweets[_index].tweetImage,
                                height: 150.0,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : SizedBox(height: 0.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 0.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/free-gaana-bb7d7.appspot.com/o/comment.png?alt=media',
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(tweets.tweets[_index].commentCount
                                      .toString()),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/free-gaana-bb7d7.appspot.com/o/retwt.png?alt=media',
                                  height: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(tweets.tweets[_index].retweetCount
                                      .toString()),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/free-gaana-bb7d7.appspot.com/o/like.png?alt=media',
                                  height: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(tweets.tweets[_index].loveCount
                                      .toString()),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.share,
                              color: Colors.grey,
                              size: 20.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
