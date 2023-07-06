import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnpaidInvoices extends StatelessWidget {
  const UnpaidInvoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocProvider(
            create: (context) => AppCubit()..getinvoicesAdminUnPaid(),
            child: Scaffold(
              body: ConditionalBuilderRec(
                condition: state is! getinvoiceAdminUnPaidloadingState,
                builder: (context) => state is getinvoiceAdminUnPaidSuccState
                    ? invoiceAdminbuild(
                        AppCubit.get(context).invoicesAdminUnPaid, context)
                    : Center(child: Text('No Invoices Yet')),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
            ));
      },
    );
  }
}
