import 'package:charmin/constants/constants.dart';
import 'package:charmin/router/sign/widgets/sign_up_box.dart';
import 'package:charmin/router/sign/widgets/thrid_party/widget_border_horizental.dart';
import 'package:charmin/router/sign/widgets/thrid_party/widget_btns_section.dart';
import 'package:charmin/router/widget/button.dart';
import 'package:charmin/router/widget/circular_progress.dart';
import 'package:charmin/store/store_color.dart';
import 'package:flutter/material.dart';

class SignUpRoute extends StatelessWidget {
  const SignUpRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).backgroundColor,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: sapceGap),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: sapceGap * 4,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: ColorStore.primaryColor),
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      SizedBox(height: 300.0, child: SignUpBox()),
                      const SizedBox(
                        height: sapceGap / 2,
                      ),
                      const SizedBox(
                        height: sapceGap * 2,
                      ),
                      const HorizentalBorder(),
                      const SizedBox(
                        height: sapceGap * 2,
                      ),
                      const ThirdPartySignInSection(
                        height: 100,
                      ),
                      const SizedBox(
                        height: sapceGap * 4,
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned.fill(
                child: Visibility(
                  visible: false,
                  child: CircularProgress(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
