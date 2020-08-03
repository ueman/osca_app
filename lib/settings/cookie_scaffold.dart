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
  final _cookieController = TextEditingController(
      text:
          '77u/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48U1A+MMe1LnR8YWRmczIwfGp1ZWtvZXR0LDDHtS50fGFkZnMyMHxqdWVrb2V0dCwxMzI0MTM1OTYzNjcyMDU2MzcsVHJ1ZSxiVUtPbWtHWmUvazVnUWtFRU5LR0lKK2RkMFc2bTZ1UjU2dUdrTjJqZWZndXQ4QjBHWS8xeFRnUW04dnBKMHV6KzVkM25LSlVHTGxHWEpGUXRqMUwvM1BFU21WNFdYZGpveEdyTGdXR2JMNlNxeDJmK2Y2aUwwcEp0eVpzRHJLUXpEczF0QnFCNWhUQTZnQlY4N1B4Rm9pRnp4bWI1OFI0ZTd4enRGV3h2TUw2M0Exc1hNMnhjOTZVcDFJVFNycnAyVjVldFQ4enorYkZLRlcxNTgzL1JURTBXUU04cDlCcWw1cTN1RVZha0o2eHRMTWZuQ2Nzb0o2UTBEVkdIak8zbElGOGozN29SUUtab092djVSZUFMeGg2WXVFRmcxelVhZHVJeXVvTkp6L3R4RVVPZldmNjAvcVF0U0kyNkJlQXRpL0Q0RGVZdUJ2ZU1VbDlmYmtTdlE9PSxodHRwczovL29zY2EuaHMtb3NuYWJydWVjay5kZS88L1NQPg==');

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
