import 'package:flutter/material.dart';
import 'package:natureemoi/theme/colors.dart';
import 'package:natureemoi/theme/fonts.dart';
import 'package:natureemoi/models/plante.dart';
import 'package:natureemoi/pages/add.dart';
import 'package:natureemoi/pages/collection.dart';
import 'custum_widgets/scrollbehavior.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home.dart';
void main() {
  runApp(const MyApp());
}

// flutter run -d chrome --web-renderer html --no-sound-null-safety

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Page createState() => Page();
}

class Page extends State<MyApp> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  List<String> _SectionTitle = ["A découvrir", "Ma Collection", "Ajout d'une plante"];

  @override
  void initState() {
    plantes;collection;posters;
    super.initState();
  }

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      current_plante = null;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
                      scrollBehavior: MyCustomScrollBehavior(),
                      debugShowCheckedModeBanner: false,
                      title: 'Nature Emoi',
                      theme: ThemeData(
                        appBarTheme: AppBarTheme(
                            elevation: 0
                          )
                      ),
                      home: Scaffold(
                        appBar: PreferredSize(
                          preferredSize: Size.fromHeight(100),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                            color: WHITE,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nature Emoi", style: DEFAULT),
                                Text(_SectionTitle[_selectedIndex], style: TITLE_BLACK)
                              ]
                            )
                          ),
                        ),
                        body: PageView(
                          controller: pageController,
                          children: [
                            HomePage(),
                            CollectionPage(),
                            AddPage()
                          ],
                          onPageChanged: (index) {
                            onTapped(index);
                          },
                        ),
                        bottomNavigationBar: BottomNavigationBar(
                          items: [
                            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
                            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Collection'),
                            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Ajouter')
                          ],
                          currentIndex: _selectedIndex,
                          selectedItemColor: BLACK,
                          unselectedItemColor: WHITE,
                          backgroundColor: GREEN,
                          onTap: onTapped,
                        ),
                      ),
                    );
  }
}
