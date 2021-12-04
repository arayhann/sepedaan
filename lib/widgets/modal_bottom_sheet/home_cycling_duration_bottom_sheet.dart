import 'package:flutter/material.dart';
import 'package:sepedaan/utils/cons.dart';
import 'package:sepedaan/widgets/buttons/fill_button.dart';

class HomeCyclingDurationBottomSheet extends StatelessWidget {
  const HomeCyclingDurationBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Suggested Cycling Duration',
                style: TextStyle(
                  fontSize: 16,
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/img-cycling-duration-info.png',
                width: 170,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Bersepeda dengan lebih sehat',
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Untuk mengoptimalkan manfaat kesehatan, kami menyarankan durasi bersepeda untuk Anda dengan memperhitungkan tingkat kualitas udara, dan cuaca di daerah Anda.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FillButton(
                width: double.infinity,
                height: 46,
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Kembali',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
