import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api_bloc/bloc/movie_bloc.dart';
import 'package:movies_api_bloc/components/bottom_navigation_bar.dart';
import 'package:movies_api_bloc/data/repository/movie_repository.dart';
import 'package:movies_api_bloc/presentation/screens/coming_soon_screen.dart';
import 'package:movies_api_bloc/presentation/screens/menu_screen.dart';
import 'package:movies_api_bloc/presentation/screens/search_screen.dart';
import 'package:movies_api_bloc/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MovieRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TrendingMovieBloc(
                movieRepository: context.read<MovieRepository>())
              ..add(FetchTrendingMovieData()),
          ),
          BlocProvider(
            create: (context) => UpcomingMovieBloc(
                movieRepository: context.read<MovieRepository>())
              ..add(FetchUpComingMovies()),
          ),
          BlocProvider(
            create: (context) => PopularMovieBloc(
                movieRepository: context.read<MovieRepository>())
              ..add(FetchPopularMovieEvent()),
          ),
          BlocProvider(
            create: (context) => TopRatedMovieBloc(
                movieRepository: context.read<MovieRepository>())
              ..add(FetchTopRatedEvent()),
          ),
          BlocProvider(
            create: (context) => MovieTrailerBloc(
                movieRepository: context.read<MovieRepository>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ZETFLIX',
          theme: ThemeData.dark(
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {'/': (context) => const Main()},
        ),
      ),
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    ComingSoonScreen(),
    MenuScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBarComponent(
          onTap: _onItemTapped, currentIndex: _selectedIndex),
    );
  }
}
