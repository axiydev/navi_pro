/*
Created by Axmadjon Isaqov on 18:15:01 22.07.2022
© 2022 @axi_dev 
*/
/*
Mavzu:::Apple shop ui
*/
import 'package:flutter/material.dart';
import 'package:navi_pro/consts/consts.dart';
import 'package:navi_pro/models/shop_model.dart';

class PdPui2 extends StatefulWidget {
  const PdPui2({super.key});

  @override
  State<PdPui2> createState() => _PdPui2State();
}

class _PdPui2State extends State<PdPui2> {
  final List<ShopModel> _list = [];
  int _countFavourite = 0;
  Size? _size;
  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;

    _list.addAll([
      ShopModel(image: MyImages.goldIphone.image, isFavourite: false),
      ShopModel(image: MyImages.iPad.image, isFavourite: true),
      ShopModel(image: MyImages.ihoneEight.image, isFavourite: false),
      ShopModel(image: MyImages.macBook.image, isFavourite: false),
      ShopModel(image: MyImages.goldIphone.image, isFavourite: false),
      ShopModel(image: MyImages.goldIphone.image, isFavourite: false),
      ShopModel(image: MyImages.appleRed.image, isFavourite: false),
      ShopModel(image: MyImages.iPad.image, isFavourite: false),
      ShopModel(image: MyImages.ihoneEight.image, isFavourite: false),
      ShopModel(image: MyImages.macBook.image, isFavourite: false),
      ShopModel(image: MyImages.goldIphone.image, isFavourite: false),
    ]);

    for (var item in _list) {
      if (item.isFavourite!) {
        _countFavourite++;
      }
    }
    setState(() {});
    super.didChangeDependencies();
  }

  bool? _changeFavourite(bool? isFavourite) => !isFavourite!;
  void _onCountedFavourite(bool? isFavourite) {
    if (isFavourite!) {
      _countFavourite++;
    } else if (!isFavourite) {
      _countFavourite--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("Apple Products"),
        backgroundColor: Colors.black,
        elevation: .0,
        bottomOpacity: .0,
        actions: [
          Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            margin: const EdgeInsets.only(
              right: 10,
              top: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF424242),
            ),
            child: Text(_countFavourite.toString()),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ///Lifestyle sale
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10,
                top: 15,
              ),
              child: Container(
                // height: _size!.width * 0.6,
                width: double.infinity,
                padding: const EdgeInsets.only(
                    bottom: 25, left: 40, right: 40, top: 80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: AssetImage(MyImages.appleRed.image!),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///text
                    const Text(
                      "Lifestyle sale",
                      style: TextStyle(fontSize: 33, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    ///Shop now button
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: .0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white),
                          onPressed: () {},
                          child: const Text("Shop now")),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ///items grid
            GridView.builder(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                  top: 15,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemCount: _list.length,
                itemBuilder: (context, index) => InkWell(
                      splashColor: Colors.blue,
                      onTap: () {
                        bool? isFavourite =
                            _changeFavourite(_list[index].isFavourite);
                        _list[index].setFavourite = isFavourite;

                        _onCountedFavourite(isFavourite);
                        setState(() {});
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: getCardItem(
                          image: _list[index].image,
                          isFavourite: _list[index].isFavourite),
                    ))
          ],
        ),
      )),
    );
  }

  Widget getCardItem({String? image, bool? isFavourite}) {
    return Card(
      elevation: .0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(fit: BoxFit.cover, image: AssetImage(image!))),
        child: Icon(
          isFavourite! ? Icons.star : Icons.star_border_purple500_outlined,
          size: 35,
          color: const Color(0xFFFFEB3B),
        ),
      ),
    );
  }
}
