import 'package:bloc_list/UsersDaoRepository.dart';
import 'package:bloc_list/UsersState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState>{
  UsersRepository usersRepository;
  UsersCubit(this.usersRepository):super(UsersStartClass());
  
  Future<void> getUsersAndTrigger() async{
    try{
      emit(UsersLoadingClass());

      var userListResponse = await usersRepository.getUsers();
      emit(UsersLoadedClass(userListResponse));
      
    }catch(e){
      emit(UsersErrorClass('Error happened when getting users data'));
    }
    
    
  }

}