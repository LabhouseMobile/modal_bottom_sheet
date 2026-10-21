import 'package:flutter/material.dart';

typedef StatusBarGestureDetectorCallback = void Function(BuildContext context);

/// Widget that used to make the [scrollController] scroll to the top when
/// tapped on the status bar.
///
/// Extracted from [Scaffold] and used in [Sheet].
///
/// LABHOUSE FORK: this widget is now a pass-through that returns [child].
/// Upstream kept an `OverlayPortal.targetsRootOverlay` shown for the whole life
/// of every sheet. On Flutter 3.41.x a shown portal gives its overlay child one
/// parent in traversal order and another in hit-test order, which corrupts
/// `SemanticsObject.parent` in the iOS embedder and leaves the native
/// accessibility tree empty for the rest of the app session
/// (https://github.com/flutter/flutter/issues/182604, fixed in Flutter 3.47.7).
/// The status-bar strip no longer works anyway: since Flutter 3.41 iOS status
/// bar taps arrive as `handleScrollToTop` on `SystemChannels.statusBar`
/// instead of a touch at the top of the screen
/// (https://github.com/flutter/flutter/pull/181670).
class StatusBarGestureDetector extends StatefulWidget {
  const StatusBarGestureDetector({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;

  final StatusBarGestureDetectorCallback onTap;

  @override
  State<StatusBarGestureDetector> createState() =>
      _StatusBarGestureDetectorState();
}

class _StatusBarGestureDetectorState extends State<StatusBarGestureDetector> {
  @override
  Widget build(BuildContext context) => widget.child;
}
