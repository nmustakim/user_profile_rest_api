import 'package:flutter/material.dart';
import 'package:users_profile_rest_api/const.dart';
import 'package:users_profile_rest_api/views/profile_screen.dart';
import 'package:users_profile_rest_api/views/widgets/profile_tile.dart';
import '../models/user.dart';
import '../remote_services/remote_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

TextEditingController searchController = TextEditingController();
  List<User?>? usersList = [];
  List<User?>? searchList = [];
  bool isLoaded = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

 void getData() async {
    usersList = await RemoteService().getUsersList();
    if (usersList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }
  void runFilter(String enteredString) {
    if (enteredString.isEmpty) {
      setState(() {
        searchList = usersList!;
      });
    } else {
      setState(() {
        searchList = usersList!
            .where((element) => element!.name
            .toLowerCase()
            .contains(enteredString.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text("Users",style: titleTextStyle1,),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.lightGreen,
        ),
        body: SafeArea(
          child: Visibility(
            visible: isLoaded,
            replacement: const Center(child: CircularProgressIndicator()),
            child: Stack(
            children: [
            Container(
              color: Colors.lightGreen,
              height: 150,


              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(24),
                      height: 41,
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (v) => runFilter(v),
                        controller: searchController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () => runFilter(searchController.text),
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      )),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            searchController.text.isNotEmpty && searchList!.isEmpty ? const Center(child: Text("No user found"),):
                searchList!.isNotEmpty?
            Container(
              margin: const EdgeInsets.only(top: 120),
              padding: const EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height/1.1,
              decoration: const BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))),
              child:ListView.builder(
                  itemCount: searchList!.length,
                  itemBuilder: (context, index) {
                    User user = searchList![index]!;
                    return ProfileTile(text: user.name, icon: const Icon(Icons.navigate_next,), press: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen(user: user)));  },
                    );
                  }),
            ):usersList!.isEmpty? const Center(child: Text("No users here"),):
                Container(
                  margin: const EdgeInsets.only(top: 120),
                  padding: const EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height/1.1,
                  decoration: const BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))),
                  child:ListView.builder(
                      itemCount: usersList!.length,
                      itemBuilder: (context, index) {
                        User user = usersList![index]!;
                        return ProfileTile(text: user.name, icon: const Icon(Icons.navigate_next,), press: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen(user: user)));  },
                        );
                      }),
                )
  ]
          )
          ),
        )
    );
  }
}
