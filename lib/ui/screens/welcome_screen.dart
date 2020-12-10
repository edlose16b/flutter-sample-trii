import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triiapp/ui/blocs/app_bloc.dart';
import 'package:triiapp/ui/screens/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double height = 350;
  int secondsAnimation = 3;

  void goToNextPage() async {
    print('sencillo');

    this.setState(() {
      height = MediaQuery.of(context).size.height;
    });

    await Future.delayed(Duration(seconds: secondsAnimation));

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppBloc>(context);
    final user = bloc.user;

    if (user != null) {
      goToNextPage();
    }

    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(seconds: secondsAnimation - 1),
              curve: Curves.fastOutSlowIn,
              color: Color(0xff222034),
              width: double.infinity,
              height: height,
              child: Image.asset('assets/trii.png'),
            ),
            if (user == null) WelcomeForm(),
          ],
        ),
      ),
    );
  }
}

class WelcomeForm extends StatelessWidget {
  WelcomeForm({
    Key key,
  }) : super(key: key);

  TextEditingController _txtNameCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onTap(context) {
    if (!formKey.currentState.validate()) return;

    Provider.of<AppBloc>(context, listen: false).saveUser(_txtNameCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              'Bienvenido',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: _txtNameCtrl,
              validator: (value) {
                if (value.trim().length == 0) return 'Es necesario llenar';
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Escriba su nombre',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 50),
          RaisedButton(
            onPressed: () => this.onTap(context),
            child: Text(
              'Siguiente',
            ),
          ),
        ],
      ),
    );
  }
}
