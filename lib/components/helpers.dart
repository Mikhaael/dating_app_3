import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Helpers {
  static showSnackBar({required BuildContext context, required String title, required bColor}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: bColor,
        content: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.0),),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.openSans(
                    fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 5,
        width: 250.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),

      ),
    );
  }

  static void showAppDialog(
      {required BuildContext context,
        String title = 'Please wait...',
        bool dismissible = true,
        message}) {
    showDialog(
        context: context,
        barrierDismissible: dismissible,
        builder: (context) {
          return Center(
            child: Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                //this right here
                child: StatefulBuilder(builder: (context, setState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // const Image(
                        //   image: AssetImage('assets/images/logo.png'),
                        //   height: 200,
                        //   width: 230,
                        // ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircularProgressIndicator()
                          ],
                        )
                      ],
                    ),
                  );
                })),
          );
        });
  }
}