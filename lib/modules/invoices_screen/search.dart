import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  var searchcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          //  var list = AppCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultextformfield(
                      controlle: searchcontroller,
                      type: TextInputType.text,
                      label: 'Search by customer\'s user name',
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'search not be empty';
                        }
                      },
                      onSubmit: (value) {
                        print(value);
                        AppCubit.get(context).getsearchbill(value);
                      },
                      prefixIcon: Icons.search),
                ),
                if (state is GetSearchSucessState)
                  Expanded(
                      child: invoiceSearchedbuild(
                          AppCubit.get(context).search, context)),
              ]),
            ),
          );
        },
      ),
    );
  }
}

// class Search extends StatelessWidget {
//   var searshcontroller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<LoginCubit, LoginStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           var list = LoginCubit.get(context).search;
//           return Scaffold(
//             appBar: AppBar(),
//             body: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: defaultextformfield(
//                       controlle: searshcontroller,
//                       label: 'searsh',
//                       prefixIcon: Icons.search,
//                       onChange: (value) {
//                         LoginCubit.get(context).getsearch(value);
//                       },
//                       type: TextInputType.text,
//                       validate: (value) {
//                         return 'search is not be empty';
//                       }),
//                 ),
//                 Expanded(
//                     child: InvoicAdmnBuilder(list, context, isSearch: true)),
//               ],
//             ),
//           );
//         });
//   }
// }
