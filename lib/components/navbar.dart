import 'package:flutter/material.dart';
import 'package:flutter_portfolio_clone/constants/texts.dart';
import 'package:flutter_portfolio_clone/responsive.dart';
import 'package:flutter_portfolio_clone/theme/colors.dart';
import 'package:flutter_portfolio_clone/widgets/app_button.dart';
import 'package:flutter_portfolio_clone/widgets/context_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Navbar extends StatelessWidget {
  final Function(String section) onNavTap;

  const Navbar({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final items = ['About', 'Experience', 'Portfolio', 'Contact'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/hexagon.png',
                height: 45,
                width: 45,
                color: appColors.barColor,
              ),
              Text(
                "D",
                style: context.textTheme.titleLarge?.copyWith(
                  color: appColors.barColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              AppButton(
                radius: 4,
                height: 35,
                width: 130,
                onPressed: () => launchUrl(Uri.parse(
                    'https://wa.me/919795541088?text=${Uri.encodeComponent("Hi Dharmendra, I loved your portfolio! Let's connect.")}')),
                title: texts.whatsapp,
                icon: FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: appColors.headingColor,
                  size: 20,
                ),
                fontSize: 12,
                textColor: appColors.headingColor,
                borderColor: appColors.headingColor,
              ),
              const SizedBox(width: 12),
              if (Responsive.isMobile(context) ||
                  Responsive.isTablet(context)) ...{
                Align(
                  alignment: Alignment.centerRight,
                  child: PopupMenuButton<String>(
                    icon: Icon(
                      Icons.more_vert_sharp,
                      color: appColors.headingColor,
                    ),
                    onSelected: (value) => onNavTap(value.toLowerCase()),
                    itemBuilder: (context) => items
                        .map((label) => PopupMenuItem<String>(
                              value: label,
                              child: Text(label),
                            ))
                        .toList(),
                  ),
                )
              } else ...{
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: items
                      .map((label) => _HoverNavItem(
                            label: label,
                            onTap: () => onNavTap(label.toLowerCase()),
                          ))
                      .toList(),
                )
              },
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: items
              //       .map((label) => _HoverNavItem(
              //             label: label,
              //             onTap: () => onNavTap(label.toLowerCase()),
              //           ))
              //       .toList(),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HoverNavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _HoverNavItem({required this.label, required this.onTap});

  @override
  State<_HoverNavItem> createState() => _HoverNavItemState();
}

class _HoverNavItemState extends State<_HoverNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 200),
          offset: _isHovered ? const Offset(0, -0.09) : Offset.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.label,
              style: context.textTheme.bodyLarge?.copyWith(
                color: _isHovered ? appColors.barColor : appColors.headingColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
