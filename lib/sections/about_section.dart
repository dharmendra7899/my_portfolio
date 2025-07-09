import 'package:flutter/material.dart';
import 'package:flutter_portfolio_clone/components/animated_texts_componenets.dart';
import 'package:flutter_portfolio_clone/constants/texts.dart';
import 'package:flutter_portfolio_clone/responsive.dart';
import 'package:flutter_portfolio_clone/theme/colors.dart';
import 'package:flutter_portfolio_clone/widgets/app_button.dart';
import 'package:flutter_portfolio_clone/widgets/context_extension.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: _buildHome(context),
      tablet: _buildHome(context),
      largeMobile: _buildHome(context),
      mobile: _buildHome(context),
    );
  }

  Widget _buildHome(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final size = MediaQuery.of(context).size;
    final textTheme = context.textTheme;

    final horizontalPadding = 20.0;
    final verticalPadding = isMobile ? 20.0 : 60.0;

    final imageWidth =
        isMobile ? (size.width * 0.5).clamp(150.0, 300.0) : 250.0;
    final imageHeight =
        isMobile ? (size.width * 0.55).clamp(180.0, 400.0) : 300.0;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: TweenAnimationBuilder(
        tween:
            Tween<double>(begin: isMobile ? 25 : 30, end: isMobile ? 20 : 40),
        duration: const Duration(milliseconds: 300),
        builder: (context, value, child) {
          return Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isMobile) const SizedBox(width: 20),
              Flexible(
                child: Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      texts.hii,
                      style: textTheme.bodyLarge?.copyWith(
                        color: appColors.barColor,
                        fontWeight: FontWeight.w500,
                        fontSize: isMobile ? 16 : 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      texts.name,
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      style: textTheme.headlineLarge?.copyWith(
                        color: appColors.appWhite,
                        fontSize: isMobile ? 32 : 50,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      texts.summary,
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      style: textTheme.titleSmall?.copyWith(
                        color: appColors.headingColor,
                        fontWeight: FontWeight.w300,
                        fontSize: isMobile ? 14 : 18,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 20,),
                    AppButton(
                      onPressed: () {},
                      title: texts.resume,
                      height: 45,
                      width: 200,
                      radius: 4,
                      icon: Icon(Icons.download,size: 15,color: appColors.headingColor,),
                      borderColor: appColors.headingColor,
                      textColor: appColors.headingColor,
                    )
                  ],
                ),
              ),
              SizedBox(height: isMobile ? 30 : 0, width: isMobile ? 0 : 30),
              Center(
                child: SizedBox(
                  width: imageWidth,
                  height: imageHeight,
                  child: const AnimatedImageContainer(),
                ),
              ),
              if (!isMobile) const SizedBox(width: 20),
            ],
          );
        },
      ),
    );
  }
}
