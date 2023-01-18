import 'package:flutter/material.dart';
import 'package:natureemoi/models/plante.dart';

class CollectionPage extends StatefulWidget {

  const CollectionPage({Key? key}) : super(key: key);

  @override
  Page createState() => Page();
}

class Page extends State<CollectionPage> {

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
          builder: ((context, constraints) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      for(var row in collection)
                      row.display(constraints.maxWidth, refresh)
                    ],
                  ),
                ),
                if(current_plante!=null) current_plante!.popup(constraints.maxWidth, constraints.maxHeight, refresh)
              ]
            );
          })
    );
  }
}
