part of "pages.dart";

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final List<Widget> _pages = [
    const HomePage(),
    const MyTicketPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<PageData>(builder: (context, pageData, child) {
      return Scaffold(
        body: _pages.elementAt(pageData.currIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: lightMode ? Colors.white : colors["cinder"],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: colors["cerulean-blue"],
          unselectedItemColor: colors["dove-grey"],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: pageData.currIndex,
          onTap: (index) {
            pageData.changeMenu(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("assets/" +
                    (pageData.currIndex == 0
                        ? "home-blue.png"
                        : "home-grey.png")),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/" +
                      (pageData.currIndex == 1
                          ? "ticket-blue.png"
                          : "ticket-grey.png"),
                ),
                label: "My Ticket"),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/" +
                    (pageData.currIndex == 2
                        ? "profile-blue.png"
                        : "profile-grey.png"),
              ),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
