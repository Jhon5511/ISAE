import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isae/src/complements/globalStyles.dart';

class ListReoderViewCard extends StatefulWidget {
  final int index;
  final Key key;
  final List<String> listBanks;
  final List<String> listImages;

  ListReoderViewCard(this.listBanks, this.listImages, this.index, this.key);

  @override
  _ListReoderViewCard createState() => _ListReoderViewCard();
}

class _ListReoderViewCard extends State<ListReoderViewCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height * 0.10,
                    alignment: Alignment.centerLeft,
                    child: Image(image: new AssetImage(widget.listImages[widget.index]),fit: BoxFit.fill, width: 55, height: 50),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      height: MediaQuery.of(context).size.height * 0.10,
                      alignment: Alignment.centerRight,
                      child: GlobalStyles.formartListNBench(widget)
                      /*child: Text(
                        GlobalStyles.numFormatB.format(double.parse(widget.listBanks[widget.index])),
                        //widget.listBanks[widget.index],
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                        textAlign: TextAlign.right,
                        maxLines: 5,
                      ),*/
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.reorder,
                color: Colors.grey,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}