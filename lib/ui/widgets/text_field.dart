part of 'widgets.dart';

class TextBox extends StatefulWidget {
  final String title;
  final int type;
  final TextEditingController? controller;

  const TextBox(
      {super.key, required this.title, required this.type, this.controller});

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
            : widget.type == 3
                ? ConfPasswordTextBox(title: widget.title)
                : (widget.type == 4 && widget.controller != null)
                ? TopUpTextBox(title: widget.title, controllerTextField: widget.controller)
                : NormalTextBox(title: widget.title);
  }
}

class NormalTextBox extends StatefulWidget {
  final String title;

  const NormalTextBox({super.key, required this.title});

  @override
  State<NormalTextBox> createState() => _NormalTextBoxState();
}

class _NormalTextBoxState extends State<NormalTextBox> {
  final TextEditingController _controllerTextField = TextEditingController();
  bool txtFieldVal = false;
  bool active = false;
  String textVal = "";

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
                  color: active
                      ? colors["cerulean-blue"]
                      : Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          SizedBox(
            width: width(context) - 37,
            child: TextFormField(
              controller: _controllerTextField,
              decoration: InputDecoration(
                filled: true,
                fillColor: lightMode
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: active
                          ? colors["cerulean-blue"]!
                          : lightMode
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onPrimary),
                ),
                contentPadding: const EdgeInsets.all(5),
                hintText: "Type Here",
                hintStyle: TextStyle(
                  fontFamily: 'Raleway',
                  color: lightMode ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onTap: () {
                setState(() {
                  active = !active;
                });
              },
              onChanged: (value) {
                setState(() {
                  textVal = _controllerTextField.text;
                  Provider.of<UserData>(context, listen: false).fullName =
                      textVal;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EmailTextBox extends StatefulWidget {
  final String title;

  const EmailTextBox({super.key, required this.title});

  @override
  State<EmailTextBox> createState() => _EmailTextBoxState();
}

class _EmailTextBoxState extends State<EmailTextBox> {
  final TextEditingController _controllerEmail = TextEditingController();
  bool emailCheck = false;
  bool emailVal = false;
  String textVal = "";

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
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.onPrimary,
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
                  textVal = _controllerEmail.text;
                  Provider.of<UserData>(context, listen: false).email = textVal;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: lightMode
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: emailCheck == false && _controllerEmail.text != ""
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: emailCheck == false && _controllerEmail.text != ""
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.onPrimary,
                )),
                contentPadding: const EdgeInsets.all(5),
                hintText: "Type Here",
                hintStyle: TextStyle(
                  fontFamily: 'Raleway',
                  color: lightMode ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              style: TextStyle(
                color: emailCheck == false
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordTextBox extends StatefulWidget {
  final String title;

  const PasswordTextBox({super.key, required this.title});

  @override
  State<PasswordTextBox> createState() => _PasswordTextBoxState();
}

class _PasswordTextBoxState extends State<PasswordTextBox> {
  final TextEditingController _controllerPassword = TextEditingController();

  bool passVal = false;
  bool press = true;
  bool errorText = false;
  String textVal = "";

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
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          SizedBox(
            width: width(context) - 37,
            child: TextFormField(
              controller: _controllerPassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: lightMode
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                contentPadding: const EdgeInsets.all(5),
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
                  color: lightMode ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.onSecondary,
                ),
                // membuat kondisi jika email dan password tidak sesuai
                // *silahkan disesuaikan
                errorText: errorText == true
                    ? Provider.of<UserData>(context, listen: false)
                                .validatePass ==
                            true
                        ? "Your Email or Password is Wrong"
                        : null
                    : null,
              ),
              obscureText: press ? true : false,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onChanged: (value) {
                setState(() {
                  textVal = _controllerPassword.text;
                  Provider.of<UserData>(context, listen: false).password =
                      textVal;
                  Provider.of<UserData>(context, listen: false).validatePass ==
                          true
                      ? errorText = false
                      : errorText = !errorText;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ConfPasswordTextBox extends StatefulWidget {
  final String title;

  const ConfPasswordTextBox({super.key, required this.title});

  @override
  State<ConfPasswordTextBox> createState() => _ConfPasswordTextBoxState();
}

class _ConfPasswordTextBoxState extends State<ConfPasswordTextBox> {
  final TextEditingController _controllerPassword = TextEditingController();
  bool passVal = false;
  bool press = true;
  String textVal = "";

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
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          SizedBox(
            width: width(context) - 37,
            child: TextFormField(
              controller: _controllerPassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: lightMode
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Theme.of(context).colorScheme.onPrimary,
                        ),
                ),
                contentPadding: const EdgeInsets.all(5),
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
                  color: lightMode ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              obscureText: press ? true : false,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onChanged: (value) {
                setState(() {
                  textVal = _controllerPassword.text;
                  Provider.of<UserData>(context, listen: false).confPassword =
                      textVal;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}



class TopUpTextBox extends StatefulWidget {
  final String title;
  final TextEditingController? controllerTextField;

  const TopUpTextBox({super.key, required this.title, this.controllerTextField});

  @override
  State<TopUpTextBox> createState() => _TopUpTextBoxState();
}

class _TopUpTextBoxState extends State<TopUpTextBox> {
  bool txtFieldVal = false;
  bool active = false;

  @override
  void initState() {
    super.initState();
    widget.controllerTextField!.addListener(() {
      setState(() {
        txtFieldVal = widget.controllerTextField!.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controllerTextField!.dispose();
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
                  color: active
                      ? colors["cerulean-blue"]
                      : lightMode
                          ? colors['cinder']
                          : colors['soapstone']),
            ),
          ),
          SizedBox(
            width: width(context) - 37,
            child: TextFormField(
              controller: widget.controllerTextField!,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                filled: true,
                fillColor: lightMode
                    ? colors['soapstone']
                    : colors['dark-jungle-green'],
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: active
                          ? colors["cerulean-blue"]!
                          : lightMode
                              ? colors['cinder']!
                              : colors['soapstone']!),
                ),
                contentPadding: const EdgeInsets.all(5),
                hintText: "IDR",
                hintStyle: TextStyle(
                  fontFamily: 'Raleway',
                  color: lightMode ? colors['light-grey'] : colors['dove-grey'],
                ),
              ),
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                color: lightMode ? colors['cinder'] : colors['soapstone'],
              ),
              onTap: () {
                setState(() {
                  active = !active;
                });
              },
              onChanged: (value) {
                setState(() {
                  Provider.of<TopUpSelectionData>(context, listen: false).changeSelection(-1);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
