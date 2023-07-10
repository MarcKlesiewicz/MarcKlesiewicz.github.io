import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';

class AnimationScene extends StatelessWidget {
  final RiveAvatar _avatar;
  final String? trigger;
  final void Function()? onTap;

  AnimationScene(
    Artboard? cachedArtboard, {
    super.key,
    this.trigger,
    this.onTap,
  }) : _avatar = RiveAvatar(
          cachedArtboard,
          trigger,
        );

  @override
  Widget build(BuildContext context) => FittedBox(
        child: GestureDetector(
          onTapDown: (details) {
            _avatar.onTapDown(details);
            if (onTap != null) {
              onTap!();
            }
          },
          child: RepaintBoundary(
            child: Rive(
              artboard: _avatar.artboard,
              useArtboardSize: true,
            ),
          ),
        ),
      );
}

class RiveAvatar {
  late final Artboard _artboard;

  late final StateMachineController _controller;

  SMITrigger? _pressInput;

  Artboard get artboard => _artboard;

  String? trigger;

  RiveAvatar(Artboard? artboard, String? trigger) {
    if (artboard == null) {
      throw Exception('No artboards cached!');
    }
    _artboard = artboard;
    _controller = StateMachineController(_artboard.stateMachines.first);
    _artboard.addController(_controller);

    if (trigger != null) {
      _pressInput = _controller.findTrigger(trigger);
    }
  }

  void onTapDown(TapDownDetails details) {
    _pressInput?.fire();
  }
}

extension StateMachineControllerX on StateMachineController {
  SMITrigger? findTrigger(String name) {
    final trigger = findInput<bool>(name);

    return trigger is SMITrigger? ? trigger : null;
  }
}
