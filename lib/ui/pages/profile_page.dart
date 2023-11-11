part of "pages.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width(context),
        padding: const EdgeInsets.only(top: 80, bottom: 30),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: lightMode ? colors["cinder"]! : colors["soapstone"]!,
                  shape: BoxShape.circle,
                  image:
                      const DecorationImage(image: AssetImage("assets/img/"))),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              login.name,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              login.email,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Container(
                      width: 26,
                      height: 26,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/edit-profile.png"),
                      )),
                    ),
                    title: const Text(
                      "Edit Profile",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Container(
                      width: 26,
                      height: 26,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/my-wallet.png"),
                      )),
                    ),
                    title: const Text(
                      "My Wallet",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.brightness_4_outlined,
                      size: 26,
                    ),
                    title: const Text(
                      "Theme Mode",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Container(
                      width: 26,
                      height: 26,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/help.png"),
                      )),
                    ),
                    title: const Text(
                      "Help",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Container(
                      width: 26,
                      height: 26,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/language.png"),
                      )),
                    ),
                    title: const Text(
                      "Change Language",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Container(
                      width: 26,
                      height: 26,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/rate.png"),
                      )),
                    ),
                    title: const Text(
                      "Rate Flutix",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Container(
                      width: 26,
                      height: 26,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/logout.png"),
                      )),
                    ),
                    title: const Text(
                      "Log Out",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
