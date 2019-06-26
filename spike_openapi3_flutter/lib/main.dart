import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter with OpenAPI Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  int _id;

  String _getName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: this._formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "id"),
                  onSaved: (String value) {
                    this._id = int.parse(value);
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: "name"),
                  onSaved: (String value) {
                    this._name = value;
                  },
                ),
                const SizedBox(height: 16.0),
                RaisedButton(
                  child: Text('call API'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      var person = Person();
                      person.id = _id;
                      person.name = _name;
                      HelloControllerApi().putPersonUsingPOST(person).then((person) {
                        Scaffold.of(_formKey.currentState.context).showSnackBar(SnackBar(
                          content: Text('creation success! : $_id'),
                        ));
                      });
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "id"),
                    onChanged: (value) {
                      HelloControllerApi().getPersonUsingGET(id: int.parse(value)).then((person) {
                        setState(() {
                          _getName = person.name;
                        });
                      });
                    }),
                Text(
                  this._getName,
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
