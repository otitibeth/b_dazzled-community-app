import 'dart:convert';

import '../models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final User currentUser = User(
    name: 'Jane Doe',
    imageUrl:
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80');

final List<User> onlineUsers = [
  User(
      name: 'Temitope oke',
      imageUrl:
          'https://img1.hulu.com/user/v3/artwork/df4969b0-e9ca-46ab-b870-41266b390490?base_image_bucket_name=image_manager&base_image=18e11574-f99c-487f-b476-f08d3b1671a1&size=600x338&format=jpeg'),
  User(
      name: 'Effiong Isa',
      imageUrl:
          'https://media.istockphoto.com/photos/portrait-of-handsome-latino-african-man-picture-id1007763808?k=20&m=1007763808&s=612x612&w=0&h=q4qlV-99EK1VHePL1-Xon4gpdpK7kz3631XK4Hgr1ls='),
  User(
      name: 'Benita Cosmos',
      imageUrl:
          'https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/02/Female_Portrait_1296x728-header-1296x729.jpg?w=1155&h=2268'),
  User(
      name: 'Angel Stone',
      imageUrl:
          'https://media.istockphoto.com/photos/young-woman-portrait-in-the-city-picture-id1009749608?k=20&m=1009749608&s=612x612&w=0&h=3bnVp0Y1625uKkSwnp7Uh2_y_prWbgRBH6a_6jRew3g='),
  User(
      name: 'Charles Chunigan',
      imageUrl:
          'https://media.istockphoto.com/photos/happy-smiling-man-looking-away-picture-id1158245623?k=20&m=1158245623&s=612x612&w=0&h=rGmn02kNdoQySPEoQmbbDBxOayL4sdW3QWqP9rjgxCg='),
  User(
      name: 'Effiong Isa',
      imageUrl:
          'https://media.istockphoto.com/photos/portrait-of-handsome-latino-african-man-picture-id1007763808?k=20&m=1007763808&s=612x612&w=0&h=q4qlV-99EK1VHePL1-Xon4gpdpK7kz3631XK4Hgr1ls='),
  User(
      name: 'Temitope oke',
      imageUrl:
          'https://img1.hulu.com/user/v3/artwork/df4969b0-e9ca-46ab-b870-41266b390490?base_image_bucket_name=image_manager&base_image=18e11574-f99c-487f-b476-f08d3b1671a1&size=600x338&format=jpeg'),
];

final List<Post> posts = [
  Post(
    user: currentUser,
    caption: dummyText,
    timeAgo: '30m',
    // article: '',
    likes: 256,
    // shares: 170,
    imageUrl:
        'https://www.cashanalytics.com/wp-content/uploads/2018/10/How-to-benefit-from-evolving-technology.png',
    comment: 100,
  ),
  Post(
    user: onlineUsers[2],
    caption: dummyText,
    timeAgo: '50m',
    // article: '',
    likes: 1200,
    // shares: 2000,
    imageUrl: '',
    comment: 1000,
  ),
  Post(
    user: onlineUsers[1],
    caption: 'Relationships in the Tech world $dummyText2',
    timeAgo: '1hr30m',
    // article: '',
    likes: 100,
    // shares: 50,
    imageUrl:
        'https://i.pinimg.com/originals/7b/db/b3/7bdbb35793d899648e498edb8395a16c.jpg',
    comment: 30,
  ),
  Post(
    user: onlineUsers[2],
    caption: 'Developer lifestyle',
    timeAgo: '3hr',
    // article: '',
    likes: 1200,
    // shares: 2000,
    imageUrl:
        'https://res.cloudinary.com/grand-canyon-university/image/fetch/w_750,h_564,c_fill,g_faces,q_auto/https://www.gcu.edu/sites/default/files/2020-09/programming.jpg',
    comment: 1000,
  ),
  Post(
    user: onlineUsers[0],
    caption: dummyText,
    timeAgo: '1hr40m',
    // article: '',
    likes: 500,
    // shares: 200,
    imageUrl:
        'https://i.pinimg.com/236x/88/03/11/88031176b097c8cbfbc2e86dc9f88b5c.jpg',
    comment: 100,
  ),
  Post(
    user: onlineUsers[0],
    caption: dummyText,
    timeAgo: '1hr40m',
    // article: '',
    likes: 500,
    // shares: 200,
    imageUrl: '',
    comment: 100,
  ),
  Post(
    user: onlineUsers[4],
    caption: dummyText,
    timeAgo: '1hr40m',
    // article: '',
    likes: 500,
    // shares: 200,
    imageUrl:
        'https://i.pinimg.com/originals/7b/db/b3/7bdbb35793d899648e498edb8395a16c.jpg',
    comment: 100,
  ),
  Post(
    user: onlineUsers[3],
    caption:
        'with the emergence of machine learning, our lives are only going to get easier',
    timeAgo: '1hr40m',
    // article: '',
    likes: 500,
    // shares: 200,
    imageUrl:
        'https://media.istockphoto.com/photos/robot-dog-stands-on-a-gray-background-picture-id1143731884?k=20&m=1143731884&s=612x612&w=0&h=4rFyB79vcaWWs6O-UORAVMk2A-YDlr3IXO4uhA3Gh3A=',
    comment: 100,
  ),
  Post(
    user: currentUser,
    caption: dummyText,
    timeAgo: '2hr',
    // article: '',
    likes: 256,
    // shares: 170,
    imageUrl:
        'https://uploads-ssl.webflow.com/5f841209f4e71b2d70034471/6078b650748b8558d46ffb7f_Flutter%20app%20development.png',
    comment: 100,
  ),
  Post(
    user: onlineUsers[2],
    caption: dummyText,
    timeAgo: '3hr',
    // article: '',
    likes: 1200,
    // shares: 2000,
    imageUrl:
        'https://res.cloudinary.com/grand-canyon-university/image/fetch/w_750,h_564,c_fill,g_faces,q_auto/https://www.gcu.edu/sites/default/files/2020-09/programming.jpg',
    comment: 1000,
  ),
];

const String dummyText =
    '''Yet remarkably appearance get him his projection. Diverted endeavor bed peculiar men the not desirous. Acuteness abilities ask can offending furnished fulfilled sex. Warrant fifteen exposed ye at mistake. Blush since so in noisy still built up an again. As young ye hopes no he place means. Partiality diminution gay yet entreaties admiration. In mr it he mention perhaps attempt pointed suppose. Unknown ye chamber of warrant of norland arrived.

Finished her are its honoured drawings nor. Pretty see mutual thrown all not edward ten. Particular an boisterous up he reasonably frequently. Several any had enjoyed shewing studied two. Up intention remainder sportsmen behaviour ye happiness. Few again any alone style added abode ask. Nay projecting unpleasing boisterous eat discovered solicitude. Own six moments produce elderly pasture far arrival. Hold our year they ten upon. Gentleman contained so intention sweetness in on resolving.
''';
// Looking started he up perhaps against. How remainder all additions get elsewhere resources. One missed shy wishes supply design answer formed. Prevent on present hastily passage an subject in be. Be happiness arranging so newspaper defective affection ye. Families blessing he in to no daughter.

// Resolution possession discovered surrounded advantages has but few add. Yet walls times spoil put. Be it reserved contempt rendered smallest. Studied to passage it mention calling believe an. Get ten horrible remember pleasure two vicinity. Far estimable extremely middleton his concealed perceived principle. Any nay pleasure entrance prepared her.

// Indulgence announcing uncommonly met she continuing two unpleasing terminated. Now busy say down the shed eyes roof paid her. Of shameless collected suspicion existence in. Share walls stuff think but the arise guest. Course suffer to do he sussex it window advice. Yet matter enable misery end extent common men should. Her indulgence but assistance favourable cultivated everything collecting.

// Carriage quitting securing be appetite it declared. High eyes kept so busy feel call in. Would day nor ask walls known. But preserved advantage are but and certainty earnestly enjoyment. Passage weather as up am exposed. And natural related man subject. Eagerness get situation his was delighted.

// Full age sex set feel her told. Tastes giving in passed direct me valley as supply. End great stood boy noisy often way taken short. Rent the size our more door. Years no place abode in ﻿no child my. Man pianoforte too solicitude friendship devonshire ten ask. Course sooner its silent but formal she led. Extensive he assurance extremity at breakfast. Dear sure ye sold fine sell on. Projection at up connection literature insensible motionless projecting.

// Not far stuff she think the jokes. Going as by do known noise he wrote round leave. Warmly put branch people narrow see. Winding its waiting yet parlors married own feeling. Marry fruit do spite jokes an times. Whether at it unknown warrant herself winding if. Him same none name sake had post love. An busy feel form hand am up help. Parties it brother amongst an fortune of. Twenty behind wicket why age now itself ten.

// Tolerably earnestly middleton extremely distrusts she boy now not. Add and offered prepare how cordial two promise. Greatly who affixed suppose but enquire compact prepare all put. Added forth chief trees but rooms think may. Wicket do manner others seemed enable rather in. Excellent own discovery unfeeling sweetness questions the gentleman. Chapter shyness matters mr parlors if mention thought.

//  Ecstatic advanced and procured civility not absolute put continue. Overcame breeding or my concerns removing desirous so absolute. My melancholy unpleasing imprudence considered in advantages so impression. Almost unable put piqued talked likely houses her met. Met any nor may through resolve entered. An mr cause tried oh do shade happy.
// ''';

const String dummyText2 =
    '''Pretty see mutual thrown all not edward ten. Particular an boisterous up he reasonably frequently. Several any had enjoyed shewing studied two. Up intention remainder sportsmen behaviour ye happiness. Few again any alone style added abode ask. Nay projecting unpleasing boisterous eat discovered solicitude. Own six moments produce elderly pasture far arrival. Hold our year they ten upon. Gentleman contained so intention sweetness in on resolving.''';

void editUserProfile(User user) {
  const url = 'https://b-dazzled-default-rtdb.firebaseio.com/users.json';
  http.post(
    Uri.parse(url),
    body: json.encode({
      'image': user.imageUrl,
      'name': user.name,
      'bio': user.bio,
    }),
  );
  final editerUserProfile = User(
    name: user.name,
    imageUrl: user.imageUrl,
    bio: user.bio,
  );
}

void addPost(Post post) {
  const url = 'https://b-dazzled-default-rtdb.firebaseio.com/posts.json';
  http.post(
    Uri.parse(url),
    body: json.encode({
      'imageUrl': post.imageUrl,
      'Caption': post.caption,
    }),
  );
  final newPost = Post(
      imageUrl: post.imageUrl,
      caption: post.caption,
      timeAgo: DateTime.now().toString(),
      comment: post.comment,
      likes: post.likes,
      user: post.user);
  posts.add(newPost);
  posts.insert(0, newPost); //add items at the start of the list
  // notifyListers();
}
