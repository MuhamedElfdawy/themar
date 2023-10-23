import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:themar/features/get_cities/model.dart';

class CitiesSheet extends StatefulWidget {
  const CitiesSheet({super.key});

  @override
  State<CitiesSheet> createState() => _CitiesSheetState();
}

class _CitiesSheetState extends State<CitiesSheet> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = true;
  late CitiesData model;
  void getData()async{
    final response = await Dio().get('https://thimar.amr.aait-d.com/api/cities/1');
    model = CitiesData.fromJson(response.data);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('اختر مدينتك',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
          textAlign: TextAlign.center,),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            child:isLoading ? Center(child: CircularProgressIndicator(),
            ) : ListView.builder(
              itemBuilder: (context, index) => _ItemCity(model: model.list[index]),
              itemCount: model.list.length,
            ),
          ),
        ),
      ],
    );
  }
}


class _ItemCity extends StatelessWidget {
  final CityModel model;
  const _ItemCity({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context,model.name);
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        child: Text(
          model.name,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor.withOpacity(0.7)),
        ),
      ),
    );
  }
}