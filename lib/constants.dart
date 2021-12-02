import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kHeadingBebasNeueTextStyle = GoogleFonts.bebasNeue(
color: Colors.white,
fontSize: 32,
letterSpacing: 1.8,
);

const kHeadingNormalTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 32,
);

const kHeadingNormalBoldTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 32,
  fontWeight: FontWeight.bold,
);

const kCardHeadingTextStyle = TextStyle(
  color: Colors.blue,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const kParaTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 13,
);

const kWhiteColor = TextStyle(
  color: Colors.white,
);

const apiKey = '?api_key=b1ca3e466a5d1fa7a6c65e4e931e93a1';
const posterURL = 'https://image.tmdb.org/t/p/w300';
const bgURL = 'https://image.tmdb.org/t/p/w780';
const trendingEndPoint =
    'https://api.themoviedb.org/3/trending/movie/day$apiKey';

const movieEndPoint = 'https://api.themoviedb.org/3/movie/';

const crewEndPoint = '&append_to_response=credits';

const youtubeSearch = 'https://www.youtube.com/results?search_query=';

const searchMovie =
    'https://api.themoviedb.org/3/search/movie$apiKey&language=en-US&query=';



const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
const KTextFieldDecoration= InputDecoration(
  hintText: 'Enter your email',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

