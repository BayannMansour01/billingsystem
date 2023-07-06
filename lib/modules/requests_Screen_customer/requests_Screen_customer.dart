import 'package:billingsystem/models/getpending.dart';
import 'package:billingsystem/shared/componentes/componentes.dart';
import 'package:billingsystem/shared/cubit/app_cubit.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class reqestsCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getpending(),
      child: BlocConsumer<AppCubit, AppState>(listener: (context, state) {
        if (state is approvesuccState) {
          Fluttertoast.showToast(
              msg: 'approved success',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (state is RejectsuccState) {
          Fluttertoast.showToast(
              msg: 'reject success',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }, builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text(
                      'Requests',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
                // totalRequest(context),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.grey.shade800,
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Requests',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 77, 74, 74)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Requests',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 15,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View All',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 15,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),

                //  viewRequests(context),
                ConditionalBuilderRec(
                  condition: state is! getpendingLoadingState,
                  builder: (context) => state is getpendinggSuccState
                      ? RequestsBuild(AppCubit.get(context).getpenres, context)
                      : Center(child: Text('No Request Yet')),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
                //gridviwe(context),
              ],
            ),
          ),
        );
      }),
    );
  }

  // Widget totalRequest(BuildContext context) {
  //   return   }

  // Widget viewRequests(BuildContext context) {
  //   return ;
  // }

  Widget gridviwe(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.9,
      //  padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
      primary: false,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      shrinkWrap: true,
      children: [
        gridviweitem(
            namesender: 'Sender bill name',
            Totalprice: 'this is total Pcrice bill \$',
            id: 'assets/images/download.png',
            context: context),
      ],
    );
  }

  Widget RequestsBuild(Getrequestpending req, context) {
    return ConditionalBuilderRec(
        condition: req.request!.length > 0,
        builder: (context) => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              // crossAxisCount: 2,
              // childAspectRatio: 0.9,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
              primary: false,
              //crossAxisSpacing: 4,
              // mainAxisSpacing: 4,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return gridviweitem(
                    namesender: '${req.request![index].id}',
                    Totalprice: '${req.request![index].createdAt}',
                    id: '${req.request![index].id}',
                    context: context);
              },
              itemCount: req.request!.length,
            ),
        fallback: (context) => Center(
              child: Text('empty Admin'),
            ));
  }

  Widget gridviweitem(
      {required String namesender,
      required String Totalprice,
      required String id,
      BuildContext? context}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      elevation: 4,
      shadowColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.only(top: 13),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                namesender,
                style: Theme.of(context!).textTheme.bodyText2!.copyWith(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Text(
              Totalprice,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 78,
            ),
            Row(
              verticalDirection: VerticalDirection.down,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4))),
                    child: MaterialButton(
                      onPressed: () {
                        AppCubit.get(context).approve(id);
                        AppCubit.get(context).getpending();
                      },
                      child: Center(
                        child: Text(
                          'Accept',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4))),
                    child: MaterialButton(
                      onPressed: () {
                        AppCubit.get(context).reject(id);
                        AppCubit.get(context).getpending();
                      },
                      child: Center(
                        child: Text(
                          'Reject',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
