import 'package:carousel_slider/carousel_slider.dart';
import 'package:cuk/dept_model/dept_model.dart';
import 'package:cuk/user_info/user_info.dart';
import 'package:flutter/material.dart';

class user_list extends StatefulWidget
{
  late user_list obj1;
  @override
  State<user_list> createState() => _user_listState();
}

class _user_listState extends State<user_list> {

  List<String> dept_names=["School of Engineering and Technology","School of physical and Chemical Sciences","School of Life Sciences","School of Social Sciences",

  "School of Education","School of languages","School of Media Studies","School of Legal Studies","School of Business Studies"


  ];

  List <Map<String,dynamic>> faculty=[
    //It
    {
      "name":"Afaq Alam",
        "phone":"9469054115",
      "dept":"it",
    },
    {
      "name":"Amjad Hussain",
      "phone":"23452112",
      "dept":"it",
    },
    {
      "name":"Zahoor Najar",
      "phone":"9419505159",
      "dept":"it",
    },
    {
      "name":"Sheikh Riyaz",
      "phone":"92939102",
      "dept":"it",
    },
    {
      "name":"Yash Paul",
      "phone":"9622603978",
      "dept":"it",
    },
    //Maths
    {
      "name":"Wali Mohammad Shah",
      "phone":"9419501164",
      "dept":"MAths",
    },
    {
      "name":"Dr Aftab Hussain Shah",
      "phone":"7006579471",
      "dept":"MAths",
    },

    {
      "name":"Ghulam Mohammad Sofi",
      "phone":"9906711572",
      "dept":"MAths",
    },

    {
      "name":"Shabbir Ahmad Ahanger",
      "phone":"9906966500",
      "dept":"Maths",
    },

    {
      "name":"Nitin Ambadas Katake",
      "phone":"9469133517",
      "dept":"MAths",
    },




  ];
  List<Map<String,dynamic>> _foundfaculty=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _foundfaculty=[];
  }
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty) {

      results = faculty;

    }
    else {
      results = faculty
          .where((user) => user['name'].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState((){
      _foundfaculty=results;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("CUK"),
      ),
      body:Container(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 400,
                  child: TextField(
                    autocorrect: false,
                    onChanged: (value)=>_runFilter(value),
                    decoration: InputDecoration(

                      label: Text("Enter Faculty name"),
                      border: OutlineInputBorder(

                      )
                    ),

                  )),
              SizedBox(height: 20,),
              Container(
                height: 80,
                child: _foundfaculty.isNotEmpty
                    ? ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) => Card(
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: InkWell(
                      onTap: ()
                      {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>user_info(obj: _foundfaculty[index])));
                      },

                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                        ),
                        title: Text(_foundfaculty[index]['name']),
                        subtitle: Text('${_foundfaculty[index]["phone"]}'),
                      ),
                    ),
                  ),
                )
                    : const Text(
                  'No results found Please try with diffrent search',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              CarouselSlider(items: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 200,
                      child: Image.asset("assets/images/nep.jpeg",)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 200,
                      child: Image.asset("assets/images/cuetlogo.jpeg",)
                  ),
                ),



              ], options: CarouselOptions(

                autoPlayInterval: Duration(seconds: 3),
                autoPlay: true,


              )),
              SizedBox(height: 45,),
              Container(
                
                child: Expanded(
                  child: GridView.builder(
                      itemCount: dept_names.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                    crossAxisCount: 2,
                  ), itemBuilder: (context,index)=>
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          width: 150,
                          height: 280,
                          child: Card(
                            shadowColor: Colors.grey.shade500,
                            elevation: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset("assets/images/cuklo.png"),
                                ),


                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text(dept_names[index],style: TextStyle(fontWeight: FontWeight.bold),)),
                                ),
                                Divider(
                                  thickness: 2,

                                ),

                                  InkWell(



                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>dept_model()));
                                      },child: Text("View All",style: TextStyle(color: Colors.blueAccent),))

                              ],






                            )


                          ),
                        ),
                      ),




                  ),
                ),
              ),

            ],
          ),
        ) ,
      ) ,
    );
  }
}