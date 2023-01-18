import 'package:flutter/material.dart';
import 'package:natureemoi/models/plante.dart';

import '../theme/fonts.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Page createState() => Page();
}

class Page extends State<HomePage> {

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for(var item in posters)
                            item.poster(refresh)
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text("Dernières plantes", style: SUB_TITLE),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: constraints.maxHeight-310,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for(var item in plantes)
                            item.display(constraints.maxWidth, refresh)
                          ]
                        )
                      )
                    )
                  ]
                )
              ),
              if(current_plante!=null) current_plante!.popup(constraints.maxWidth, constraints.maxHeight, refresh)
            ],
        );
      }
    );
  }
}
