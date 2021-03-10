import 'package:flutter/cupertino.dart';

import 'common/label.dart';

class HouseDetails extends StatefulWidget {
  @override
  _HouseDetailsState createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  bool isInSite = false;
  double roomCount = 0;
  int roofCount = 0;
  String situation;
  String warming;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Ev Listesi",
        middle: Text("Ev Detayı"),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Label("Apartman Adı"),
            CupertinoTextField(),
            Label("Site İçerisinde mi"),
            CupertinoSwitch(
              value: isInSite,
              onChanged: (newValue) {
                setState(() {
                  isInSite = newValue;
                });
              },
            ),
            Label("Oda Sayısı"),
            CupertinoSlider(
              min: 0,
              max: 4,
              divisions: 4,
              value: roomCount,
              onChanged: (newValue) {
                setState(() {
                  roomCount = newValue;
                });
              },
            ),
            Label("Durumu"),
            CupertinoSlidingSegmentedControl(
              children: {
                "onSale": Text("Satılık"),
                "onRent": Text("Kiralık"),
                "both": Text("Hepsi"),
              },
              groupValue: situation,
              onValueChanged: (selectedMapItem) {
                setState(() {
                  situation = selectedMapItem;
                });
              },
            ),
            Label("Isınma"),
            CupertinoSegmentedControl(
              groupValue: warming,
              children: {
                "gas": Text("Doğal Gaz"),
                "centeral": Text("Merkezi Sistem"),
                "both": Text("Hepsi"),
              },
              onValueChanged: (selectedMapItem) {
                setState(() {
                  warming = selectedMapItem;
                });
              },
            ),
            Label("Kat Sayısı"),
            CupertinoPicker(
                itemExtent: 45,
                children: [Text("1 Katlı"), Text("2 Katlı"), Text("3 Katlı")],
                onSelectedItemChanged: (int newValue) {
                  print(newValue);
                  setState(() {
                    roofCount = newValue;
                  });
                }),
            CupertinoButton(
              child: Text("Balkon Sayısı"),
              onPressed: () async {
                await showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        title: Text("Balkon"),
                        message: Text("Balkon Sayısı Seç"),
                        cancelButton: CupertinoActionSheetAction(
                          child: Text("Vazgeç"),
                          onPressed: () {},
                        ),
                        actions: [
                          CupertinoActionSheetAction(
                            child: Text("1 Balkon"),
                            isDefaultAction: true,
                            onPressed: () {},
                          ),
                          CupertinoActionSheetAction(
                            child: Text("2 Balkon"),
                            onPressed: () {},
                          ),
                          CupertinoActionSheetAction(
                            child: Text("3 Balkon"),
                            onPressed: () {},
                            isDestructiveAction: true,
                          ),
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
