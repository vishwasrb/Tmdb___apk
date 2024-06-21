import 'package:flutter/material.dart';
import 'package:mydemo_app/celebreties.dart';
import 'package:mydemo_app/mainpage.dart';
import 'package:mydemo_app/search.dart';
import 'package:mydemo_app/textmodifiyer.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:mydemo_app/Popularmoive.dart';
import 'package:mydemo_app/card.dart';
import 'package:mydemo_app/playing.dart';
import 'package:mydemo_app/trending.dart';
import 'package:mydemo_app/tvshow.dart';
import 'package:mydemo_app/upcoming.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  String? searchmodel;
  String query = "";
  bool isfirstpage = true;

  List popularmovie = [];
  List topratedmovie = [];
  List trendingmoive = [];
  List upcoming = [];
  List topratedtv = [];
  List popularlisttv = [];
  List sim = [];
  List tv = [];
  List tvtrending = [];
  List people = [];
  List<dynamic> searchresult = [];
  List similar = [];
  final String apikey = '51aea399b9d14243d71178ac2ef551a2';
  final String readacesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MWFlYTM5OWI5ZDE0MjQzZDcxMTc4YWMyZWY1NTFhMiIsInN1YiI6IjY1ZjAyNDFlOTQ2MzE4MDE4NTYxYTZjMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tXNKubwWUOiQahYO4J7g3fSBhW-VHey2-0QXWVgivhY";

  late Future<void> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _moviesFuture = loadMovies();
  }

  void _currentpage(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  String getTitle() {
    switch (_selectedindex) {
      case 0:
        return "Movies";
      case 1:
        return "Tv Shows";
      case 2:
        return "Celebrities";
      case 3:
        return "Search";
      case 4:
        return "Your Account";
      default:
        return "";
    }
  }

  Future<void> loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readacesstoken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map upcomingresult = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map topratedmovieresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getAiringToday();
    Map tvlistresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map trendinglistresult = await tmdbWithCustomLogs.v3.tv.getTopRated();
    Map trendresult = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map popularlisttvresult = await tmdbWithCustomLogs.v3.people.getPopular();
    Map popularlisttvresult1 = await tmdbWithCustomLogs.v3.movies.getPopular();

    setState(() {
      popularmovie = trendingresult['results'];
      topratedmovie = topratedmovieresult['results'];
      tv = tvresult['results'];
      trendingmoive = trendresult['results'];
      upcoming = upcomingresult['results'];
      tvtrending = tvlistresult['results'];
      topratedtv = trendinglistresult['results'];
      popularlisttv = popularlisttvresult['results'];
      sim = popularlisttvresult1['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      FutureBuilder(
        future: _moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView(
              children: [
                Popularmovie(popular: upcoming),
                Playing(play: trendingmoive),
                Trend(trend: popularmovie),
                MovieCard(popularList: topratedmovie),
                Upcoming(upcoming: trendingmoive),
              ],
            );
          }
        },
      ),
      FutureBuilder(
        future: _moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Tvshow(
              tvs: tv,
              tvlist: tvtrending,
              trendinglist: topratedtv,
              popularlist: popularmovie,
            );
          }
        },
      ),
      FutureBuilder(
        future: _moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Celebrities(
              peoplelist: popularlisttv,
              similar: sim,
            );
          }
        },
      ),
      Searchlist(),
      Mainpage(),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 37, 37),
        automaticallyImplyLeading: false,
        title: Textmodifier(
          text: getTitle(),
          color: Colors.white,
          size: 24,
        ),
      ),
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color.fromARGB(255, 0, 255, 8),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 16, 16, 16),
        currentIndex: _selectedindex,
        onTap: _currentpage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Tv shows"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Celebrities"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              child: Icon(Icons.person),
              backgroundColor: Color.fromARGB(255, 0, 255, 8),
              radius: 15,
            ),
            label: "TMDB",
          ),
        ],
      ),
    );
  }
}
