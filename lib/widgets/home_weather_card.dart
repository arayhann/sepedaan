import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sepedaan/providers/weather_data.dart';
import 'package:sepedaan/utils/cons.dart';
import 'package:sepedaan/widgets/buttons/fill_button.dart';
import 'package:sepedaan/widgets/buttons/square_icon_button.dart';
import 'package:sepedaan/widgets/modal_bottom_sheet/home_cycling_duration_bottom_sheet.dart';

class HomeWeatherCard extends HookConsumerWidget {
  final ValueNotifier<double> bikeRight;
  final ValueNotifier<double> bikeBottom;
  const HomeWeatherCard(
      {required this.bikeRight, required this.bikeBottom, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _weatherData = useState(ref.read(weatherDataProvider));

    useEffect(() {
      ref
          .read(weatherDataProvider.notifier)
          .getWeatherData(
            lat: -6.901505602268766,
            lng: 107.61882484602191,
          )
          .then((_) {
        _weatherData.value = ref.read(weatherDataProvider);
      });
    }, []);

    return Container(
      height: 530,
      width: 335,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(
            'assets/images/img-bg-${_weatherData.value!.weatherCondition}.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            right: bikeRight.value,
            bottom: bikeBottom.value,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOutBack,
            child: Image.asset(
              'assets/images/img-bicycle.png',
              height: 530,
              width: 335,
            ),
          ),
          AnimatedPositioned(
            right: bikeRight.value,
            bottom: bikeBottom.value,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOutBack,
            child: Image.asset(
              'assets/images/img-bicycle-shadow.png',
              color: const Color(0x1A000000),
              height: 530,
              width: 335,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Image.asset(
                      'assets/images/img-weather-${_weatherData.value!.weatherCondition}.png',
                      width: 84,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      '${_weatherData.value!.name} | ${DateFormat('dd, MM, yyyy').format(DateTime.now())}',
                      style: TextStyle(
                        fontSize: 12,
                        color: _weatherData.value!.weatherCondition == 'rain'
                            ? Colors.white
                            : blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      _weatherData.value!.weather[0].main,
                      style: TextStyle(
                        fontSize: 16,
                        color: _weatherData.value!.weatherCondition == 'rain'
                            ? Colors.white
                            : blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 14,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SquareIconButton(
                        'assets/images/ic-map.png',
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${_weatherData.value!.main!.temp.toStringAsFixed(1)}°C',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Text(
                                      'Temperature',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '35.5',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Pollution Level',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Bad',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Air Quality',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          SquareIconButton(
                            'assets/images/ic-emergency.png',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: const [
                                  Text(
                                    'Cycling Duration: ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: blackColor,
                                    ),
                                  ),
                                  Text(
                                    'Any  Time',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: blackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FillButton(
                              width: 24,
                              height: 24,
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(8),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  builder: (context) =>
                                      const HomeCyclingDurationBottomSheet(),
                                );
                              },
                              child: const Text(
                                '?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
