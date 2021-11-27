import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:sepedaan/utils/cons.dart';
import 'package:sepedaan/widgets/buttons/sign_in_button.dart';

class OnBoardingScreen extends HookWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static const List<String> _onBoardingContents = [
    'perhatikan rute bersepada',
    'cek keadaan ban dan rem',
    'kenakan helm standar',
  ];

  @override
  Widget build(BuildContext context) {
    final _activeAnimation = useState(0);
    final _lottieController =
        useAnimationController(duration: const Duration(seconds: 3));
    final _textController =
        useAnimationController(duration: const Duration(seconds: 1));

    useEffect(() {
      _lottieController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _lottieController.reverse().then((_) {
            Future.delayed(const Duration(milliseconds: 500)).then((_) {
              _activeAnimation.value++;
            });
          });
          Future.delayed(const Duration(seconds: 2)).then((_) {
            _textController.reverse();
          });
        }
      });

      return;
    }, []);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 68),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Positioned.fill(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Lottie.asset(
                          'assets/lotties/lottie_onboarding_${_activeAnimation.value % 3}.json',
                          controller: _lottieController,
                          fit: BoxFit.fill,
                          reverse: true,
                          onLoaded: (composition) {
                            Future.delayed(const Duration(milliseconds: 500))
                                .then((value) {
                              _lottieController.forward();
                              _textController.forward();
                            });
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 24,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/img-logo-icon.png',
                              color: Colors.white,
                              width: 45,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'sepedaan',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 115,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: FadeTransition(
                          opacity: _textController,
                          child: Text(
                            _onBoardingContents[_activeAnimation.value % 3],
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Sign In to Sepedaan',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 64,
              right: 64,
              child: SignInButton(
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
