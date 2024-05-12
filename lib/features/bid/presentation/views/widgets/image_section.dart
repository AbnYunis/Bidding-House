import 'package:bidding_house/core/utils/imports.dart';

class ImagesSection extends StatefulWidget {
  const ImagesSection({super.key});

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
          height: 350.h(context),
          color: Colors.white,
          child: PageView(
            controller: _pageController,
            children: [
              Image.network(

                'https://cdn.shortpixel.ai/spai/q_glossy+ret_img+to_webp/mobizil.com/wp-content/uploads/2024/03/Samsung-Galaxy-A55-2.jpg',
                fit: BoxFit.contain,

              ),
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv5CcE53Y476FI4TfrfGS6WRs9dEIu2N5qvQ&s',
                fit: BoxFit.contain,
              ),
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFCiDc4vZwaPRL820q_A_2WK0iQGfMD51kUg&s',
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 10.h(context),
            left: 150.w(context),
            right: 150.w(context),
            child: Row(
              children: List.generate(
                  3,
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
