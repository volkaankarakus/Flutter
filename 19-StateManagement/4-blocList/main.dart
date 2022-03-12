import 'package:bloc_list/UsersCubit.dart';
import 'package:bloc_list/UsersDaoRepository.dart';
import 'package:bloc_list/UsersState.dart';
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
                          children: [
                            Text("${user.userName} - ${user.userPhone}"),
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



    );
  }
}
