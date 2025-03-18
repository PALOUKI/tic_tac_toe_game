
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/core.dart';

class ChoosePlayerPage extends StatefulWidget {
  const ChoosePlayerPage({super.key});

  @override
  State<ChoosePlayerPage> createState() => _ChoosePlayerPageState();
}

class _ChoosePlayerPageState extends State<ChoosePlayerPage> {

  var selectedSide = "X";
  var isAi = false;


  @override
  Widget build(BuildContext context) {
    AppConfigSize.init(context);
    return Scaffold(
      backgroundColor: AppColors.deepPurpleColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZigText(text: "Choisis ton symbole", color: Colors.white, size: getSize(18)),
            /*Text(
                "Choisis ton symbole",
              style: AppTextStyles.headline2.copyWith(
                color: Colors.white
              ),
            ),

             */
            SizedBox(height: getHeight(30),),
            //TODO: choose player
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //TODO: X
                Column(
                  children: [
                    Image.asset(AssetsConstants.green_x, height: getHeight(80),),
                    SizedBox(height: getHeight(5),),
                    Radio(
                        value: "X",
                        groupValue: selectedSide,
                        activeColor: AppColors.greenColor,
                        onChanged: (value){
                          setState(() {
                            selectedSide = value!;
                          });
                        }
                    )
                  ],
                ),
                //TODO: O
                Column(
                  children: [
                    Image.asset(AssetsConstants.orange_o, height: getHeight(80),),
                    SizedBox(height: getHeight(5),),
                    Radio(
                        value: "O",
                        groupValue: selectedSide,
                        activeColor: AppColors.deepOrangeAccentColor,
                        onChanged: (value){
                          setState(() {
                            selectedSide = value!;
                          });
                        }
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: getHeight(30),),
            //TODO: 1 joueur
            DefaultPlayButton(
                function: (){
                  Navigator.pushNamed(
                    context,
                    RouteName.gamePage,
                    arguments: {
                      'isAi': true, // ou false selon le choix
                      'selectedSide': selectedSide,
                    },
                  );
                },
                icon: Icons.account_circle_outlined,
                label: ZigText(text: "1 joueur", color: Colors.black, size: getSize(12)),
            ),
            SizedBox(height: getHeight(20),),
            //TODO: 2 joueur
            DefaultPlayButton(
                function: (){
                  Navigator.pushNamed(
                    context,
                    RouteName.gamePage,
                    arguments: {
                      'isAi': false,
                      'selectedSide': selectedSide,
                    },
                  );
                },
                icon: Icons.supervisor_account_rounded,
                label: ZigText(text: "2 joueurs", color: Colors.black, size: getSize(12)),
            )
          ],
        ),
      ),
    );
  }

  Widget DefaultPlayButton({
     required VoidCallback function,
    required IconData icon,
    required Widget label,
  }){

    return Container(
        width: MediaQuery.of(context).size.width/2,
        height: getHeight(50),
        child: ElevatedButton.icon(
          style: ButtonStyle(
            elevation: WidgetStatePropertyAll(10),
            iconColor: WidgetStatePropertyAll(Colors.black),
            iconSize: WidgetStatePropertyAll(getSize(25)),
            shadowColor: WidgetStatePropertyAll(AppColors.shadowColor),
          ),
          onPressed: function ?? (){},
          label: label,
          icon: Icon(icon),
        )
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
