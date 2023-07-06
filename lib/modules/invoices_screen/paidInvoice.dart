import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class paidInvoices extends StatelessWidget {
  const paidInvoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return FutureBuilder(builder: (context, snapshot) {
          return BlocProvider(
              create: (context) => AppCubit()..getinvoicesAdminPaid(),
              child: Scaffold(
                  body: ConditionalBuilderRec(
                condition: state is! getinvoiceAdminPaidloadingState,
                builder: (context) => state is getinvoiceAdminPaidSuccState
                    ? invoiceAdminbuild(state.invoice, context)
                    : Center(child: Text('No Invoices Yet')),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              )));
        });
      },
    );
  }
}
