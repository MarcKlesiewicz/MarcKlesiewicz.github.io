import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:template/theme/theme_definition.dart';
import 'package:template/utils/list_extensions.dart';
import 'package:template/utils/utils.dart';
import 'package:template/widgets/dialogs/show_default_dialog.dart';
import 'package:template/widgets/text/styled_text.dart';

class DefaultNavbar extends StatelessWidget {
  const DefaultNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actionItems = [
      _NavbarItems(
        onPressed: () {},
        text: translate('portfolio'),
        isSelected: true,
      ),
      _NavbarItems(
        onPressed: () {},
        text: translate('about_me'),
        isSelected: true,
      ),
      _NavbarItems(
        onPressed: () {},
        text: translate('contact'),
        isSelected: true,
      )
    ].gap(Gaps.mdH);
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      automaticallyImplyLeading: false,
      toolbarHeight: 100,
      leadingWidth: 75,
      leading: const Padding(
        padding: Insets.l02,
        child: _HomeButton(),
      ),
      actions: actionItems,
    );
  }
}

class _HomeButton extends StatefulWidget {
  const _HomeButton({Key? key}) : super(key: key);

  @override
  State<_HomeButton> createState() => __HomeButtonState();
}

class __HomeButtonState extends State<_HomeButton> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          showNotImplementedSnackBar(context);
        },
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/svgs/logo.svg',
              height: 100,
            ),
            AnimatedOpacity(
              opacity: isHovering ? 1 : 0,
              duration: Durations.ms200,
              child: SvgPicture.asset(
                'assets/svgs/logo.svg',
                height: 100,
                colorFilter: ColorFilter.mode(
                  context.colors.secondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavbarItems extends StatefulWidget {
  final void Function() onPressed;
  final String text;
  final bool isSelected;
  const _NavbarItems({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<_NavbarItems> createState() => _NavbarItemsState();
}

class _NavbarItemsState extends State<_NavbarItems> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
      child: GestureDetector(
        onTap: () => widget.onPressed(),
        child: Padding(
          padding: Insets.a02,
          child: Column(
            children: [
              TitleMedium.onPrimary(widget.text),
              AnimatedContainer(
                width: isHovering
                    ? _textSize(widget.text,
                            Theme.of(context).textTheme.titleMedium!)
                        .width
                    : 0,
                duration: Durations.ms200,
                height: 2,
                decoration: BoxDecoration(
                    color: context.colors.secondary,
                    borderRadius: BorderRadiuses.r05),
              )
            ],
          ),
        ),
      ),
    );
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
