import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:rentapp22/views/screens/Doctor/order/installationpage.dart';
import 'package:signature/signature.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:developer';
import 'dart:typed_data';

import '../../../../globals.dart';
import 'order_controller.dart';

class ArggermentPage extends StatefulWidget {
  const ArggermentPage({super.key});

  @override
  State<ArggermentPage> createState() => _ArggermentPageState();
}

class _ArggermentPageState extends State<ArggermentPage> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red,
    exportBackgroundColor: Colors.transparent,
    exportPenColor: Colors.black,
    onDrawStart: () => log('onDrawStart called!'),
    onDrawEnd: () => log('onDrawEnd called!'),
  );
  OrderController orderController = Get.find<OrderController>();
  final pdf = pw.Document();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => log('Value changed'));

    // makePDF();
  }

  Uint8List? data1;

  @override
  void dispose() {
    // IMPORTANT to dispose of the controller
    _controller.dispose();
    super.dispose();
  }

  Future<void> exportImage(BuildContext context) async {
    if (_controller.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          key: Key('snackbarPNG'),
          content: Text('No content'),
        ),
      );
      return;
    }

    data1 = await _controller.toPngBytes(height: 1000, width: 1000);
    if (data1 == null) {
      return;
    }

    if (!mounted) return;

    await push(
      context,
      Scaffold(
        appBar: AppBar(
          title: const Text('PNG Image'),
        ),
        body: Center(
          child: Container(
            color: Colors.grey[300],
            child: (data1 == null) ? Container() : Image.memory(data1!),
          ),
        ),
      ),
    );
  }

  Future<void> exportSVG(BuildContext context) async {
    if (_controller.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          key: Key('snackbarSVG'),
          content: Text('No content'),
        ),
      );
      return;
    }

    final SvgPicture data = _controller.toSVG()!;

    if (!mounted) return;

    await push(
      context,
      Scaffold(
        appBar: AppBar(
          title: const Text('SVG Image'),
        ),
        body: Center(
          child: Container(
            color: Colors.grey[300],
            child: data,
          ),
        ),
      ),
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Agreement for Printers on Hire",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "THIS AGREEMENT (the “Agreement”) is made as on between\nM/s UD SERVICES , Herein after referred to as ‘’M/s UD SERVICES” withs its official address at K-201 Rajhans Apple Palanpur Jakatnaka Surat\nAnd\nKASTURBA VAIDYAKIYA RAHAT MANDAL(KASTURBA HOSPITAL)\nLALA LAJPATRAI ROAD, MOTA TAIWAD VALSAD\nGUJARAT-396001",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Section 01- Scope of UD SERVICES",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "1.Scope of ’M/s UD SERVICES shall be to supply printer.\n2.Supply of Ink.\n3.Supply of A2 PVC white film,Matt.,Glossy Paper and 260gsm RC paper.\n2. UD SERVICES shall make sure that machines are up & running and will do whatever required for uninterrupted printing.",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Section 02- Scope of UD Client",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "1.Client should provide the proper place with power connection for printer.\n2.Client should have moisture free storage for photo paper\n3.Insurance has to be taken care from customer’s end.",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Section 03- Commercial Term of Contract",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Contract is from INSTALLATION   for a period of 22 months, on agreed terms and conditions on renewal.\nCommercials: Per print or Print counts.\nRs.16/ Per print FOR A2\nRs.32/ Per print FOR A3\nRS 2200 INSTALLATION CHARGE PER PRINTER\nTaxes , as applicable,extra.",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Section 02- Standard of performance",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  ". WO/PO in the name of “UD SERVICES’’\n.Payment to be made in name of “UD SERVICES’’\n.Bills will be raised on monthly basis at the end of the month.\n.Payment within 30 days of bill submission.",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Section 02- Ownership of Materials",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "The printers and Dicom softwares keys  provided, with ownership of M/s UD SERVICES and have reserved the right to use the printers and software’s  at customers site.\nM/S UD Services own the Capex of Printer and Software at Clients Premises.\nHospital should take care of the Assets in their premises installed by M/s UD SERVICES and shall be liable to pay against any loss, damage of any kind to assets, will be billed as per the market price.\nUD SERVICES will be taking care of the all maintenance and consumable for the assest installed by company, hence by providing the hazel free operation.\nFor Assets (PRINTER AND SOFTWARES KEYS)     provide by M/s UD SERVICES , if any loss, damage of any kind to assets, will be billed per the market price.",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Section 06-Termination",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Both the parties to the contract shall have the right to terminate this Agreement before the Completion Date by giving one month’s prior written notice to the others party for 22 day.",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),

            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  "Signature",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Signature(
              key: const Key('signature'),
              controller: _controller,
              height: 300,
              backgroundColor: Colors.grey[300]!,
            ),
            //OK AND CLEAR BUTTONS

            Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  //SHOW EXPORTED IMAGE IN NEW ROUTE
                  // IconButton(
                  //   key: const Key('exportPNG'),
                  //   icon: const Icon(Icons.image),
                  //   color: Colors.blue,
                  //   onPressed: () => exportImage(context),
                  //   tooltip: 'Export Image',
                  // ),
                  // IconButton(
                  //   key: const Key('exportSVG'),
                  //   icon: const Icon(Icons.share),
                  //   color: Colors.blue,
                  //   onPressed: () => exportSVG(context),
                  //   tooltip: 'Export SVG',
                  // ),
                  IconButton(
                    icon: const Icon(Icons.undo),
                    color: Colors.blue,
                    onPressed: () {
                      setState(() => _controller.undo());
                    },
                    tooltip: 'Undo',
                  ),
                  IconButton(
                    icon: const Icon(Icons.redo),
                    color: Colors.blue,
                    onPressed: () {
                      setState(() => _controller.redo());
                    },
                    tooltip: 'Redo',
                  ),
                  //CLEAR CANVAS
                  IconButton(
                    key: const Key('clear'),
                    icon: const Icon(Icons.clear),
                    color: Colors.blue,
                    onPressed: () {
                      setState(() => _controller.clear());
                    },
                    tooltip: 'Clear',
                  ),
                  // STOP Edit
                  // IconButton(
                  //   key: const Key('stop'),
                  //   icon: Icon(
                  //     _controller.disabled ? Icons.pause : Icons.play_arrow,
                  //   ),
                  //   color: Colors.blue,
                  //   onPressed: () {
                  //     setState(() => _controller.disabled = !_controller.disabled);
                  //   },
                  //   tooltip: _controller.disabled ? 'Pause' : 'Play',
                  // ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      data1 = await _controller.toPngBytes(
                          height: 1000, width: 1000);

                      if (data1 != null) {
                        File k = File.fromRawPath(data1!);

                        String imagename = k.path.split("/").last;

                        setState(() {});
                        
                        orderController.orderData.value.addAll({
                          'Payment_Type': 'Pending',
                          'Payment_Transfer_Name': 'Bank',
                          'Agreement': 'Ture',
                          'Signature': data1,
                          'ImageName': "Udsevice1" 
                        });
                        print(imagename);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InstallationPage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Signture is rquired..."),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Confirm Data",
                      style: TextStyle(fontSize: 22),
                    ))),
          ],
        ),
      ),
    );
  }
}
