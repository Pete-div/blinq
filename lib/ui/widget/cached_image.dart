import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final BoxFit? fit;
  final Widget? errorWidget;
  final Widget? placeholder;
  final Alignment? alignment;
  final String? hash;
  const CachedImage({
    Key? key,
    required this.url,
    this.height = 60,
    this.width = 60,
    this.fit = BoxFit.contain,
    this.errorWidget,
    this.alignment,
    this.placeholder,
    this.hash,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url,
      width: width,
      height: height,
      gaplessPlayback: true,
      filterQuality: FilterQuality.high,
      // cacheKey: UniqueKey().toString(),
      fit: fit,
      cache: true,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return SizedBox(
                width: width,
                // fit: fit,
                height: height,
                child: placeholder ??
                    BlurHash(
                        hash: hash ??
                            'LKO2?U%2Tw=w]~RBVZRi};RPxuwH' // 'L5H2EC=PM+yV0g-mq.wG9c010J}I' //??
                        // 'LFF5ywmx_Lw\$pJ?GxHtOakS^RjX4'
                        ));
          case LoadState.completed:
            return ExtendedRawImage(
                image: state.extendedImageInfo?.image,
                width: width,
                fit: fit,
                filterQuality: FilterQuality.high,
                height: height);
          case LoadState.failed:
            return errorWidget ??
                BlurHash(
                    hash: hash ??
                        'LKO2?U%2Tw=w]~RBVZRi};RPxuwH' //'L5H2EC=PM+yV0g-mq.wG9c010J}I' //??
                    // 'LFF5ywmx_Lw\$pJ?GxHtOakS^RjX4'
                    );
          //     GestureDetector(
          //       child: Stack(
          //         fit: StackFit.expand,
          //         children: <Widget>[
          //           Container(
          //               width: width,
          //               height: height,
          //               child:
          //                   // BlurHash(hash:hash ?? 'LFF5ywmx_Lw\$pJ?GxHtOakS^RjX4')),
          //                   Center(
          //                 child: Text(
          //                   "load image failed, click to reload",
          //                   textAlign: TextAlign.center,
          //                 ),
          //               ))
          //         ],
          //       ),
          //       onTap: () {
          //         state.reLoadImage();
          //       },
          //     );
          // break;
        }
        // return SizedBox();
      },
    );
  }
}
