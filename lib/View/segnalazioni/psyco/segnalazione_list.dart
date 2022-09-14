import 'package:cyberbullism_bully/View/segnalazioni/psyco/chat/psyco_chat_view.dart';
import 'package:flutter/material.dart';

import '/Model/connect_db/psyco_db_connector.dart';
import '/Model/segnalazione.dart';
import '/Model/user.dart';
import 'segnalazione_card.dart';

/// lista anche relativamente lunga e che
/// riserva lo stesso spazio per ogni Container (segnalazione)
class ListaSegnalazioni extends StatefulWidget {
  final User user;

  const ListaSegnalazioni(this.user, {Key? key}) : super(key: key);

  @override
  State<ListaSegnalazioni> createState() => _ListaSegnalazioniState();
}

class _ListaSegnalazioniState extends State<ListaSegnalazioni> {
  Future<List<Segnalazione>> get fillCards =>
      PsycoDbConnector.getSegnalazioni(widget.user);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Lista Segnalazioni")),
        body: Center(
          child: FutureBuilder(
              future: fillCards,
              builder: (_, AsyncSnapshot<List<Segnalazione>> snapshot) =>
                  snapshot.hasError
                      ? Text(snapshot.error.toString())
                      : snapshot.hasData
                          ? buildList(snapshot.requireData)
                          : const CircularProgressIndicator.adaptive()),
        ),
      );

  ListView buildList(List<Segnalazione> list) => ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, int _index) => GestureDetector(
          onTap: () => openChat(list[_index]),
          child: SegnalazioneCard(list[_index]),
        ),
      );

  void openChat(Segnalazione segnalazione) async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Attenzione!"),
        content: const Text(
            "Proseguendo la segnalazione verrà legata indissolubilmente a questo profilo e nessun altro psicologo potrà visualizzarla"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Annulla"),
          ),
          MaterialButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Prosegui"),
          ),
        ],
      ),
    );

    if (result) {
      PsycoDbConnector.presaInCarica(widget.user, segnalazione);
      toChat(segnalazione.email);
    }
  }

  void toChat(String email) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PsycoChatView(widget.user, email),
        ),
      );
}