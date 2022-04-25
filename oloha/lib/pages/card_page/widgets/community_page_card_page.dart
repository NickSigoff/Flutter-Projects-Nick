import 'package:flutter/material.dart';
import 'package:oloha/utils/avatars_list.dart';

import '../../../utils/main_colors.dart';
import '../../../utils/posts_list.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  List<Widget> posts = [];

  @override
  void initState() {
    super.initState();
// todo may i do like this?
    for (int i = 0; i < PostsList.postsList.length; i++) {
      posts.add(PostWidget(
        post: PostsList.postsList[i],
        avatar: AvatarsList.avatarsList[i],
      ));
      if(i != PostsList.postsList.length) {
        posts.add(const SizedBox(height: 10,));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(248, 248, 248, 1),
      ),
      child: Column(children: [...posts]),
    );
  }
}

class PostWidget extends StatelessWidget {
  final String post;
  final String avatar;
  final TextStyle textStyle = const TextStyle(
      color: MainColors.hintColor,
      fontSize: 12,
      fontFamily: 'Gilroy-regular');

  const PostWidget({Key? key, required this.post, required this.avatar})
      : super(key: key);


  @override
  Widget build(BuildContext context) {



    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(46.0),
                    child: Image.asset(avatar),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Hugo Evans\n',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Gilroy-semibold'),
                    children: [
                      TextSpan(
                          text: 'Posted 3 hours ago',
                          style: TextStyle(
                              fontSize: 12,
                              color: MainColors.hintColor,
                              fontFamily: 'Gilroy-regular'))
                    ],
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.more_vert,
                  color: MainColors.hintColor,
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage(post),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.thumb_up_outlined,
                  size: 14,
                  color: MainColors.hintColor,
                ),
                Text(
                  'Like',
                  style: textStyle,
                ),
                const Spacer(),
                const Icon(
                  Icons.mode_comment_outlined,
                  size: 14,
                  color: MainColors.hintColor,
                ),
                Text(
                  'Comment',
                  style: textStyle,
                ),
                const Spacer(),
                const Icon(
                  Icons.share,
                  size: 14,
                  color: MainColors.hintColor,
                ),
                Text(
                  'Share',
                  style: textStyle,
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
