import 'package:fluttercrud/model/User.dart';
import 'package:fluttercrud/services/userService.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  var _userNameController = TextEditingController();
  var _userContactController = TextEditingController();
  var _userDiscrptionController = TextEditingController();

  bool _validateName = false;
  bool _validateContact = false;
  bool _validateDiscrption = false;
  var _userService = UserService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("SQL Crud APP"),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // User Name input feeld 
              const Text(
                'Add New User..',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.w400),
              ),

              const SizedBox(
                height: 20.0,
              ),

              // User name
              TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter the name',
                  labelText: 'Name',
                  errorText: 
                    _validateName ?  'Name Value can\'t be empty' : null,

                ),
              ),

              const SizedBox(
                height: 20.0,
              ),


              // User Number
              TextField(
                controller: _userContactController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Add Contact',
                  labelText: 'Conact',
                  errorText: 
                    _validateContact ? 'Contact Value can\'t be empty man' : null,
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),

              //Discrption Feeld 
              TextField(
                controller: _userDiscrptionController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Discrption',
                  labelText: 'Discrption',
                  errorText: 
                    _validateDiscrption ?  'Discrption Value can\'t be empty' : null,
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),

              // Braking a row for the contact button 
              Row(
                children: [
                  TextButton(
                    // Styling the button
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      textStyle: const TextStyle(fontSize: 15)
                    ), 

                    onPressed: () async{ 

                      // Validating the passed data Cheking is thefeelds arefilled or not 
                      setState(() {
                        _userNameController.text.isEmpty
                          ? _validateName = true
                          : _validateName = false;

                        _userContactController.text.isEmpty
                          ? _validateContact = true
                          : _validateContact = false;

                        _userDiscrptionController.text.isEmpty
                          ? _validateDiscrption = true
                          : _validateDiscrption = false;

                      });
                      
                      // if all the values are aded and the controller prameters are fales in all the feelds 
                      if (_validateName == false && 
                          _validateContact == false &&
                          _validateDiscrption == false) {

                        // print the data can be saaved 
                        var _user = User();
                        _user.name = _userNameController.text;
                        _user.contact = _userContactController.text;
                        _user.discription = _userDiscrptionController.text;

                        var result = await _userService.SaveUser(_user);

                        // Add the variyable 'result' in to a poup,  displaying the rsults
                        Navigator.pop(context, result);
                      }
                    },

                    child: const Text('Save Details')),
                  
                  const SizedBox (
                    width: 10.0,
                  ),

                  // Clear Button
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    
                    // Button Behavour
                    onPressed: () {
                      _userNameController.text = '';
                      _userContactController.text = '';
                      _userDiscrptionController.text = '';
                    },
                    
                    child: const Text('Clear Details'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}