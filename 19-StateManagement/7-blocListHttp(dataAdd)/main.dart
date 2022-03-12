import 'package:bloc_list/UserRegisterPage.dart';
import 'package:bloc_list/UsersCubit.dart';
import 'package:bloc_list/UsersDaoRepository.dart';
import 'package:bloc_list/UsersState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsersCubit(UsersDaoRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Homepage(),
      ),
    );
  }
}

class Homepage extends StatefulWidget{
  @override
  _Homepage createState() => _Homepage();
}



class _Homepage extends State<Homepage> {

  @override
  void initState() {
    super.initState();
    context.read<UsersCubit>().getUsersAndTrigger();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: BlocBuilder<UsersCubit,UsersState>(
        builder: (context,userState){

          if(userState is UsersLoadedClass){
            var userList = userState.userList;

            return ListView.builder(
              itemCount: userList.length,
                itemBuilder: (context,index){
                  var user = userList[index];

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${user.userName} - ${user.userPhone}"),
                            IconButton(onPressed: (){
                              context.read<UsersCubit>().deleteUsersAndTrigger(int.parse(user.userID));

                            },
                                icon: Icon(Icons.delete,color:Colors.black54,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            );

          }else{
            return Center(); // if error happened, it shows empty screen.
          }

        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegisterPage()));
        },
        tooltip: "Add User",
        child: Icon(Icons.add),
      ),

    );
  }
}
