import 'package:flutter/material.dart';
import 'package:my_portfolio/theme/colors.dart';
import 'package:my_portfolio/widgets/context_extension.dart';

class AnimatedLoadingText extends StatelessWidget {
  const AnimatedLoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20 * 5,
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 2),
        builder: (context, value, child) => Column(
          children: [
            LinearProgressIndicator(
              backgroundColor: appColors.primaryDark,
              color: appColors.headingColor,
              value: value,
            ),
            const SizedBox(
              height: 20 / 2,
            ),
            Text('${(value * 100).toInt()}%',
                style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: appColors.headingColor,
                    shadows: [
                      Shadow(
                          color: Colors.pink,
                          blurRadius: 6,
                          offset: Offset(2, 2)),
                      Shadow(
                          color: appColors.secondary,
                          blurRadius: 6,
                          offset: Offset(-2, -2)),
                    ]))
          ],
        ),
        tween: Tween(begin: 0.0, end: 1.0),
      ),
    );
  }
}
