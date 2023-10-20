import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tech_blog/component/my_String.dart';
import 'package:flutter_tech_blog/component/my_colors.dart';
import 'package:flutter_tech_blog/gen/assets.gen.dart';
import 'package:flutter_tech_blog/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.techbot.path,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyString.welcome,
                    style: texttheme.bodyMedium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: SizedBox(
                  height: 49,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      _showEmailBottomSheet(context, size, texttheme);
                    },
                    child: const Text('بزن بریم'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme texttheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (contex) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2.5,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyString.insertEmail,
                    style: texttheme.bodyMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: TextField(
                      onChanged: (value) {
                        print(value + 'is Email' + isEmail(value).toString());
                      },
                      style: const TextStyle(
                        color: SoildColors.textTile,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: MyString.Emailhints,
                        hintStyle: texttheme.bodySmall,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(contex);
                          _showEmailavtiveBottomSheet(context, size, texttheme);
                        },
                        child: const Text(MyString.textcontinuebutton),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    // ignore: unused_element
  }

  Future<dynamic> _showEmailavtiveBottomSheet(
      BuildContext context, Size size, TextTheme texttheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (contex) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2.5,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyString.insertEmailcodeactive,
                    style: texttheme.bodyMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: TextField(
                      onChanged: (value) {
                        print(value + 'is Email' + isEmail(value).toString());
                      },
                      style: const TextStyle(
                        color: SoildColors.textTile,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: MyString.Emailactivehints,
                        hintStyle: texttheme.bodySmall,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => mycats(),
                            ),
                          );
                        },
                        child: const Text(MyString.textcontinuebutton),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
