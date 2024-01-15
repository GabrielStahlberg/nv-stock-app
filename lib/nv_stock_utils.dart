import 'package:flutter/material.dart';
import 'package:nv_stock_app/widgets/alert_dialog_popup.dart';
import 'package:nv_stock_app/widgets/dropdown.dart';

class NvStockUtils {
  static List<DropdownMenuItem<String>> getDropDownMenuItems(
      List<String> list) {
    List<DropdownMenuItem<String>> items = [];

    for (String item in list) {
      items.add(DropdownMenuItem(value: item, child: Text(item)));
    }

    return items;
  }

  static showOptionsDialog(
      BuildContext context,
      double widthSize,
      TextEditingController controller,
      String currentValue,
      String title,
      List<String> itemsValue) {
    List<DropdownMenuItem<String>> items = getDropDownMenuItems(itemsValue);
    currentValue = items[0].value!;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialogPopup(
            title: title,
            widthSize: widthSize,
            negativeButton: "Cancelar",
            positiveButton: "Confirmar",
            onPress: () {
              controller.text = currentValue;
              Navigator.pop(context);
            },
            content: StatefulBuilder(builder: (context, setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Selecione:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: widthSize * 0.04),
                  ),
                  DropDown(
                    value: currentValue,
                    items: items,
                    widthSize: widthSize,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    },
                    isExpanded: true,
                  ),
                ],
              );
            }),
          );
        });
  }

  static getCardIndicator(double widthSize, String text, Color color) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
          padding: EdgeInsets.only(
              left: widthSize * 0.05,
              right: widthSize * 0.05,
              bottom: widthSize * 0.01,
              top: widthSize * 0.01),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: widthSize * 0.042,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }

  static List<Widget> getImageSliders(
      List<dynamic> imagesExamples, bool isNetwork) {
    return imagesExamples
        .map((item) => Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              isNetwork
                  ? Image.network(item,
                  fit: BoxFit.cover, width: 1000.0)
                  : Image.file(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(),
              ),
            ],
          )),
    ))
        .toList();
  }

  static getCategories() {
    return [
      "Camisas Sociais",
      "Camisetas",
      "Costumes",
      "Moda feminina",
      "Gravatas",
      "Sapatos",
      "Cintos",
      "Carteiras"
    ];
  }
}