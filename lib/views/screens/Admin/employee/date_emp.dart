import 'package:flutter/material.dart';
import 'package:rentapp22/views/screens/Admin/employee/info_employee.dart';

class DateList extends StatefulWidget {
  const DateList({Key? key}) : super(key: key);

  @override
  State<DateList> createState() => _DateListState();
}

class _DateListState extends State<DateList> {
  @override
  Widget build(BuildContext context) {
    List D1 = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: (DateData.isNotEmpty)
          ? Column(
              children: [
                ...DateData.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text(
                              "${e['day']} / ${e['month']} / ${e['year']}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                            Spacer(),
                            Text(
                              "${e['attendance']}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  "assets/images/no-data.png",
                  height: 70,
                )),
                Text("No Data Found...")
              ],
            ),
    );
  }
}
