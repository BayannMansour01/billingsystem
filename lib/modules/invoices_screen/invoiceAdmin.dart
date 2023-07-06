import 'package:billingsystem/models/allbill.dart';
import 'package:billingsystem/modules/AddInvoice/basic_info.dart';
import 'package:billingsystem/modules/invoices_screen/UnpaidInvoices.dart';
import 'package:billingsystem/modules/invoices_screen/paidInvoice.dart';
import 'package:billingsystem/modules/invoices_screen/search.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/componentes/constance.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceAdmin extends StatelessWidget {
  Billmodel? invoice;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getinvoicesAdmn(),
      child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
                floatingActionButton: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => basic_info()));
                    }),
                appBar: AppBar(
                    title: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Invoices',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Search(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.search,
                            )),
                      ),
                    ]),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      ConditionalBuilderRec(
                        condition: state is! GetinvoiceAdmnloadingState,
                        builder: (context) => state is GetInvoceAdmnSucessState
                            ? invoiceAdminbuild(
                                AppCubit.get(context).invoicesA, context)
                            : Center(child: Text('No Invoices Yet')),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      )
                    ],
                  ),
                ));
          }),
    );
  }
}
