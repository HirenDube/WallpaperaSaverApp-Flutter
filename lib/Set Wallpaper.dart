import 'package:crud_pract_2nd_app/main.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class SetWallpaper extends StatefulWidget {
  String imageUrl, tag;

  SetWallpaper({required this.imageUrl, required this.tag});

  @override
  State<SetWallpaper> createState() => _SetWallpaperState();
}

class _SetWallpaperState extends State<SetWallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Go Back", bgColor: Colors.deepPurpleAccent),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Hero(
                    tag: widget.tag, child: Image.network(widget.imageUrl))),
            GestureDetector(
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  color: Colors.black,
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    "Save Wallpaper",
                    style: GoogleFonts.julee(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                  color: Colors.deepPurple, width: 3)),
                          title: Text(
                              "Are you sure you want to save this wallpaper ?"),
                          elevation: 10,
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  await GallerySaver.saveImage(widget.imageUrl,
                                      albumName: "My Custom Wallpapers");
                                  
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(SnackBar(
                                        elevation: 10,
                                        backgroundColor: Colors.white,
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        dismissDirection:
                                            DismissDirection.horizontal,
                                        content: Text(
                                          "Wallpaper saved successfully...",
                                          style: GoogleFonts.alice(
                                              color: Colors.black),
                                        )));

                                  Navigator.pop(context);
                                },
                                child: Text("Yes")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("No"))
                          ],
                        ));
              },
            )
          ],
        ),
      ),
    );
  }
}
