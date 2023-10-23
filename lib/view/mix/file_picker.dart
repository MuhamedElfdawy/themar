import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:themar/core/design/app_button.dart';
import 'package:themar/core/design/app_image.dart';

class Mix extends StatefulWidget {
  const Mix({super.key});

  @override
  State<Mix> createState() => _MixState();
}

class _MixState extends State<Mix> {

   String? cameraPath;
   String? galleryPath;
   List<XFile> files =[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
         if(cameraPath !=null)
          AppImage(cameraPath!,
          height: 100,
            width: 100,
          ),
          if(galleryPath != null)
            AppImage(galleryPath!,
            height: 100,
              width: 100,
            ) ,
          Wrap(
            children: List.generate(files.length, (index) => AppImage(
              files[index].path,
              height: 100,
              width: 100,
            ) ),
          ),


          ElevatedButton(
            onPressed: () async{
            var file = await ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
            if(file != null){
              cameraPath = file.path;
              setState(() {});
            }
            },
            child: Text('Camera'),
          ),
          ElevatedButton(
            onPressed: () async{
            var file = await ImagePicker.platform.getImageFromSource(source: ImageSource.gallery);
            if(file != null){
              galleryPath = file.path;
              setState(() {});
            }
            },
            child: Text('Gallery'),
          ),
          ElevatedButton(
            onPressed: () async{
            var file = await ImagePicker.platform.getMultiImageWithOptions();
            if(file != null){
              files.addAll(file);
              setState(() {});
            }
            },
            child: Text('Show gallery'),
          ),
        ],
      ),
    ));
  }
}
