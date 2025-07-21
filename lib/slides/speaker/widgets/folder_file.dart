import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:patrol_presentation/core/extensions/context_ext.dart';
import 'package:patrol_presentation/core/widgets/glass_container.dart';
import 'package:patrol_presentation/core/widgets/margins.dart';
import 'package:patrol_presentation/generated/assets.gen.dart';

class FolderFile extends HookWidget {
  const FolderFile({
    required this.text,
    required this.animationIndex,
    this.textReplacement,
    super.key,
  });
  
  final String text;
  final int animationIndex;
  final Widget? textReplacement;

  @override
  Widget build(BuildContext context) {
    final position = useState(const Offset(100, 100));
    final normalizedAnimationIndex = animationIndex - 3;

    final child = Padding(
      padding: EdgeInsets.only(
        bottom: 120,
        left: (2 * normalizedAnimationIndex).toDouble(),
        right: 24,
      ),
      child: GlassContainer(
        width: 240,
        height: 240,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              if (textReplacement == null)
                Text(
                  text,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                )
              else
                textReplacement ?? const SizedBox.shrink(),
              verticalMargin16,
              Visibility(
                visible: animationIndex == 5,
                child: Assets.images.youtrust.image(
                  width: 100,
                  height: 100,
                ),
              ),
          ],
        ),
      ),
    );

    return Draggable(
      childWhenDragging: Opacity(
        opacity: .3,
        child: child,
      ),
      onDragEnd: (details) => position.value = details.offset,
      feedback: child,
      child: child,
    );
  }
}
