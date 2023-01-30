import 'dart:convert';

import 'package:apps/appsClass.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Model/api_holder_detail.dart';

class Home_Page extends StatefulWidget {
  String appId;
  Home_Page({Key? key, required this.appId}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    dataShow();
    // TODO: implement initState
    super.initState();
  }

  ApiHolderDetail? ApiHolderObj1;
  dataShow() async {
    final res = await AppsClass().getData1(widget.appId);
    if (res != null) {
      print(res);
      print("=========>${widget.appId}");
      ApiHolderObj1 = ApiHolderDetail.fromJson(jsonDecode(res.data));
      // ApiHolderObj1 = ApiHolderDetail.fromJson(res!.data);
      print("sucesssssssss");
      print(ApiHolderObj1);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blueAccent,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(color: Colors.blueAccent),
                    )
                  ],
                )),
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: ApiHolderObj1 == null
            ? CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 8, top: 10, bottom: 15),
                child: ListView(
                  children: [
                    Text(
                      ApiHolderObj1!.results!.first.trackName!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            height: 140,
                            width: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(ApiHolderObj1!
                                        .results!.first.artworkUrl512
                                        .toString()))),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 18),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: Text(
                                    ApiHolderObj1!.results!.first.artistName!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.5),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.amber,
                                      child: Icon(Icons.star,
                                          size: 20, color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        ApiHolderObj1!
                                            .results!.first.averageUserRating!
                                            .toString()
                                            .substring(0, 3),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13)),
                                    SizedBox(
                                      width: 18,
                                    ),
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.greenAccent,
                                      child: Icon(Icons.person,
                                          size: 20, color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        ApiHolderObj1!.results!.first
                                            .contentAdvisoryRating!
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13))
                                  ],
                                ),
                                ElevatedButton(
                                    clipBehavior: Clip.antiAlias,
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    onPressed: () {
                                      // launchUrl(Uri.parse(ApiHolderObj1!
                                      //     .results!.first.trackViewUrl!));
                                      launchUrl(Uri.parse(
                                          'https://play.google.com/store/games?hl=en&gl=US'));
                                    },
                                    child: Text("Download"))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width / 2,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: ApiHolderObj1!
                            .results!.first.screenshotUrls!.length,
                        itemBuilder: (context, index) {
                          // print(
                          //     ">========>${ApiHolderObj1!.results!.first.screenshotUrls!.length}");
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Image.network(ApiHolderObj1!
                                  .results!.first.screenshotUrls![index]),
                            ),
                          );
                        },
                      ),
                    ),
                    Text("Discription: \n",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700)),
                    Text(
                      ApiHolderObj1!.results!.first.description!.toString(),
                      style: TextStyle(height: 1.2),
                    )
                  ],
                ),
              ));
  }
}
