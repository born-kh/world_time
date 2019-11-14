import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime>  locations =[
    WorldTime(location: "London", flag: "united-kingdom.png", url: "Europe/London"),
    WorldTime(location: "Seoul", flag: "south-korea.png", url: "Asia/Seoul"),
    WorldTime(location: "Tokio", flag: "japan.png", url: "Asia/Tokyo"),
    WorldTime(location: "New York", flag: "united-states.png", url: "America/New_York"),
    WorldTime(location: "Moscow", flag: "russia.png", url: "Europe/Moscow"),
    WorldTime(location: "Pekin", flag: "china.png", url: "Asia/Pekin"),
    WorldTime(location: "Berlin", flag: "germany.png", url: "Europe/Berlin"),
    WorldTime(location: "Rio de Janeiro", flag: "brazil.png", url: "Asia/Jakarta"),
    WorldTime(location: "Paris", flag: "france.png", url: "Europe/Paris"),
    WorldTime(location: "Madrid", flag: "spain.png", url: "Europe/Madrid"),
];
  
  void updateTime(index) async {
    WorldTime instance =locations[index];
    await instance.getTime();
    Navigator.pop(context,  {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
    
  }
  

  @override
  void initState() {
    super.initState();

    print("initState function run");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){ updateTime(index);},
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            ),
          );
          }
      ),


    );
  }
}
