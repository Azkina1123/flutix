part of "widgets.dart";

class SettingTile extends StatefulWidget {
  Widget title;
  SettingTile({super.key, required this.title});

  @override
  State<SettingTile> createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.people),
      title: widget.title,
    );
  }
}
