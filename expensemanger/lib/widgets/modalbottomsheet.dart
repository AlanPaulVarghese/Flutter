import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/money.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  var title = TextEditingController();
  var date = DateTime.now();
  var price = TextEditingController();
  List<bool> toggle = [false, false];
  bool moneyType = true;
  String selectedText = "Select Category";
  int cat = 6;

  void save() {
    Provider.of<MoneyData>(context, listen: false)
        .addData(title.text, double.parse(price.text), moneyType, cat, date);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<MoneyData>(context, listen: false);
    return Form(child: LayoutBuilder(
      builder: (ctx, size) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            children: [
              SizedBox(
                height: size.maxHeight * .05,
              ),
              TextField(
                controller: title,
                decoration: InputDecoration(
                    label: const Text("Title"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: size.maxHeight * .05,
              ),
              TextField(
                controller: price,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: const Text("price"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: size.maxHeight * .05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ToggleButtons(
                    borderRadius: BorderRadius.circular(20),
                    fillColor: Colors.blue,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Expense',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Income',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                                fontWeight: FontWeight.w900)),
                      ),
                    ],
                    isSelected: toggle,
                    onPressed: (index) {
                      setState(() {
                        if (index == 1) {
                          moneyType = false;
                        } else {
                          moneyType = true;
                        }
                        toggle[index] = !toggle[index];
                        for (int i = 0; i < 2; i++) {
                          if (i != index) {
                            toggle[i] = false;
                          }
                        }
                      });
                    },
                  ),
                  PopupMenuButton(
                      child: Text(selectedText),
                      onSelected: (val) {
                        setState(() {
                          cat = int.parse(val.toString());
                          selectedText = moneyType
                              ? p.expenseCat[val].toString()
                              : p.incomeCat[val].toString();
                        });
                      },
                      itemBuilder: (ctx) {
                        return moneyType ? p.expenseCatMenu : p.incomeCatMenu;
                      }),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: size.maxWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () async {
                          final res = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 10000)),
                              lastDate: DateTime.now());
                          setState(() {
                            date = res!;
                          });
                        },
                      ),
                      Text("${date.day}/${date.month}/${date.year}")
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: size.maxWidth * .7,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                      onPressed: () {
                        save();
                      },
                      child: const Text("Done")))
            ],
          ),
        );
      },
    ));
  }
}
