import 'package:intl/intl.dart';

class Message {
  final String otherEmail;
  final String text;
  final bool sender;
  final DateTime data;
  int? gravita;

  Message(this.otherEmail, this.text, this.data, this.sender, this.gravita);

  Message.fromJson(Map<String, dynamic> json)
      : otherEmail = json["otherEmail"],
        text = json["testo"],
        data = DateTime.parse(json["data"]),
        sender = json["sender"] == "1",
        gravita = json["gravita"] == null ? null : int.parse(json["gravita"]);

  String get hourMinutes => DateFormat.Hm().format(data);

  String get yearMonthDate => DateFormat.yMMMd().format(data);
}
