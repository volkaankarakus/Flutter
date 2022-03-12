import 'package:bloc_list/UsersCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRegisterPage extends StatefulWidget {

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {

  var textFieldUserName = TextEditingController();
  var textFieldUserPhone = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Register'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 50,right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: textFieldUserName,
                decoration: InputDecoration(
                  hintText: "Username"
                ),
              ),

              TextField(
                controller: textFieldUserPhone,
                decoration: InputDecoration(
                    hintText: "User Phone Number"
                ),
              ),

            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended( //  extended -> both text and icon
        onPressed: (){
          BlocProvider.of<UsersCubit>(context).registerUsersAndTrigger(textFieldUserName.text, textFieldUserPhone.text);
        },
        tooltip: "Save User",
        icon: Icon(Icons.save),
        label: Text('Save'),
      ),

    );
  }
}
