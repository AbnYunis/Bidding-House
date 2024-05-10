import '../imports.dart';

class MyImage extends StatelessWidget {

  final String imageUrl;

  const MyImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.w(context)),
      child: CachedNetworkImage(
      
        imageUrl: imageUrl,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 140.w(context),
            height: 140.h(context),
            color: Colors.grey,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
        width: 140.w(context),
        height: 140.h(context),
      ),
    );
  }
}
