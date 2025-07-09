import 'package:flutter/material.dart';
import 'package:flutter_portfolio_clone/responsive.dart';
import 'package:flutter_portfolio_clone/theme/colors.dart';
import 'package:flutter_portfolio_clone/widgets/context_extension.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            children: [
              Text(
                "Some Things I've Build",
                style: context.textTheme.headlineLarge?.copyWith(
                  color: appColors.appWhite,
                  fontSize: isMobile ? 18 : 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 16),
              Container(
                height: 0.5,
                width: size.width * 0.3,
                color: appColors.headingColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
        ),
        ListView.separated(
          itemBuilder: (context, index) {
            return ProjectCard(
              index: index,
              imagePath: 'assets/images/chat.png',
              title: 'Flutter ECommerce',
              subtitle: 'Featured Project',
              description:
                  'E-Commerce UI kit can be used for e-commerce applications in android and ios devices. It contains 32 Screens with a different type of UI, E-Commerce UI kit can save your time to code all Front end layout.',
              tech: ['Dart', 'Android', 'iOS'],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 14,
            );
          },
          itemCount: 4,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}

class ProjectCard extends StatefulWidget {
  final int index;
  final String imagePath;
  final String title;
  final String subtitle;
  final String description;
  final List<String> tech;

  const ProjectCard({
    super.key,
    required this.index,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tech,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isImageLeft = widget.index % 2 == 0;
    final size = MediaQuery.sizeOf(context);
    final imageWidget = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: _isHovered ? const Offset(0, -0.05) : Offset.zero,
        curve: Curves.easeInOut,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
            scale: 1.9,
          ),
        ),
      ),
    );

    final contentWidget = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.subtitle,
              style: context.textTheme.titleLarge?.copyWith(
                color: appColors.barColor,
                fontSize: isMobile ? 12 : 14,
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(height: 8),
          Text(widget.title,
              style: context.textTheme.titleLarge?.copyWith(
                color: appColors.appWhite,
                fontSize: isMobile ? 18 : 22,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(height: 16),
          Container(
            constraints: BoxConstraints(maxWidth: isMobile?size.width:size.width * 0.3),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: appColors.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              widget.description,
              style: context.textTheme.titleSmall?.copyWith(
                color: appColors.headingColor,
                fontWeight: FontWeight.w300,
                fontSize: isMobile ? 13 : 14,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: widget.tech
                .map((e) => Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        e,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: appColors.headingColor,
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 12),
          Icon(Icons.link, color: appColors.barColor),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: !Responsive.isLargeMobile(context)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: isImageLeft
                  ? [
                      imageWidget,
                      const SizedBox(
                        width: 20,
                      ),
                      contentWidget
                    ]
                  : [
                      contentWidget,
                      const SizedBox(
                        width: 20,
                      ),
                      imageWidget
                    ],
            )
          : Column(
            children: [
              imageWidget,
              SizedBox(
                width: 20,
              ),
              contentWidget
            ],
          ),
    );
  }
}
