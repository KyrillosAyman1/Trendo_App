import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trendo_app/models/product_model.dart';
import 'package:trendo_app/widgets/custom_drawer.dart';
import 'package:trendo_app/widgets/categories_list.dart';
import 'package:trendo_app/widgets/custom_text_field.dart';
import 'package:trendo_app/widgets/custom_sliver_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController searchController = TextEditingController();
bool isSearching = false;

List<ProductModel> itemsInCart = [];
 
class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: isSearching
              ? null
              : Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(FontAwesomeIcons.barsStaggered),
                    );
                  },
                ),
          title: isSearching
              ? CustomTextField(
                maxLines: 1,
                controller: searchController,
                hintText: "Enter product name",
                onChanged: (value) {
                  searchController.text = value;
                  setState(() {});
                },
              )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset("assets/images/t2.png", height: 36),
                    const Text(
                      "rendo",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0c396d),
                      ),
                    ),
                  ],
                ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  if (!isSearching) {
                    searchController.clear();
                  }
                });
              },
              icon:isSearching ? const Icon(FontAwesomeIcons.xmark, size: 24,
                color: Color(0xff0c396d),
                fontWeight: FontWeight.bold,) : Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 24,
                color: Color(0xff0c396d),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 8)),
            SliverToBoxAdapter(child: CategoriesList()),
            SliverToBoxAdapter(child: SizedBox(height: 8)),
            CustomSliverGrid(searchControl: searchController),
          ],
        ),
      ),
    );
  }
}
