part of 'widgets.dart';

class TextBox extends StatefulWidget {
  String title;
  int type;

  TextBox({super.key, required this.title, required this.type});

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return widget.type == 1
        ? EmailTextBox(title: widget.title)
        : widget.type == 2
            ? PasswordTextBox(title: widget.title)
            : NormalTextBox(title: widget.title);
  }
}

class NormalTextBox extends StatefulWidget {
  String title;

  NormalTextBox({super.key, required this.title});

  @override
  State<NormalTextBox> createState() => _NormalTextBoxState();
}

class _NormalTextBoxState extends State<NormalTextBox> {
  final TextEditingController _controllerTextField = TextEditingController();
  bool txtFieldVal = false;

  @override
  void initState() {
    super.initState();
    _controllerTextField.addListener(() {
      setState(() {
        txtFieldVal = _controllerTextField.text.isNotEmpty;
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controllerTextField.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 37, right: 37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              widget.title,
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  color: lightMode ? colors['cinder'] : colors['soapstone']),
            ),
          ),
          SizedBox(
            width: width(context) - 37,
            child: TextFormField(
              controller: _controllerTextField,
              decoration: InputDecoration(
                filled: true,
                fillColor: lightMode
                    ? colors['soapstone']
                    : colors['dark-jungle-green'],
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(5),
                hintText: "Type Here",
                hintStyle: TextStyle(
                  fontFamily: 'Raleway',
                  color: lightMode ? colors['light-grey'] : colors['dove-grey'],
                ),
              ),
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                color: lightMode ? colors['cinder'] : colors['soapstone'],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmailTextBox extends StatefulWidget {
  String title;

  EmailTextBox({super.key, required this.title});

  @override
  State<EmailTextBox> createState() => _EmailTextBoxState();
}

class _EmailTextBoxState extends State<EmailTextBox> {
  final TextEditingController _controllerEmail = TextEditingController();
  bool emailCheck = false;
  bool emailVal = false;

  @override
  void initState() {
    super.initState();
    _controllerEmail.addListener(() {
      setState(() {
        emailVal = _controllerEmail.text.isNotEmpty;
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controllerEmail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 37, right: 37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Email Address",
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                color: emailCheck == false && _controllerEmail.text != ""
                    ? colors['red-brown']
                    : lightMode
                        ? colors['cinder']
                        : colors['soapstone'],
              ),
            ),
          ),
          SizedBox(
            width: width(context) - 37,
            child: TextFormField(
              controller: _controllerEmail,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  emailCheck = EmailValidator.validate(_controllerEmail.text);
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: lightMode
                    ? colors['soapstone']
                    : colors['dark-jungle-green'],
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: emailCheck == false && _controllerEmail.text != ""
                    ? colors['red-brown']!
                    : lightMode
                        ? colors['cinder']!
                        : colors['soapstone']!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: emailCheck == false && _controllerEmail.text != ""
                    ? colors['red-brown']!
                    : lightMode
                        ? colors['cinder']!
                        : colors['soapstone']!,
                )),
                contentPadding: EdgeInsets.all(5),
                hintText: "Type Here",
                hintStyle: TextStyle(
                  fontFamily: 'Raleway',
                  color: lightMode ? colors['light-grey'] : colors['dove-grey'],
                ),
              ),
              style: TextStyle(
                color: emailCheck == false
                    ? colors['red-brown']
                    : lightMode
                        ? colors['cinder']
                        : colors['soapstone'],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordTextBox extends StatefulWidget {
  String title;

  PasswordTextBox({super.key, required this.title});

  @override
  State<PasswordTextBox> createState() => _PasswordTextBoxState();
}

class _PasswordTextBoxState extends State<PasswordTextBox> {
  final TextEditingController _controllerPassword = TextEditingController();
  bool passVal = false;
  bool press = true;

  @override
  void initState() {
    super.initState();
    _controllerPassword.addListener(() {
      setState(() {
        passVal = _controllerPassword.text.isNotEmpty;
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controllerPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 37, right: 37),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              widget.title,
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  color: lightMode ? colors['cinder'] : colors['soapstone']),
            ),
          ),
          SizedBox(
            width: width(context) - 37,
            child: TextFormField(
              controller: _controllerPassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: lightMode
                    ? colors['soapstone']
                    : colors['dark-jungle-green'],
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(5),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      press = !press;
                    });
                  },
                  child: Icon(press
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                ),
                hintText: "Type Here",
                hintStyle: TextStyle(
                  fontFamily: 'Raleway',
                  color: lightMode ? colors['light-grey'] : colors['dove-grey'],
                ),
              ),
              obscureText: press ? true : false,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                color: lightMode ? colors['cinder'] : colors['soapstone'],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
