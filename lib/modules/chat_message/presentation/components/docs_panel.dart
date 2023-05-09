import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class DocumentsPanel extends StatelessWidget {
  DocumentsPanel({Key? key,this.soundOnPressed,this.contactOnPressed,this.galleryOnPressed,this.cameraOnPressed,this.documentOnPressed,}) : super(key: key);

  VoidCallback? documentOnPressed;
  VoidCallback? cameraOnPressed;
  VoidCallback? galleryOnPressed;
  VoidCallback? contactOnPressed;
  VoidCallback? soundOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
        child: GridView.count(crossAxisCount: 3, children: [
          Column(
            children: [
              FloatingActionButton(
                onPressed: documentOnPressed,
                child: Icon(Icons.file_copy_outlined,color: Colors.white,),
                backgroundColor: Colors.green,
              ),
              Text(S.of(context).Document),
            ],
          ),
          Column(
            children: [
              FloatingActionButton(
                onPressed: cameraOnPressed,
                child: Icon(Icons.camera,color: Colors.white,),
                backgroundColor: Colors.orange,
              ),
              Text(S.of(context).Camera),
            ],
          ),
          Column(
            children: [
              FloatingActionButton(
                onPressed: galleryOnPressed,
                child: Icon(Icons.image,color: Colors.white,),
                backgroundColor: Colors.blueAccent,
              ),
              Text(S.of(context).Gallery),
            ],
          ),
          Column(
            children: [
              FloatingActionButton(
                onPressed: contactOnPressed,
                child: Icon(Icons.contacts,color: Colors.white,),
                backgroundColor: Colors.deepPurpleAccent,
              ),
              Text(S.of(context).contact),
            ],
          ),
          Column(
            children: [
              FloatingActionButton(
                onPressed: soundOnPressed,
                child: Icon(Icons.audio_file,color: Colors.white,),
                backgroundColor: Colors.red,
              ),
              Text(S.of(context).Sound),
            ],
          ),
        ]),
      ),
    );
  }
}
