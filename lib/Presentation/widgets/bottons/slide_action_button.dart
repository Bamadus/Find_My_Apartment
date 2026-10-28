
import 'package:flutter/material.dart';

class SlideActionButton extends StatefulWidget {
  final VoidCallback onComplete;
  final String text;

  const SlideActionButton({
    super.key,
    required this.onComplete,
    this.text = "Slide to Continue",
  });

  @override
  State<SlideActionButton> createState() =>
      _SlideActionButtonState();
}

class _SlideActionButtonState extends State<SlideActionButton> {
  double _dragPosition = 0;
  bool _completed = false;
  bool _isDragging = false;

  static const double _height = 65;
  static const double _thumbSize = 55;
  static const double _padding = 5;

  void _handleDragEnd(double maxDrag) {
    if (_completed) return;

    setState(() {
      _isDragging = false;

      if (maxDrag > 0 && _dragPosition >= maxDrag * 0.9) {
        _dragPosition = maxDrag;
        _completed = true;
      } else {
        _dragPosition = 0;
      }
    });

    if (_completed) {
      widget.onComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxDrag =
            (constraints.maxWidth - _thumbSize - 2 * _padding)
                .clamp(0.0, double.infinity)
                .toDouble();

        final position = _dragPosition.clamp(0.0, maxDrag);

        return Container(
          height: _height,
          decoration: BoxDecoration(
            color:  const Color(0xffdee2e6).withOpacity(1),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // 1. Coloured trail behind the button
              AnimatedContainer(
                duration: Duration(
                  milliseconds: _isDragging ? 0 : 250,
                ),
                curve: Curves.easeOut,
                width: _padding + position + _thumbSize,
                height: _height,
                decoration: BoxDecoration(
                  // color: const Color(0xff343a40).withOpacity(.3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff001233),
                      Color(0xff023e7d),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),

              // 2. Button text
              Center(
                child: Text(
                  _completed ? "Completed!" : widget.text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // 3. Draggable circular button
              AnimatedPositioned(
                duration: Duration(
                  milliseconds: _isDragging ? 0 : 250,
                ),
                curve: Curves.easeOut,
                left: _padding + position,
                top: _padding,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,

                  onHorizontalDragStart: _completed
                      ? null
                      : (_) {
                          setState(() {
                            _isDragging = true;
                          });
                        },

                  onHorizontalDragUpdate: _completed
                      ? null
                      : (details) {
                          setState(() {
                            _dragPosition =
                                (_dragPosition + details.delta.dx)
                                    .clamp(0.0, maxDrag)
                                    .toDouble();
                          });
                        },

                  onHorizontalDragEnd: _completed
                      ? null
                      : (_) => _handleDragEnd(maxDrag),

                  onHorizontalDragCancel: _completed
                      ? null
                      : () => _handleDragEnd(maxDrag),

                  child: Container(
                    width: _thumbSize,
                    height: _thumbSize,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _completed
                          ? Icons.check
                          : Icons.arrow_forward,
                      color: const Color(0xff212529),
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
