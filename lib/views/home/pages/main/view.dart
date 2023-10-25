import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project1/features/categories/cubit.dart';
import 'package:project1/features/categories/states.dart';
import 'package:project1/features/products/cubit.dart';
import 'package:project1/features/products/states.dart';
import 'package:project1/features/slider/cubit.dart';
import 'package:project1/features/slider/states.dart';
import 'package:project1/shared/design/app_button.dart';
import 'package:project1/shared/design/app_image.dart';
import 'package:project1/shared/design/app_input.dart';
import 'package:project1/shared/logic/cache_helper.dart';
import 'package:project1/shared/logic/helper_methods.dart';
import 'package:project1/views/auth/thimar_login/view.dart';
import '../../../../features/categories/model.dart';
import '../../../../features/products/model.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: AppInput(
              labelText: "ابحث عن ماتريد؟",
              icon: "assets/icons/svg/search.svg",
            ),
          ),
          BlocBuilder<SliderCubit, SliderStates>(
            builder: (context, state) {
              if (state is GetSliderLoadingStates) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetSliderSuccessStates) {
                return Column(
                  children: [
                    CarouselSlider(
                      items: List.generate(
                        state.list.length,
                        (index) => AppImage(
                          state.list[index].media,
                          fit: BoxFit.fill,
                          height: 164,
                          width: double.infinity,
                        ),
                      ),
                      options: CarouselOptions(
                        height: 164,
                        autoPlay: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          currentIndex = index;
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        state.list.length,
                        (index) => Padding(
                          padding: const EdgeInsetsDirectional.only(end: 3),
                          child: CircleAvatar(
                            radius: index == currentIndex ? 6 : 4,
                            backgroundColor: index == currentIndex
                                ? Theme.of(context).primaryColor
                                : const Color(0xff61B80C),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Text("Failed");
              }
            },
          ),
          BlocBuilder<CategoriesCubit, CategoriesStates>(
            builder: (context, state) {
              if (state is CategoryLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CategorySuccessState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "الأقسام",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      height: 103,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 16,
                        ),
                        itemBuilder: (context, index) =>
                            _ItemCategory(model: state.list[index]),
                        itemCount: state.list.length,
                      ),
                    ),
                  ],
                );
              } else {
                return const Text("Failed");
              }
            },
          ),
          const SizedBox(
            height: 22,
          ),
          BlocBuilder<ProductsCubit, ProductsStates>(
            builder: (context, state) {
              if (state is ProductsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductsSuccessState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "الأصناف",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      GridView.builder(
                        itemCount: state.list.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 163 / 250,
                                mainAxisSpacing: 26,
                                crossAxisSpacing: 26),
                        itemBuilder: (context, index) => _ItemProduct(
                          model: state.list[index],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Text("Failed");
              }
            },
          ),
        ],
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  final ProductModel model;

  const _ItemProduct({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
              fit: StackFit.expand,
              children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(11),
              child: AppImage(
                model.mainImage,
                fit: BoxFit.cover,
              ),
            ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(11),
                      ),
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1),
                      child: Text(
                        "${model.discount}%",
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
          ]),
        ),

        Text(
          model.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(
          "السعر / 1${model.unit.name}",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text.rich(
          TextSpan(
            text: "${model.price} ر.س",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            children: [
              TextSpan(
                text: " ${model.priceBeforeDiscount} ر.س",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 19,
        ),
        SizedBox(
          height: 30,
          width: 115,
          child: AppButton(
            text: "أضف للسلة",
            onPress: () {},
          ),
        ),
      ],
    );
  }
}

class _ItemCategory extends StatelessWidget {
  final CategoryModel model;
  const _ItemCategory({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: 73,
            width: 73,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(model.media),
          ),
        ),
        Text(
          model.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        height: 60,
        child: Row(
          children: [
            const AppImage(
              "assets/images/logo.png",
              height: 21,
              width: 21,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              "سلة ثمار",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "التوصيل إلي\n",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                  children: const [
                    TextSpan(
                      text: "شارع الملك فهد - جدة",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 33,
              width: 33,
              padding: const EdgeInsetsDirectional.all(7),
              child: GestureDetector(
                onTap: () {
                  CacheHelper.clear();
                  toGetNavigate(const ThimarLogin());
                },
                child: Badge(
                    alignment: AlignmentDirectional.topStart,
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 4, vertical: 2),
                    backgroundColor: Theme.of(context).primaryColor,
                    label: const Text(
                      "3",
                      style: TextStyle(
                        fontSize: 6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/svg/cart.svg",
                    )),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: const Color(0xff4C8613).withOpacity(.13),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
