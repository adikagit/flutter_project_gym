import 'package:adigym/const.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:shimmer/shimmer.dart';

class NeuTaskWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;
  final Uint8List? image;
  final int index;
  const NeuTaskWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.color,
    required this.image,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClayContainer(
        color: color, //boxColor,
        borderRadius: 16,
        depth: 30,
        curveType: CurveType.none,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              FullScreenWidget(
                disposeLevel: DisposeLevel.High,
                child: Hero(
                  tag: index,
                  child: Container(
                    child: image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.memory(
                              image!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill,
                              frameBuilder: ((context, child, frame,
                                  wasSynchronouslyLoaded) {
                                if (wasSynchronouslyLoaded) return child;
                                return frame != null
                                    ? child
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey.shade200,
                                            highlightColor:
                                                Colors.grey.shade100,
                                            child: Container(color: white),
                                          ),
                                        ),
                                      );
                              }),
                            ),
                          )
                        : null,
                  ),
                ),
              ),
              image != null
                  ? SizedBox(
                      width: 16,
                    )
                  : Container(),
              Expanded(
                child: Text(
                  title,
                  style: sub1,
                  textAlign: image != null ? TextAlign.left : TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
