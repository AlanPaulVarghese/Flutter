import 'package:expensemanger/widgets/filter_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/money.dart';
import '../widgets/dashlisttile.dart';
import '../widgets/expensevsincome.dart';
import '../widgets/modalbottomsheet.dart';
import '../widgets/drawer.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  bool loading = true;
  @override
  void initState() {
    Provider.of<MoneyData>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<MoneyData>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const Drawer(
          child: DrawerWidget(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                context: context,
                builder: (ctx) {
                  return const SizedBox(height: 400, child: ModalBottomSheet());
                });
          },
          child: Icon(
            Icons.add,
            color: p.darkMode ? Colors.black : Colors.white,
          ),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: p.darkMode ? Colors.black : Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blue),
          backgroundColor: p.darkMode ? Colors.black : Colors.white,
          title: const Text(
            "MoneyManger",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: const [
            FilterMenu(),
          ],
          centerTitle: true,
          elevation: 0,
        ),
        body: Consumer<MoneyData>(builder: (ctx, p, _) {
          return p.data.isEmpty
              ? const Center(
                  child: Text(
                    "No Data,Use + To Add Data",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 15),
                  ),
                )
              : SizedBox(
                  height: size.height,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 10,
                          color: p.darkMode ? Colors.black : Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                  width: double.infinity,
                                  height: size.height * .20,
                                  child: IncomeVsExpense(
                                      expenseTotal: p.expenseTotal,
                                      incomeTotal: p.incomeTotal)),
                              Container(
                                height: size.height * .15,
                                width: size.width * .9,
                                padding: const EdgeInsets.all(15),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Total Expense-",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(p.expenseTotal.toString(),
                                              style: const TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Total Income-",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w600)),
                                          Text(p.incomeTotal.toString(),
                                              style: const TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Total Cash Flow-",
                                              style: p.incomeTotal -
                                                          p.expenseTotal >
                                                      0
                                                  ? const TextStyle(
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.w600)
                                                  : const TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                          Text(
                                              (p.incomeTotal - p.expenseTotal)
                                                  .toString(),
                                              style: p.incomeTotal -
                                                          p.expenseTotal >
                                                      0
                                                  ? const TextStyle(
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.w600)
                                                  : const TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemBuilder: (ctx, i) {
                            return Dismissible(
                                background: Container(
                                  color: Colors.red,
                                  child: const Center(
                                    child: Icon(Icons.delete),
                                  ),
                                ),
                                key: UniqueKey(),
                                onDismissed: (dir) {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                            title: const Text("Are you sure ?"),
                                            content: const Text(
                                                "This will delete this Transaction"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(true);
                                                  },
                                                  child: const Text(
                                                    "yes",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  )),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(false);
                                                  },
                                                  child: const Text(
                                                    "no",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ))
                                            ],
                                          )).then((value) {
                                    if (value) {
                                      p.delete(p.data[i].id);
                                    }
                                  });
                                },
                                child: DashListTile(data: p.data[i]));
                          },
                          itemCount: p.data.length,
                        )),
                        SizedBox(
                          height: size.height * .06,
                        )
                      ],
                    ),
                  ),
                );
        }));
  }
}
