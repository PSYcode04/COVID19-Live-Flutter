import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';


class VaccineList {
  final List<VaccineData> vaccineList;

  VaccineList({this.vaccineList});

  factory VaccineList.fromJson(List<dynamic> parsedJson){
    List<VaccineData>dataList = parsedJson.map((i) => VaccineData.fromJson(i)).toList();
    return VaccineList(
      vaccineList: dataList,
    );
  }
}

class VaccineData {
  final String country;
  final String isoCode;
  final List<Data> data;

  VaccineData({this.country, this.isoCode, this.data});

  factory VaccineData.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();
    return VaccineData(
      country: parsedJson['country'],
      isoCode: parsedJson['iso_code'],
      data: dataList,
    );
  }
}

class Data{
  String date;
  int totalVaccinations;
  int peopleVaccinated;
  int dailyVaccinations;
  int peopleFullyVaccinated;

  Data(
      {this.date,
        this.totalVaccinations,
        this.peopleVaccinated,
        this.dailyVaccinations,
        this.peopleFullyVaccinated});

  factory Data.fromJson(Map<String, dynamic> json){
    return new Data(
      date: json['date'],
      totalVaccinations: json['total_vaccinations'],
      peopleVaccinated: json['people_vaccinated'],
      peopleFullyVaccinated: json['people_fully_vaccinated'],
      dailyVaccinations: json['daily_vaccinations'],
    );
  }
}

Future<VaccineList> fetchVaccine()async{
  final response =
  await http.get('https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.json');


  if(response.statusCode == 200){
    return VaccineList.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Fail to load data");
  }
}

class VaccineProvider with ChangeNotifier {
  VaccineList _vaccineList;
  int _totalVaccine;
  String _latestDate;
  int _totalFullyVaccinated;
  int _dailyVaccinated;


  void fetchVaccine() async {
    final response =
    await http.get(
        'https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.json');

    if (response.statusCode == 200) {
      _vaccineList = VaccineList.fromJson(jsonDecode(response.body));
      notifyListeners();
      // return _vaccineList;
    }
    else {
      throw Exception("Fail to load data");
    }


  }

  void setData(){
    int totalVacc = 0;
    int fullyVacc = 0;
    int dailyVacc = 0;

    // 가장 최근 날짜 설정
    for(int i = 0; i < _vaccineList.vaccineList.length; i++) {
      if(_vaccineList.vaccineList[i].isoCode == "KOR")
        _latestDate = _vaccineList.vaccineList[i].data.last.date;
    }

    // Total Vacc.
    for(int i = 0; i < _vaccineList.vaccineList.length; i++) {
      if(_vaccineList.vaccineList[i].data.last.totalVaccinations != null) {
        totalVacc += _vaccineList.vaccineList[i].data.last.totalVaccinations;
      }
      else if(_vaccineList.vaccineList[i].data.last.peopleVaccinated != null) {
        totalVacc += _vaccineList.vaccineList[i].data.last.peopleVaccinated;
      }
      else if(_vaccineList.vaccineList[i].data.last.peopleFullyVaccinated != null) {
        totalVacc += _vaccineList.vaccineList[i].data.last.peopleFullyVaccinated;
      }
    }
    _totalVaccine = totalVacc;

    // Total Fully Vacc.
    for(int i = 0; i < _vaccineList.vaccineList.length; i++) {
      if(_vaccineList.vaccineList[i].data.last.peopleFullyVaccinated != null) {
        fullyVacc += _vaccineList.vaccineList[i].data.last.peopleFullyVaccinated;
      }
      else if(_vaccineList.vaccineList[i].data.reversed.elementAt(0).peopleFullyVaccinated != null) {
        fullyVacc += _vaccineList.vaccineList[i].data.reversed.elementAt(0).peopleFullyVaccinated;
      }


    }
    _totalFullyVaccinated = fullyVacc;

    // Daily Vacc.
    for(int i = 0; i < _vaccineList.vaccineList.length; i++) {
      if(_vaccineList.vaccineList[i].data.last.dailyVaccinations != null) {
        dailyVacc += _vaccineList.vaccineList[i].data.last.dailyVaccinations;
      }
    }
    _dailyVaccinated = dailyVacc;

  // notifyListeners();

  }

}


class Vaccine extends StatelessWidget {
  final Map<String, String> arguments;
  // VaccineMain(this.arguments);
  Vaccine(this.arguments);
  // final Future<VaccineList> futureVaccine = fetchVaccine();
  final String pageName = "Vaccine Page";

  @override
  Widget build(BuildContext context) {
    VaccineProvider provider = Provider.of<VaccineProvider>(context);
    provider.fetchVaccine();
    provider.setData();

    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Container(
                // margin: EdgeInsets.only(left:30, right: 30),
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.only(left:30, right: 30),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column (
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Vacc.', textAlign: TextAlign.left),
                              Text('Parsed latest date', textAlign: TextAlign.right),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${provider._totalVaccine} people', textAlign: TextAlign.left),
                              Text('${provider._latestDate}', textAlign: TextAlign.right),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total fully Vacc.', textAlign: TextAlign.left),
                              Text('Daily Vacc.', textAlign: TextAlign.right),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${provider._totalFullyVaccinated} people', textAlign: TextAlign.left),
                              Text('${provider._dailyVaccinated} people', textAlign: TextAlign.right),
                            ],
                          ),
                        ),
                      ]
                  )
              ),
            ]
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
              context,
              '/navigation',
              arguments: {
                "user-id" : arguments["user-id"],
                "page-name" : pageName,
              });
        },
        tooltip: 'Back',
        child: Icon(Icons.list),
      ),
    );

  }

}