import 'package:flutter/material.dart';
import 'package:flutter_portfolio_clone/constants/texts.dart';
import 'package:flutter_portfolio_clone/responsive.dart';
import 'package:flutter_portfolio_clone/theme/colors.dart';
import 'package:flutter_portfolio_clone/widgets/app_button.dart';
import 'package:flutter_portfolio_clone/widgets/context_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final tablet = Responsive.isTablet(context);
    final horizontalPadding = isMobile
        ? 20.0
        : tablet
            ? 30.0
            : 200.0;
    final verticalPadding = isMobile ? 20.0 : 60.0;
    return TweenAnimationBuilder(
        tween:
            Tween<double>(begin: isMobile ? 25 : 30, end: isMobile ? 20 : 40),
        duration: const Duration(milliseconds: 300),
        builder: (context, value, child) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            child: Column(children: [
              Text(texts.touch,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: appColors.headingColor,
                    fontSize: isMobile ? 26 : 30,
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(
                height: 15,
              ),
              Text(
                texts.contactInfo,
                textAlign: TextAlign.center,
                style: context.textTheme.titleSmall?.copyWith(
                  color: appColors.headingColor,
                  fontWeight: FontWeight.w300,
                  fontSize: isMobile ? 14 : 18,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              AppButton(
                radius: 4,
                height: 45,
                width: 140,
                onPressed: () {
                  sendEmail();
                },
                title: texts.sayHello,
                fontSize: 12,
                textColor: appColors.barColor,
                borderColor: appColors.barColor,
              ),
              SizedBox(
                height: 35,
              ),
              if (isMobile || tablet) SocialMediaIconRow()
            ]),
          );
        });
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

class SocialMediaIconRow extends StatelessWidget {
  const SocialMediaIconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaIcon(
          icon: FontAwesomeIcons.github,
          url: 'https://github.com/dharmendra7899',
        ),
        SocialMediaIcon(
          icon: FontAwesomeIcons.instagram,
          url: 'https://instagram.com/mr_dharmendr06',
        ),
        SocialMediaIcon(
          icon: FontAwesomeIcons.twitter,
          url: 'https://twitter.com/dhamendra338',
        ),
        SocialMediaIcon(
          icon: FontAwesomeIcons.linkedin,
          url: 'https://www.linkedin.com/in/dharmendra338',
        ),
      ],
    );
  }
}

class SocialMediaIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const SocialMediaIcon({
    super.key,
    required this.icon,
    required this.url,
  });

  @override
  State<SocialMediaIcon> createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<SocialMediaIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: IconButton(
          onPressed: () => launchUrl(Uri.parse(widget.url)),
          icon: FaIcon(widget.icon),
          color: _isHovered ? appColors.barColor : appColors.headingColor,
          iconSize: 30,
        ),
      ),
    );
  }
}
