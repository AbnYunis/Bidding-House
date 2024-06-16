import 'package:bidding_house/core/utils/imports.dart';

class ImagesSection extends StatefulWidget {
  const ImagesSection({super.key, required this.images});

  final List images;

  @override
  State<ImagesSection> createState() => _ImagesSectionState();
}

class _ImagesSectionState extends State<ImagesSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_handlePageChange);
  }

  void _handlePageChange() {
    setState(() {
      _currentPage = _pageController.page!.round();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: PageView(
            controller: _pageController,
            children: List.generate(
              widget.images.length,
              (index) => Image.network(
                widget.images[index],
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 20.h(context),
            left: 150.w(context),
            right: 150.w(context),
            child: Row(
              children: List.generate(
                  widget.images.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(3),
                        child: CircleAvatar(
                          backgroundColor: _currentPage == index
                              ? Colors.black
                              : Colors.grey,
                          radius: 5.w(context),
                        ),
                      )),
            ))
      ],
    );
  }
}
