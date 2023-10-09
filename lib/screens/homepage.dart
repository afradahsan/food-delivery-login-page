import 'package:app/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/octicons_icons.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentSelectedIndex = 0;

List<String> RestName = ['Chicking', 'KFC', 'Kuttichira Biryani', 'Just Loaf', 'Effendi Shawarma', 'Al-Taza',       'Soofi Mandhi', 'Rijins Biryani' ,'Paragon','Sagar'];

  List<String> Location = ['Mavoor Rd, Kozhikode','RP Mall, Calicut', 'Gujarati St, Calicut', 
  'Corporation Rd, Calicut','Convent Rd, Calicut','Moonnalingal, Kozhikode', 'Convent Rd, Calicut' ,
  'Kuttichira, Kozhikode', 'Kannur Rd, Kozhikode', 'Mavoor Rd, Kozhikode'];

  List Images = [
    'assets/images/chicking fried chicken.webp',
    'assets/images/9410759d611db9c62c3acc23c1f27e06.webp',
    'assets/images/biryani.webp',
    'assets/images/beef.jpg',
    'assets/images/shawarma.webp',
    'assets/images/shawarma.webp',
    'assets/images/biryani.webp',
    'assets/images/biryani.webp',
    'assets/images/beef.jpg',
    'assets/images/beef.jpg'
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        selectedLabelStyle: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500),

        currentIndex: _currentSelectedIndex,
        onTap: (newIndex){
          setState(() {
            _currentSelectedIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Elusive.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Octicons.search), label: 'Search',),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
        ],

      ),
      appBar: AppBar(title: Text("Welcome, Afrad!", style: TextStyle(color: Colors.black, 
      fontFamily: 'Poppins', fontWeight: FontWeight.w500),),
      elevation: 0,
      actions: [
        Padding(child: ElevatedButton.icon(onPressed: (){
          showDialog(context: context, builder: (ctx)=>
          AlertDialog(title: Text('Alert'), content: Text('Are you sure you want to Sign Out?'),
          actions: [
            TextButton(onPressed: (){
              signout(context);
            }, child: Text('Yes')),

            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text('No'))
          ],));
        }, 
        icon: Icon(Icons.logout), label: Text("Sign Out"),       
        ), 
        padding: EdgeInsets.all(7.5)
        )
      ],
      backgroundColor: Color.fromARGB(255, 255, 255, 255),),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),

        //   child: Column(         
        //     children: [
        //     Text("What's Craving!??" ,style: TextStyle(fontFamily: 'Poppins', 
        //     fontWeight: FontWeight.w600, fontSize: 50 ,height: 1.2),),
        //     ],
        //   ),
        // ),

        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (ctx, index){
            return ListTile(
              title: Text(RestName[index], style: TextStyle(fontFamily: 'Poppins', fontSize: 20,
               fontWeight: FontWeight.w500),),
              subtitle: Text(Location[index], style: TextStyle(fontFamily: 'Poppins', fontSize: 14,
               fontWeight: FontWeight.w300)),
              
              leading:
              CircleAvatar(backgroundImage: AssetImage(
                Images[index], 
              ), radius: 30,),
              
              trailing: ElevatedButton.icon(onPressed: 
               (){}, icon: Icon(Icons.shopping_bag), label: Text(''),
               ),
            );
          }, 
          separatorBuilder: (ctx,index){
            return Divider();
          }, 
          itemCount: RestName.length
          ),
          //  children: [
          //   ListTile(
          //     title: Text('Chicking', style: TextStyle(fontFamily: 'Poppins', fontSize: 20,
          //     fontWeight: FontWeight.w500),),
          //     subtitle: Text('Mavoor Rd, Kozhikode' , style: TextStyle(fontFamily: 'Poppins', fontSize: 14,
          //     fontWeight: FontWeight.w300)),
          //     leading: CircleAvatar(backgroundImage: AssetImage('assets/images/chicking fried chicken.webp'),
          //     radius: 40,),
          //     trailing: Column(
          //       children: [
          //         ElevatedButton.icon(onPressed: 
          //     (){}, icon: Icon(Icons.shopping_bag), label: Text(''),
          //     style: ElevatedButton.styleFrom(),),
          //       ],
          //     ) 
          //     ),

          //     ListTile(
          //     title: Text('KFC' , style: TextStyle(fontFamily: 'Poppins', fontSize: 20,
          //     fontWeight: FontWeight.w500),),
          //     subtitle: Text('RP Mall, Kozhikode' , style: TextStyle(fontFamily: 'Poppins', fontSize: 14,
          //     fontWeight: FontWeight.w300)),
          //     leading: CircleAvatar(backgroundImage: AssetImage('assets/images/9410759d611db9c62c3acc23c1f27e06.webp'),
          //     radius: 40,),
          //     trailing: Column(
          //       children: [
          //         ElevatedButton.icon(onPressed: 
          //     (){}, icon: Icon(Icons.shopping_bag), label: Text(''),
          //     style: ElevatedButton.styleFrom(),),
          //       ],
          //     ) 
          //     ),

          // ],
        ),
        ),
    );
  } 

    signout(BuildContext ctx) async{
      final _sharedpref = await SharedPreferences.getInstance();
      await _sharedpref.clear();

    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => LoginPage()), (route) => false);
  }
}