import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/Screen/Modal/homeModel.dart';

import '../Provider/savedLocationProvider.dart';

class SavedLocation extends StatelessWidget {
  HomeModel hm;

  SavedLocation({super.key, required this.hm});

  @override
  Widget build(BuildContext context) {
    SavedLocationProvider savedLocationProviderFalse =
        Provider.of<SavedLocationProvider>(context, listen: false);
    SavedLocationProvider savedLocationProviderTrue =
        Provider.of<SavedLocationProvider>(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text('Saved Location'),
          actions: [
            IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
            IconButton(icon: const Icon(Icons.add), onPressed: () {})
          ],
        ),
        body: Consumer<SavedLocationProvider>(
          builder: (BuildContext context, SavedLocationProvider value, Widget? child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    savedLocationProviderTrue.savedWeatherList.length,
                        (index) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: height * 0.128 ,
                                margin: EdgeInsets.symmetric(vertical: 10,horizontal: width * 0.02),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: (savedLocationProviderTrue.savedList[index]['5'] == '1')
                                            ?[
                                          Color(0xff0d5cc5),
                                          Color(0xff439cf3),
                                        ]
                                            : [
                                          Color(0xff19043D),
                                          Color(0xff341152),
                                        ]
                                    )),
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          savedLocationProviderTrue.savedList[index]['0'],
                                          style: TextStyle(color: Colors.white,fontSize: width * 0.05,fontWeight:FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        ' (${savedLocationProviderTrue.savedList[index]['6']} ~ ${savedLocationProviderTrue.savedList[index]['7']}°C)',
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    '${savedLocationProviderTrue.savedList[index]['3']} ',
                                    style: const TextStyle(color: Colors.white70),
                                  ),
                                  trailing: Text('${savedLocationProviderTrue.savedList[index]['4']}°C'
                                    ,style: TextStyle(color: Colors.white,fontSize: width * 0.055),),
                                ),
                              ),
                            ),
                            GestureDetector(onTap: (){
                              savedLocationProviderFalse.removeFromSaved(index);
                            },child: Icon(Icons.delete,color: Colors.black54,))
                          ],
                        ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
