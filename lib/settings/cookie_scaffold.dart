import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hsos/authentication/web_utils.dart';
import 'package:toast/toast.dart';

class CookieScaffold extends StatefulWidget {
  const CookieScaffold({Key key}) : super(key: key);

  @override
  _CookieScaffoldState createState() => _CookieScaffoldState();
}

class _CookieScaffoldState extends State<CookieScaffold> {
  final _cookieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FedAuth-Cookie'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          const MarkdownBody(
            data: _description,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _cookieController,
            decoration: const InputDecoration(
              labelText: 'Cookie-Wert',
            ),
          ),
          const SizedBox(height: 16),
          RaisedButton(
            onPressed: () {
              _checkAndValidateCookie(_cookieController.text);
            },
            child: const Text('Validieren und übernehmen'),
          ),
        ],
      ),
    );
  }

  Future<void> _checkAndValidateCookie(String cookie) async {
    try {
      final couldConnect = await WebUtils.checkAndsaveFedAuthCookie(cookie);
      if (couldConnect) {
        Toast.show('Supi, funktioniert', context, duration: Toast.LENGTH_LONG);
      } else {
        Toast.show('Scheinbar ist etwas schief gelaufen', context,
            duration: Toast.LENGTH_LONG);
      }
    } catch (e) {
      Toast.show('Scheinbar ist etwas schief gelaufen', context,
          duration: Toast.LENGTH_LONG);
    }
  }
}

//language=md
const _description = '''
## Was ist der `FedAuth`-Cookie und wie bekomme ich den?

1. Beispielsweise in Chrome im [Osca-Portal](https://osca.hs-osnabrueck.de) anmelden.
2. Auf das Schloss in der Adressleiste klicken.
3. Cookies anklicken
4. Auf osca.hs-osnabrueck.de -> Cookies -> FedAuth klicken
5. In das Textfeld alles was nach `FedAuth=` kommt angeben

*ACHTUNG*

Die Gültigkeit des Cookies ist etwa 12 Stunden.
Danach musst du die Schritte wiederholen.
''';
