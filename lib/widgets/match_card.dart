import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magulab_flutter/models/match.dart';
import 'package:magulab_flutter/styles.dart';

class FrostyBackground extends StatelessWidget {
  const FrostyBackground({
    this.color,
    this.intensity = 25,
    this.child,
  });

  final Color color;
  final double intensity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: intensity, sigmaY: intensity),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
          ),
          child: child,
        ),
      ),
    );
  }
}

/// A Card-like Widget that responds to tap events by animating changes to its
/// elevation and invoking an optional [onPressed] callback.
class PressableCard extends StatefulWidget {
  const PressableCard({
    @required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.upElevation = 2,
    this.downElevation = 0,
    this.shadowColor = CupertinoColors.black,
    this.duration = const Duration(milliseconds: 100),
    this.onPressed,
    Key key,
  })  : assert(child != null),
        assert(borderRadius != null),
        assert(upElevation != null),
        assert(downElevation != null),
        assert(shadowColor != null),
        assert(duration != null),
        super(key: key);

  final VoidCallback onPressed;

  final Widget child;

  final BorderRadius borderRadius;

  final double upElevation;

  final double downElevation;

  final Color shadowColor;

  final Duration duration;

  @override
  _PressableCardState createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> {
  bool cardIsDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => cardIsDown = false);
        if (widget.onPressed != null) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => setState(() => cardIsDown = true),
      onTapCancel: () => setState(() => cardIsDown = false),
      child: AnimatedPhysicalModel(
        elevation: cardIsDown ? widget.downElevation : widget.upElevation,
        borderRadius: widget.borderRadius,
        shape: BoxShape.rectangle,
        shadowColor: widget.shadowColor,
        duration: widget.duration,
        color: CupertinoColors.lightBackgroundGray,
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: widget.child,
        ),
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  MatchCard(this.match);

  final Match match;

  Widget _buildDetails() {
    return FrostyBackground(
      color: Color(0x90ffffff),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  match.request.apartName,
                  style: Styles.cardTitleText,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      match.addressDongHoText,
                      style: Styles.cardSubText,
                    ),
                    Container(
                      width: 10,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: new BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          "${match.matcingRate}",
                          style: Styles.cardMatchRateText,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  match.detailsText,
                  style: Styles.cardDetailText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      onPressed: () {
        Navigator.of(context).push<void>(CupertinoPageRoute(
          // builder: (context) => DetailsScreen(veggie.id),
          fullscreenDialog: true,
        ));
      },
      child: Stack(
        children: [
          Semantics(
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: Styles.desaturatedColorFilter,
                  image: AssetImage(
                    match.imageAssetPath,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildDetails(),
          ),
        ],
      ),
    );
  }
}
