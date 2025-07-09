import 'package:flutter/material.dart';
import 'package:my_portfolio/theme/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconColumn extends StatelessWidget {
  const SocialMediaIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 4),
        child: IconButton(
          onPressed: () => launchUrl(Uri.parse(widget.url)),
          icon: FaIcon(widget.icon),
          color: _isHovered
              ? appColors.barColor
              : appColors.headingColor,
          iconSize: 30,

        ),
      ),
    );
  }
}
