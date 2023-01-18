import 'package:flutter/material.dart';
import 'package:natureemoi/theme/colors.dart';
import '../theme/fonts.dart';

class Plante {
  late String nom;
  late String description;
  late String croissance;
  late String consommation;
  late String image;
  late bool aimee;

  Plante(this.nom, this.description, this.croissance, this.consommation,
      this.image, this.aimee);

  void like() {
    aimee = true;
  }

  void unlike() {
    aimee = false;
  }

  void set_image(path) {
    image = path;
  }

  Widget poster(refresh) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                    onTap: () {
                      current_plante = this;
                      refresh();
                    },
                    child: Image.network(image,
                        width: 180, height: 230, fit: BoxFit.fill))),
            aimee
                ? IconButton(
                    onPressed: () {
                      aimee = false;
                      collection.remove(this);
                      refresh();
                    },
                    icon: Icon(Icons.star, color: GREEN, size: 24))
                : IconButton(
                    onPressed: () {
                      aimee = true;
                      collection.insert(0, this);
                      refresh();
                    },
                    icon: Icon(Icons.star, color: WHITE, size: 24))
          ],
        ));
  }

  Widget popup(width, height, refresh) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0.05 * width, 0.05 * height, 0.05 * width, 0.15 * height),
      width: 0.9 * width,
      height: 0.8 * height,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: WHITE,
          boxShadow: [BoxShadow(color: GREY, spreadRadius: 6, blurRadius: 14)]),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(image,
                        width: 70, height: 70, fit: BoxFit.fill)),
                Container(
                  width: 0.9 * width - 70 - 30 - 40,
                  height: 70,
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Text(nom,
                      style: TITLE_BLACK, textAlign: TextAlign.center),
                ),
                Container(
                    width: 30,
                    height: 70,
                    child: IconButton(
                        icon: Icon(Icons.close, size: 30),
                        color: BLACK,
                        onPressed: () {
                          current_plante = null;
                          refresh();
                        }))
              ]),
          SizedBox(height: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Description", style: TITLE_BLACK),
            Text(description, style: DEFAULT)
          ]),
          SizedBox(height: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Croissance", style: TITLE_BLACK),
            Text(croissance, style: DEFAULT)
          ]),
          SizedBox(height: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Consommation Eau", style: TITLE_BLACK),
            Text(consommation, style: DEFAULT)
          ]),
          SizedBox(height: 40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
                icon: Icon(Icons.delete, size: 30, color: BLACK),
                onPressed: () {
                  if (aimee) collection.remove(this);
                  if (posters.contains(this)) posters.remove(this);
                  plantes.remove(this);
                  current_plante = null;
                  refresh();
                }),
            aimee
                ? IconButton(
                    onPressed: () {
                      aimee = false;
                      collection.remove(this);
                      refresh();
                    },
                    icon: Icon(Icons.star, color: GREEN, size: 30))
                : IconButton(
                    onPressed: () {
                      aimee = true;
                      collection.insert(0, this);
                      refresh();
                    },
                    icon: Icon(Icons.star_border, color: BLACK, size: 30)),
          ])
        ],
      )),
    );
  }

  Widget display(width, refresh) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: GestureDetector(
            onTap: () {
              current_plante = this;
              refresh();
            },
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(image,
                        width: 70, height: 70, fit: BoxFit.fill)),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    width: 0.8 * width - 70,
                    height: 65,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(nom, style: SUB_TITLE),
                          Text(description, style: DEFAULT)
                        ])),
                aimee
                    ? IconButton(
                        onPressed: () {
                          aimee = false;
                          collection.remove(this);
                          refresh();
                        },
                        icon: Icon(Icons.star, color: GREEN, size: 24))
                    : IconButton(
                        onPressed: () {
                          aimee = true;
                          collection.insert(0, this);
                          refresh();
                        },
                        icon: Icon(Icons.star_border, color: BLACK, size: 24))
              ],
            )));
  }
}

List plantes = get_data();
List collection = get_data2();
List posters = get_data3();
Plante? current_plante = null;

List get_data() {
  List out = [];
  for (var i = 0; i < 20; i++) {
    out.add(Plante("Nom de la plante", "Description de la plante", "Lente",
        "Basse", "assets/bonsai.webp", false));
  }
  return out;
}

List get_data2() {
  List out = [];
  for (var i = 0; i < 5; i++) {
    plantes[i].like();
    out.add(plantes[i]);
  }
  return out;
}

List get_data3() {
  List out = [];
  for (var i = 5; i < 10; i++) {
    plantes[i].set_image("assets/plante.webp");
    out.add(plantes[i]);
  }
  return out;
}
