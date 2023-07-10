import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:rive/rive.dart';
import 'package:template/theme/theme_definition.dart';
import 'package:template/utils/list_extensions.dart';
import 'package:template/utils/utils.dart';
import 'package:template/widgets/misc/animation_scene.dart';

class DefaultScaffold extends StatefulWidget {
  final Widget child;
  const DefaultScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  bool _showMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Stack(
        children: [
          widget.child,
          _MenuView(showMenu: _showMenu),
          Positioned(
            right: 16,
            top: 16,
            child: _MenuButton(
              showMenu: _showMenu,
              onChanged: () {
                setState(
                  () {
                    _showMenu = !_showMenu;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuButton extends StatefulWidget {
  final bool showMenu;
  final void Function() onChanged;
  const _MenuButton({
    Key? key,
    required this.showMenu,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<_MenuButton> createState() => __MenuButtonState();
}

class __MenuButtonState extends State<_MenuButton> {
  RiveFile? _file;

  @override
  void initState() {
    super.initState();
    preload();
  }

  Future<void> preload() async {
    rootBundle.load('assets/animations/menu.riv').then(
      (data) async {
        setState(() {
          _file = RiveFile.import(data);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimationScene(
      _file!.mainArtboard,
      trigger: widget.showMenu ? 'closePressed' : 'openPressed',
      onTap: () => widget.onChanged(),
    );
  }
}

class _MenuView extends StatelessWidget {
  const _MenuView({
    super.key,
    required bool showMenu,
  }) : _showMenu = showMenu;

  final bool _showMenu;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: AnimatedContainer(
          duration: Durations.ms200,
          height: _showMenu ? MediaQuery.of(context).size.height : 0,
          width: MediaQuery.of(context).size.width,
          color: context.colors.tertiary.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _NavbarItems(
                onPressed: () {},
                text: translate('home'),
                isSelected: true,
              ),
              _NavbarItems(
                onPressed: () {},
                text: translate('who_is_marc'),
                isSelected: true,
              ),
              _NavbarItems(
                onPressed: () {},
                text: translate('projects'),
                isSelected: true,
              ),
              _NavbarItems(
                onPressed: () {},
                text: translate('side_quests'),
                isSelected: true,
              ),
            ].gap(Gaps.mdV),
          ),
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

  RiveFile? _file;

  @override
  void initState() {
    super.initState();
    preload();
  }

  Future<void> preload() async {
    rootBundle.load('assets/animations/wave.riv').then(
      (data) async {
        setState(() {
          _file = RiveFile.import(data);
        });
      },
    );
  }

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
              Text(
                widget.text,
                style: TextStyle(
                  color: isHovering
                      ? context.colors.onPrimary
                      : context.colors.secondary,
                  fontFamily: 'Garamond',
                  fontSize: 45,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AnimatedContainer(
                width: isHovering ? 400 : 0,
                duration: Durations.ms200,
                child: AnimationScene(_file!.mainArtboard),
              )
            ],
          ),
        ),
      ),
    );
  }
}
