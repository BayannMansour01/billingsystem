import 'package:billingsystem/modules/AddInvoice/item.dart';
import 'package:billingsystem/shared/componentes/constance.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class add_item_dialogo extends StatefulWidget {
  final Function(item) additem;
  final id;
  add_item_dialogo(this.additem, this.id);

  @override
  State<add_item_dialogo> createState() => _add_item_dialogoState();
}

class _add_item_dialogoState extends State<add_item_dialogo> {
  var name = TextEditingController();
  var quantity = TextEditingController();
  var priceone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.id;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is creatBillsuccessState) {
          print(state.creatres.billid);
          AppCubit.get(context).idbill = state.creatres.billid;
          print(AppCubit.get(context).idbill);
        }
      },
      builder: (context, state) {
        return BlocProvider(
          create: (context) => AppCubit(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8),
              height: 400,
              width: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'ADD ITEM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.green),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onSubmitted: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                          labelText: 'name',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                          )),
                      controller: name,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onSubmitted: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                          labelText: 'quantity',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                          )),
                      controller: quantity,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onSubmitted: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                          labelText: 'price one',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                          )),
                      controller: priceone,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final ite =
                            item(name.text, quantity.text, priceone.text);
                        widget.additem(ite);
                        print(name.text);
                        print(quantity.text);

                        print(widget.id);
                        AppCubit.get(context).additem(
                            context: context,
                            name: name.text,
                            quantity: quantity.text,
                            priceone: priceone.text,
                            id: widget.id);
                        Navigator.of(context).pop();
                      },
                      child: Text('ADD'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
