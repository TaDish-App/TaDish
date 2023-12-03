import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadish/features/user/domain/user_collection.dart';
import 'package:tadish/features/user/presentation/edit_user_controller.dart';
import '../../common/drawer_view.dart';
import '../domain/user.dart';
import 'friends_list_row.dart';
import '../../user_all_provider.dart';
import '../../tadish_error.dart';
import '../../tadish_loading.dart';
import 'form-fields/single_line_text_field.dart';
import '../../common/form-fields/submit_button.dart';

final addFriendProvider = StateProvider<String>((ref) => '');

class FriendsListView extends ConsumerWidget {

  static const routeName = '/friendslist';
  final _formKey = GlobalKey<FormBuilderState>();
  final _addFriendFieldKey = GlobalKey<FormBuilderFieldState>();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<UserAll> asyncUserAll = ref.watch(userAllProvider);
    return asyncUserAll.when(data: (userALl) {
      return _build(context: context, userID: userALl.currentUserID, users: userALl.user, ref: ref);
    }, loading: () {
      print("loading");
      return const TadishLoading();
    }, error: (error, stacktrace) {
      print("error");
      print(error.toString());
      return TadishError(error.toString(), stacktrace.toString());
    });
  }
  
  Widget _build(
    {
      required BuildContext context, 
      required List<User> users,
      required String userID,
      required WidgetRef ref
    }) {
    final String currentUserID = userID;
    final UserCollection userDB = UserCollection(users);
    final User currentUser = userDB.getUser(currentUserID);
    final List<User?> friendsList = userDB.getFriends(currentUserID);
    
    void onSubmit() {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      if (!isValid) return;
    
      String addFriend = _addFriendFieldKey.currentState?.value;
      List<String> friendslistID = List.from(currentUser.friendsIDList); // Create a new list
    
      if (friendslistID.contains(addFriend)) {
        ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Person is already a friend'),
                  duration: Duration(seconds: 2), // Adjust the duration as needed
                ),
              );
        return;
      }
    
      List<String> allUsersID = userDB.getAllEmails();
    
      if (!allUsersID.contains(addFriend)) {
        ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Email does not exist'),
                  duration: Duration(seconds: 2), // Adjust the duration as needed
                ),
              );
        return;
      }
    
      friendslistID.add(addFriend);
    
      User newUser = User(
        id: currentUser.id,
        name: currentUser.name,
        username: currentUser.username,
        email: currentUser.email,
        tastePreference: currentUser.tastePreference,
        friendsIDList: friendslistID,
        savedDishesID: currentUser.savedDishesID,
        geolocation: currentUser.geolocation,
        role: currentUser.role,
        gender: currentUser.gender,
        age: currentUser.age,
        ethnicity: currentUser.ethnicity,
        createdOn: currentUser.createdOn,
        updatedOn: DateTime.now(),
        isActive: currentUser.isActive,
        taggedDishes: currentUser.taggedDishes
      );
      ref.read(editUserControllerProvider.notifier).updateUser(
            updatedUser: newUser,
            // TODO send old rating info e.g. star to help with avg calculations
            onSuccess: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('User updated successfully!'),
                  duration: Duration(seconds: 2), // Adjust the duration as needed
                ),
              );
            },
          );
}

    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('Friends List'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              FriendsListRow(name: currentUser.name, email: currentUser.email, tastePreference: currentUser.tastePreference, icon: const Icon(Icons.person)),
              const SizedBox(
                height: 5,
              ),
              Row(
              children: [
                Container(
                  width: 200, // or any other finite width
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SingleLineTextField(
                          name: "Dish Name",
                          hint: "Enter the dish name",
                          fieldKey: _addFriendFieldKey,
                        ),
                      ],
                    ),
                  ),
                ),
                SubmitButton(
                  onSubmit: onSubmit,
                  submissionText: "add friend",
                ),
              ],
            ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  friendsList.isEmpty
                      ? Container(
                    alignment: Alignment.center,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('No friends'),
                      ],
                    ),
                  )
                      : Container(
                      height: 200,
                      child: ListView(
                        children: friendsList.map((friend) =>
                            FriendsListRow(name: friend!.name, email: friend.email, tastePreference: friend.tastePreference,  icon: const Icon(Icons.person_outline)),
                        ).toList(),
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

