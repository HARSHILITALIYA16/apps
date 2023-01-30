import 'package:apps/appsClass.dart';
import 'package:flutter/material.dart';
import 'Model/api_holder_paid.dart';
import 'generated/json/appsJson.dart';
import 'homePage.dart';

class Apps extends StatefulWidget {
  const Apps({super.key});

  @override
  State<Apps> createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  List name = ["Top Free", "Top Paid"];
  String selected = "Top Free";
  var abc;
  bool sel = true;
  var data;
  @override
  void initState() {
    dataShow();
    print("Paid Data Show");
    try{
      PaiddataShow();
    }
    catch(e){
      print(e);
    }
    // TODO: implement initState
    super.initState();
  }

  ApiHolder? ApiHolderObj;
  dataShow() async {
    final res = await AppsClass().getDataFree();
    if (res != null) {
      print(res);
      ApiHolderObj = ApiHolder.fromJson(res.data);
      print(ApiHolderObj);
    }
    setState(() {});
  }

  ApiHolderPaid? ApiHolderPaidObj;
  PaiddataShow() async {
    final res = await AppsClass().getDataPaid();
    if (res != null) {
      print(res);
      ApiHolderPaidObj = await ApiHolderPaid.fromJson(res.data);
      print(ApiHolderObj);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // print("======================>${ApiHolderPaidObj!.feed!.results!.length}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Apps"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          // physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Serch",
                  suffixIcon: Icon(Icons.mic),
                  prefixIcon: Icon(Icons.search_rounded),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.grey),
              child: Row(
                children: name
                    .map((e) => Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          child: InkWell(
                            onTap: () {
                              selected = e;
                              setState(() {});
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: selected == e ? Colors.white : null),
                              child: Center(child: Text(e)),
                            ),
                          ),
                        )))
                    .toList(),
              ),
            ),
            (ApiHolderObj == null)
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: selected == 'Top Free'
                        ? ApiHolderPaidObj!.feed!.results!.length
                        : ApiHolderObj!.feed!.results!.length - 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      // print(ApiHolderPaidObj!.feed!.results!.length);
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home_Page(
                                  appId: selected == 'Top Free'
                                      ? ApiHolderObj!.feed!.results![index].id!
                                      : ApiHolderPaidObj!
                                          .feed!.results![index].id!)));
                        },
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: Image.network(
                            selected == 'Top Free'
                                ? ApiHolderObj!
                                    .feed!.results![index].artworkUrl100
                                    .toString()
                                : ApiHolderPaidObj!
                                    .feed!.results![index].artworkUrl100
                                    .toString(),
                            loadingBuilder: (context, child, loadingProgress) {
                              return loadingProgress?.expectedTotalBytes != null
                                  ? Center(child: CircularProgressIndicator())
                                  : child;
                            },
                          ),
                        ),
                        title: Text(selected == 'Top Free'
                            ? ApiHolderObj!.feed!.results![index].name ?? ""
                            : ApiHolderPaidObj!.feed!.results![index].name ??
                                ""),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(selected == 'Top Free'
                                  ? ApiHolderObj!
                                      .feed!.results![index].artistName
                                      .toString()
                                  : ApiHolderPaidObj!
                                      .feed!.results![index].artistName
                                      .toString()),
                              Text(
                                "Entertainmen, Photos & Video, Social Networking",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.blueAccent),
                              )
                            ]),
                        trailing: Icon(Icons.arrow_circle_right),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
