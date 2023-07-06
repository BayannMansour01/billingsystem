import 'package:billingsystem/modules/invoices_screen/UnpaidInvoices.dart';
import 'package:billingsystem/modules/invoices_screen/paidInvoice.dart';
import 'package:billingsystem/modules/invoices_screen/search.dart';
import 'package:billingsystem/modules/invoices_screen/searchCustomer.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/componentes/constance.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Invoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getuserdata(accesstoken)
        ..getinvoicesCustomer(),
      child: BlocConsumer<AppCubit, AppState>(listener: (context, state) {
        if (state is GetInvoceAdmnSucessState) {
          //     invoice = state.invoicesA;

        }
      }, builder: (context, state) {
        return Scaffold(
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
                              builder: (context) => SearchCus(),
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
                    condition: state is! GetinvoiceloadingState,
                    builder: (context) => state is GetInvoceSucessState
                        ? invoiceCustomerbuild(
                            AppCubit.get(context).invoicesCus, context)
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
