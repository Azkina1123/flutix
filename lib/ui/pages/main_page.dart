part of "pages.dart";

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const MyTicketPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_index),

      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: lightMode ? Colors.white : colors["cinder"],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colors["cerulean-blue"],
        unselectedItemColor: colors["dove-grey"],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "My Ticket"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Profile"
          ),
        ],
      ),
    );
  }
}
