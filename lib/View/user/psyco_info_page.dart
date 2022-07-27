import 'package:flutter/material.dart';
import '../../Model/psyco/psyco.dart';
import '../../Model/psyco/psyco_url_getter.dart';

class PsyInfo extends StatefulWidget {
  final String nome;
  final String cognome;
  final String ordine;

  const PsyInfo(this.nome, this.cognome, this.ordine, {Key? key})
      : super(key: key);

  @override
  State<PsyInfo> createState() => _PsyInfoState();
}

class _PsyInfoState extends State<PsyInfo> {
  _getPsyInfo(Psyco psy) => ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(psy.email),
          Text(psy.nome),
          Text(psy.cognome),
          Text(psy.password),
          Text(psy.isValid),
        ],
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("User info")),
        body: Center(
          child: FutureBuilder<Psyco>(
              future: PsycoUrlGetter.getFuturePsyco(
                  widget.nome, widget.cognome, widget.ordine, "password"),
              builder: (BuildContext context, AsyncSnapshot<Psyco> snapshot) =>
                  snapshot.hasData
                      ? _getPsyInfo(snapshot.requireData)
                      : const CircularProgressIndicator()),
        ),
      );
}
