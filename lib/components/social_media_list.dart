import 'package:flutter/material.dart';
import 'package:flutter_portfolio_clone/components/social_media_coloumn.dart';
import 'package:flutter_portfolio_clone/theme/colors.dart';
import 'package:flutter_portfolio_clone/widgets/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconList extends StatelessWidget {
  const SocialMediaIconList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Column(
            children: [
              const Spacer(),
              const SocialMediaIconColumn(),
              Container(
                height: size.height * 0.08,
                width: 0.5,
                color: appColors.headingColor,
                margin: const EdgeInsets.symmetric(vertical: 20 * 0.5),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SocialMediaTextList extends StatefulWidget {
  const SocialMediaTextList({super.key});

  @override
  State<SocialMediaTextList> createState() => _SocialMediaTextListState();
}

class _SocialMediaTextListState extends State<SocialMediaTextList> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        children: [
          const Spacer(),
          MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 200),
              offset: _isHovered ? const Offset(-0.0, 0) : Offset.zero,
              child: RotatedBox(
                quarterTurns: -3,
                child: InkWell(onTap: () => sendEmail(),
                  child: Text(
                    'dharm.dk1999@gmail.com',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: _isHovered
                          ? appColors.barColor
                          : appColors.headingColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: size.height * 0.08,
            width: 0.5,
            color: appColors.headingColor,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
        ],
      ),
    );
  }

  void sendEmail() async {
    final subject = Uri.encodeComponent('''Let’s Connect!''');
    final body = Uri.encodeComponent(
        'Hi there, I came across your portfolio and would love to connect.');

    final emailUri = Uri.parse(
      'mailto:dharm.dk1999@gmail.com?subject=$subject&body=$body',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }
}

