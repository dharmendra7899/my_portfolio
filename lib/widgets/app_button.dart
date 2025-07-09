import 'package:flutter/material.dart';
import 'package:flutter_portfolio_clone/theme/colors.dart';
import 'package:flutter_portfolio_clone/widgets/context_extension.dart';


class AppButton extends StatefulWidget {
  final String title;
  final Widget? icon;
  final Function()? onPressed;
  final bool isLoading;
  final bool? isBorder;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? radius;
  final double? height;
  final double? width;
  final double? fontSize;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.icon,
    this.color,
    this.textColor,
    this.borderColor,
    this.isBorder,
    this.radius,
    this.height = 50,
    this.fontSize = 14,
    this.width,
    this.isLoading = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(_) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(_) {
    setState(() {
      _isPressed = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = widget.color ?? appColors.secondary;

    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          onTap: widget.isLoading ? null : widget.onPressed,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 120),
            scale: _isPressed ? 0.97 : 1.0,
            curve: Curves.easeOut,
            child: Container(
              width: widget.width ?? MediaQuery.of(context).size.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(widget.radius ?? 12),
                border: Border.all(
                  color: widget.borderColor ?? appColors.secondaryLight,
                  width: 1,
                ),
                boxShadow: _isPressed
                    ? []
                    : [
                  BoxShadow(
                    color: buttonColor.withValues(alpha: 0.09),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Center(
                child: widget.isLoading
                    ? CircularProgressIndicator.adaptive(
                  strokeAlign: BorderSide.strokeAlignCenter,
                  strokeWidth: 2,
                  trackGap: 12,
                  strokeCap: StrokeCap.round,
                  constraints:
                  const BoxConstraints(minHeight: 25, minWidth: 25),
                  backgroundColor: appColors.appWhite,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    appColors.appWhite,
                  ),
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.icon != null) widget.icon!,
                    if (widget.icon != null) const SizedBox(width: 6),
                    Text(
                      widget.title,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: widget.fontSize,
                        color:
                        widget.textColor ?? appColors.appWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
