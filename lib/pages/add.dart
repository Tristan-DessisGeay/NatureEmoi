import 'dart:html';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_whisperer/image_whisperer.dart';
import 'package:flutter/material.dart';
import 'package:natureemoi/theme/colors.dart';
import 'package:natureemoi/custum_widgets/button.dart';

import '../custum_widgets/field.dart';
import '../models/plante.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Page createState() => Page();
}

class Page extends State<AddPage> {
  TextEditingController _nom = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _croissance = TextEditingController();
  TextEditingController _consommation = TextEditingController();

  String _msg = "";
  TextStyle? _msgStyle = null;

  String? image_path = 'assets/arbre.jpg';
  File? image_file;

  pick_image() {
    var input = FileUploadInputElement()..accept = 'image/*';
    input.click();
    input.onChange.listen((event) {
      image_file = input.files?.first;
      setState(() {
        image_path = (image_file != null) ? BlobImage(image_file).url : null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  Row(children: [
                    BUTTON(GREEN, (constraints.maxWidth - 40) * 2 / 3, () {
                      pick_image();
                    }, "Charger Image"),
                    Container(
                        width: (constraints.maxWidth - 40) * 1 / 3,
                        height: 60,
                        child: Image.network(image_path!, fit: BoxFit.cover))
                  ]),
                  FIELD(constraints.maxWidth - 40, "Nom de la plante", _nom,
                      (v) {
                    setState(() {
                      _msg = "";
                    });
                  }),
                  FIELD(constraints.maxWidth - 40, "Description", _description,
                      (v) {
                    setState(() {
                      _msg = "";
                    });
                  }),
                  FIELD(constraints.maxWidth - 40, "Croissance Lente",
                      _croissance, (v) {
                    setState(() {
                      _msg = "";
                    });
                  }),
                  FIELD(constraints.maxWidth - 40, "Consommation Faible",
                      _consommation, (v) {
                    setState(() {
                      _msg = "";
                    });
                  }),
                  BUTTON(BLACK, constraints.maxWidth - 40, () {
                    if (_nom.text != "" &&
                        _description.text != "" &&
                        _croissance.text != "" &&
                        _consommation.text != "" &&
                        image_path != "") {
                      setState(() {
                        plantes.insert(
                            0,
                            Plante(
                                _nom.text,
                                _description.text,
                                _croissance.text,
                                _consommation.text,
                                image_path!,
                                false));
                        _msg = "Nouvelle plante ajoutée avec succès !";
                        _msgStyle = GoogleFonts.kanit(
                            color: GREEN,
                            fontSize: 18,
                            fontWeight: FontWeight.bold);
                        _nom.text = "";
                        _description.text = "";
                        _croissance.text = "";
                        _consommation.text = "";
                        image_path = "assets/arbre.jpg";
                      });
                    } else {
                      setState(() {
                        _msg = "Il y a eu une erreur...";
                        _msgStyle = GoogleFonts.kanit(
                            color: RED,
                            fontSize: 18,
                            fontWeight: FontWeight.bold);
                      });
                    }
                  }, "Confirmer"),
                  SizedBox(height: 20),
                  Text(_msg, style: _msgStyle)
                ])));
      }),
    );
  }
}
