import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../imports.dart';

class MyImage extends StatelessWidget {

  final String imageUrl;

  const MyImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {  final h=SizeApp(context).height;
  final w=SizeApp(context).width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(w*.04),
      child: CachedNetworkImage(
      
        imageUrl: imageUrl,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: w*.35,
            height: h*.17,
            color: Colors.grey,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
        width: w*.37,
        height: h*.15,
      ),
    );
  }
}
