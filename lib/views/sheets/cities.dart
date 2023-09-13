import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project1/models/cities.dart';

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
  late GetCitiesData model;

  void getData() async {
    final response = await Dio().get(
      "https://thimar.amr.aait-d.com/api/cities/1",
    );
    print(response.data);
    model = GetCitiesData.fromJson(response.data);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Text("اخنر مدينتك",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Theme.of(context).primaryColor,),),
          isLoading
              ? const Expanded(
                child: Center(
            child: CircularProgressIndicator(),
          ),
              )
              : Expanded(
                child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) => _ItemCity(
                model: model.list[index],
            ),
            itemCount: model.list.length,
          ),
              ),
        ],
      ),
    );
  }
}

class _ItemCity extends StatelessWidget {
  final CityModel model;
  const _ItemCity({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context,model);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsetsDirectional.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Theme.of(context).primaryColor.withOpacity(.1),
        ),
        child: Center(child: Text(model.name,),),
      ),
    );
  }
}
