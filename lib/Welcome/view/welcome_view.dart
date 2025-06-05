import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Column(
        children: [

          Container(
            height: 350,
            padding: const EdgeInsets.only(top: 200.0),
            //decoration: BoxDecoration(border: Border.all(width: 8,),),
            child: Center(
              child: Container(
                width: 236,
                height: 236,
                child: Image.asset('assets/logosplash.png'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).colorScheme.primary),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(37.0),
                                  )
                              )
                          ),
                          child: Center(
                            child: Text('ВОЙТИ В АККАУНТ', style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            ),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  Container(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 48,
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/register');
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(37.0),
                            ),
                            side: BorderSide(width: 2.0, color: Theme.of(context).colorScheme.primary),
                            backgroundColor: Colors.transparent,
                          ),
                          child: Center(
                            child: Text('Зарегистрироваться', style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            ),
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 60),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
