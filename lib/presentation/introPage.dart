import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/core.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfigSize.init(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Container(
                  color: AppColors.secondary,
                  child: Image.asset(
                    AssetsConstants.ticULogo,
                    height: 150,
                    //width: 200,
                  ),
                ),
            ),
            Expanded(
              //flex: ,
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                //color: Colors.red,
                child: AvatarGlow(
                  startDelay: const Duration(milliseconds: 1000),
                  glowColor: AppColors.whiteColor,
                  glowShape: BoxShape.circle,
                  curve: Curves.fastOutSlowIn,
                  child: Material(// Replace this child with your own
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      radius: 30.0,
                      child: Image.asset(
                        AssetsConstants.ticRLogo,
                        height: 150,
                        //width: 200,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ZigText(text: "@CREATEDBYROOT", color: Colors.grey.shade700, size: getSize(20)),
                  ),
                  SizedBox(height: getHeight(30),),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                      height: getHeight(50),
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(AppColors.secondary),
                          elevation: WidgetStatePropertyAll(10),
                          iconColor: WidgetStatePropertyAll(Colors.white),
                          iconSize: WidgetStatePropertyAll(getSize(30)),
                          shadowColor: WidgetStatePropertyAll(AppColors.shadowColor),
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, RouteName.choosePlayerPage, arguments: false);
                        },
                        label: ZigText(text: "Commencer", color: Colors.white, size: getSize(12)),
                        icon: Icon(Icons.play_arrow),
                      )
                  ),
                ],
              )
            ),

          ],
        ),
      ),
    );
  }


  Widget ZigText({
    required String text,
    required Color color,
    required double size,
  }){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: text.split('').map((char) {
        int index = text.indexOf(char);
        return Transform.rotate(
          angle: index % 2 == 0 ? -0.1 : 0.1, // Rotation zigzag
          child: Text(
            char,
            style: GoogleFonts.pressStart2p(
              textStyle: TextStyle(
                color: color,
                fontSize: size,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
