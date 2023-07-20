import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:lgbtq_plus_conect/chat.dart';
import 'package:provider/provider.dart';

import 'recommend.dart';
import 'favorites.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'LGBTQ+Connect',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var history = <WordPair>[];

  GlobalKey? historyListKey;

  void getNext() {
    history.insert(0, current);
    var animatedListState = historyListKey?.currentState as AnimatedListState?;
    animatedListState?.insertItem(0);
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  var latestConversations;

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current;
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = ChatPage();
        break;
      case 1:
        page = RecommendPage();
        break;
      case 2:
        page = FavoritesPage();
        break;
      case 3:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LGBTQ+Connect',
          style: TextStyle(color: colorScheme.primary),
        ),
        centerTitle: true,
        // leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.search)],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 450) {
              return Column(
                children: [
                  Expanded(child: mainArea),
                  BottomNavigationBar(
                    selectedItemColor: colorScheme.primary,
                    unselectedItemColor: colorScheme.secondary,
                    currentIndex: selectedIndex,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.chat_bubble), label: "Chat"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.co_present), label: "Recommend"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.favorite), label: "Favorites"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.settings), label: "Settings"),
                    ],
                    onTap: (value) => setState(() {
                      selectedIndex = value;
                    }),
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                          icon: Icon(Icons.chat_bubble), label: Text("Chat")),
                      NavigationRailDestination(
                          icon: Icon(Icons.home), label: Text("Home")),
                      NavigationRailDestination(
                          icon: Icon(Icons.favorite), label: Text("Favorites")),
                      NavigationRailDestination(
                          icon: Icon(Icons.settings), label: Text("Settings")),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                  Expanded(child: mainArea),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
