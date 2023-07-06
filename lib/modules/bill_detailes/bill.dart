import 'package:billingsystem/models/allbill.dart';
import 'package:billingsystem/modules/bill_detailes/folderClipper.dart';
import 'package:billingsystem/modules/bill_detailes/headerClipper.dart';
import 'package:billingsystem/modules/bill_detailes/invoiceContentClipper.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ' as pw;
import 'package:screenshot/screenshot.dart';
import 'package:printing/printing.dart';

final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();

class BillSc extends StatelessWidget {
  BillSc(billdataa) {
    this.billdata = billdataa;
  }
  late final BillmodelDatum billdata;
  void _printScreen() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      final image = await WidgetWraper.fromKey(
        key: _printKey,
        pixelRatio: 2.0,
      );

      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Expanded(
                child: pw.Image(image),
              ),
            );
          }));

      return doc.save();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _printKey,
      child: buildBill(context),
    );
  }

  final controller = ScreenshotController();
  Widget buildBill(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        leading: BackButton(
          onPressed: () {},
        ),
        title: Text("Invoice Detailes"),
      ),
      body: ClipPath(
          clipper: folderClipper(),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: EdgeInsets.only(top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(context),
                  PhysicalModel(
                    color: Colors.transparent,
                    elevation: 32,
                    shadowColor: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: content(context),
                    ),
                  ),
                  Expanded(child: SizedBox.shrink()),
                  Row(children: [
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          color: Colors.green[900],
                          child: TextButton.icon(
                            icon: Icon(Icons.picture_as_pdf),
                            onPressed: () {
                              _printScreen();
                            },
                            label: Text('Download PDF'),
                          )),
                    ),
                  ]),
                ],
              ))),
    );
  }

  Widget header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Invoice For',
                      style: Theme.of(context).textTheme.bodyText2),
                  Text(
                    '${billdata.userName}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Amount',
                      style: Theme.of(context).textTheme.bodyText2),
                  Text(
                    '${billdata.totalPrice}\$ ',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget content(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            color: Colors.green.shade100,
            height: 100,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(Icons.monetization_on, color: Colors.black45),
                Text(
                  'Invoice',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ),
        ClipPath(
          clipper: contentClipper(),
          child: Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(24.0),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.file_copy),
                    Text("Invoic Detailes",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.black45)),
                  ],
                ),
                infoContent(context),
                Container(
                  width: double.infinity,
                  height: .5,
                  color: Colors.black38,
                  margin: EdgeInsets.symmetric(vertical: 12),
                ),
                bodyContent(context),
                Container(
                  width: double.infinity,
                  height: .5,
                  color: Colors.black38,
                  margin: EdgeInsets.symmetric(vertical: 12),
                ),
                ContentSummry(context),
                Container(
                  width: double.infinity,
                  height: .5,
                  color: Colors.black38,
                  margin: EdgeInsets.symmetric(vertical: 12),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget infoContent(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Buisness Name",
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${billdata.businessName}",
                //style: Theme.of(context).textTheme.caption
              ),
            ],
          ),
        ),
        Container(
          width: .5,
          color: Colors.black45,
          height: 24,
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Invoice Date ",
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "${billdata.dateOfCreate}",
                  //style: Theme.of(context).textTheme.caption
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget bodyContent(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Items",
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              "quantity",
              style: Theme.of(context).textTheme.caption,
            ),
            Container(
              width: 100,
              child: Text(
                "Price",
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
        OrdersBuilder(context, billdata.orders!),
      ],
    );
  }

  Widget ContentSummry(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "SubTotal",
              style: Theme.of(context).textTheme.caption,
            ),
            Container(
              width: 100,
              child: Text(
                "\$${billdata.subTotal}",
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tax",
              style: Theme.of(context).textTheme.caption,
            ),
            Container(
              width: 100,
              child: Text(
                "\%${billdata.rateVat}",
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "TotalPrice",
              style: Theme.of(context).textTheme.caption,
            ),
            Container(
              width: 100,
              child: Text(
                "\$${billdata.totalPrice}",
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget OrdersBuilder(context, Orders orders) {
    return Column(
      children: [
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: orders.data!.length,
            itemBuilder: (context, index) =>
                oneItem(context, orders.data![index])),
      ],
    );
  }

  Widget oneItem(context, OrdersDatum ord) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${ord.product}",
          style: Theme.of(context).textTheme.caption,
        ),
        Text(
          "${ord.quantity}",
          style: Theme.of(context).textTheme.caption,
        ),
        Container(
          width: 100,
          child: Text(
            "\$${ord.priceOne}",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}
