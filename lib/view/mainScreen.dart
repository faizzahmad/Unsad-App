import 'package:first/controller/fetchMeme.dart';
import 'package:first/controller/saveMyData.dart';
import 'package:flutter/material.dart';


class mainScreen extends StatefulWidget {
   mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {

  String imageUrl = "";
  int ? memeNo;
  bool isLoading = true;
  int targetMeme = 100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetInitMeme();
    updateImage();
  }
  void updateImage() async{
    String newUrl = await Fetchmeme.fetchNewMeme();
    setState(() {
      imageUrl = newUrl;
      isLoading = false;
    });
  }

  GetInitMeme() async {
    memeNo = await Savemydata.fetchData() ?? 0;
    if(memeNo!>100){
      targetMeme = 500;
    }else if(memeNo! > 500){
      targetMeme = 1000;
    }
    setState(() {
     
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 80),
        Text("Meme ${memeNo.toString()}", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),  ),
        SizedBox(height: 10),
        Text("Target ${targetMeme} memens", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
          SizedBox(height: 20),
          isLoading ? Container(
             height: 400,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
                
              ),
            ),
          ) :
          Image.network(
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitHeight,
            imageUrl),
          SizedBox(height: 30),
        ElevatedButton(
          onPressed: () async{
            isLoading = true;
            await Savemydata.saveData(memeNo! + 1);
            GetInitMeme();
            updateImage();
          }, child: Container(
          width: 140,
          height: 50,
          child: Center(child: Text("More Fun", style: TextStyle(fontSize : 18, fontWeight: FontWeight.w500),))
          ), 
          ),

          Spacer(),
          Text("App Created By".toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
          Text("Faiz Ahmad".toUpperCase(),style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
          SizedBox(height: 20),
      ],
    ),
    );
  }
}