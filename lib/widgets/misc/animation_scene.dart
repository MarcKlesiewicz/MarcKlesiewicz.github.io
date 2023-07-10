import 'package:flutter/gestures.dart'
    show Offset, PointerDeviceKind, TapDownDetails;
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:rive_common/math.dart' show Vec2D;

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
          child: MouseRegion(
            onExit: (_) => _avatar.onExit(),
            onHover: (event) => _avatar.move(event.localPosition),
            child: RepaintBoundary(
              child: Rive(
                artboard: _avatar.artboard,
                useArtboardSize: true,
              ),
            ),
          ),
        ),
      );
}

/// Controller for an interactive avatar.
class RiveAvatar {
  late final Artboard _artboard;

  late final StateMachineController _controller;

  SMITrigger? _exitInput;
  SMITrigger? _pressInput;

  Artboard get artboard => _artboard;

  String? trigger;

  RiveAvatar(Artboard? artboard, String? trigger) {
    if (artboard == null) {
      throw Exception('No artboards cached!');
    }
    _artboard = artboard;

    /// To find proper artboard there is also _artboard.stateMachines list,
    /// or use static [StateMachineController.fromArtboard] method.
    _controller = StateMachineController(_artboard.stateMachines.first);
    _artboard.addController(_controller);

    /// Also available in _controller.inputs list.
    _exitInput = _controller.findTrigger('exited');
    if (trigger != null) {
      _pressInput = _controller.findTrigger(trigger);
    }
  }

  /// Interface for eyes/head moving from pointer's offset coordinates.
  void move(Offset pointer) => _controller.pointerMoveFromOffset(pointer);

  /// Fires "exit" animation.
  void onExit() => _exitInput?.fire();

  /// If there was a tap/click on avatar, plays background animation,
  /// and if it was touch input, move eyes/head to follow it and
  /// reset it after one second with "exit" animation.
  void onTapDown(TapDownDetails details) {
    _pressInput?.fire(); // Fire background animation.
    /// If it's a touch input (typically from smartphone, tablet) - continue,
    /// so users on those devices can enjoy a some interactivity too.
    if (details.kind == PointerDeviceKind.touch) {
      move(details.localPosition); // Move head/eyes to the tap position.
      Future.delayed(const Duration(seconds: 1), onExit); // Exit after one sec.
    }
  }
}

/// Helpers, that are not yet available in [StateMachineController].
extension StateMachineControllerX on StateMachineController {
  void pointerMoveFromOffset(Offset pointerOffset) => Vec2D.fromValues(
        pointerOffset.dx,
        pointerOffset.dy,
      );

  SMITrigger? findTrigger(String name) {
    final trigger = findInput<bool>(name);

    return trigger is SMITrigger? ? trigger : null;
  }
}
