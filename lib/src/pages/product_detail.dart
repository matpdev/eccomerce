import 'package:flutter/material.dart';
import 'package:eccomerce/src/model/data.dart';
import 'package:eccomerce/src/themes/light_color.dart';
import 'package:eccomerce/src/themes/theme.dart';
import 'package:eccomerce/src/widgets/title_text.dart';
import 'package:eccomerce/src/widgets/extentions.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isLiked = true;
  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 15,
            padding: 12,
            isOutline: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          _icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? LightColor.red : LightColor.lightGrey,
            size: 15,
            padding: 12,
            isOutline: false,
            onPressed: () {
              isLiked = !isLiked;
            },
          ),
        ],
      ),
    );
  }

  Widget _icon(
    IconData icon, {
    Color color = LightColor.iconColors,
    double size = 20,
    double padding = 10,
    bool isOutline = false,
    required Function onPressed,
  }) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColors,
            style: isOutline ? BorderStyle.solid : BorderStyle.none),
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        color:
            isOutline ? Colors.transparent : Theme.of(context).backgroundColor,
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Color(0xfff8f8f8),
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(5, 5)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    ).ripple(() {
      onPressed();
    }, borderRadius: const BorderRadius.all(Radius.circular(13)));
  }

  Widget _productImage() {
    return AnimatedBuilder(
      builder: (context, child) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: animation.value,
          child: child,
        );
      },
      animation: animation,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          const TitleText(
            text: "AIP",
            fontSize: 160,
            color: LightColor.lightGrey,
          ),
          Image.asset("assets/show_1.png")
        ],
      ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: AppData.showThumbnailList.map((x) => _thumbnail(x)).toList(),
      ),
    );
  }

  Widget _thumbnail(String image) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => AnimatedOpacity(
        opacity: animation.value,
        duration: const Duration(milliseconds: 500),
        child: child,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 40,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: LightColor.grey),
            borderRadius: const BorderRadius.all(
              Radius.circular(13),
            ),
          ),
          child: Image.asset(image),
        ).ripple(() {},
            borderRadius: const BorderRadius.all(Radius.circular(13))),
      ),
    );
  }

  Widget _detailWidget() {
    return DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .53,
      minChildSize: .53,
      builder: (context, scrollController) {
        return Container(
          padding: AppTheme.padding.copyWith(bottom: 0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: LightColor.iconColors,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const TitleText(
                        text: "NIKE AIR MAX 200",
                        fontSize: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              TitleText(
                                text: "R\$",
                                fontSize: 18,
                                color: LightColor.red,
                              ),
                              TitleText(
                                text: "240",
                                fontSize: 25,
                              ),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Icon(
                                Icons.star,
                                color: LightColor.yellowColor,
                                size: 17,
                              ),
                              Icon(
                                Icons.star,
                                color: LightColor.yellowColor,
                                size: 17,
                              ),
                              Icon(
                                Icons.star,
                                color: LightColor.yellowColor,
                                size: 17,
                              ),
                              Icon(
                                Icons.star,
                                color: LightColor.yellowColor,
                                size: 17,
                              ),
                              Icon(
                                Icons.star_border,
                                color: LightColor.yellowColor,
                                size: 17,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _availableSize(),
                const SizedBox(
                  height: 20,
                ),
                _availableColor(),
                const SizedBox(
                  height: 20,
                ),
                _description(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _sizeWidget("Us 6"),
            _sizeWidget("Us 7", isSelected: true),
            _sizeWidget("Us 8"),
            _sizeWidget("Us 9"),
          ],
        )
      ],
    );
  }

  Widget _sizeWidget(String text, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColors,
            style: !isSelected ? BorderStyle.solid : BorderStyle.none),
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        color: isSelected ? LightColor.orange : LightColor.titleTextColor,
      ),
      child: TitleText(
        text: text,
        fontSize: 16,
        color: isSelected ? LightColor.background : LightColor.titleTextColor,
      ),
    ).ripple(() {}, borderRadius: const BorderRadius.all(Radius.circular(13)));
  }

  Widget _availableColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _colorWidget(LightColor.yellowColor, isSelected: true),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.lightBlue),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.black),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.red),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.skyBlue),
          ],
        )
      ],
    );
  }

  Widget _colorWidget(Color color, {bool isSelected = false}) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: color.withAlpha(150),
      child: isSelected
          ? Icon(
              Icons.check_circle,
              color: color,
              size: 18,
            )
          : CircleAvatar(
              radius: 7,
              backgroundColor: color,
            ),
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(AppData.description)
      ],
    );
  }

  FloatingActionButton _floatingButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: LightColor.orange,
      child: Icon(
        Icons.shopping_basket,
        color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingButton(),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfffbfbfb),
                Color(0xfff7f7f7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _appBar(),
                  _productImage(),
                  _categoryWidget(),
                ],
              ),
              _detailWidget()
            ],
          ),
        ),
      ),
    );
  }
}
