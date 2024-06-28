import 'package:fluttercrud/model/User.dart';
import 'package:fluttercrud/services/userService.dart';
import 'package:flutter/material.dart';
// import 'package:path/path.dart';

class EditUser extends StatefulWidget {
  final User user;
  const EditUser({Key? key, required this.user}) : super(key : key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

  var _userNameController = TextEditingController();
  var _userContactController = TextEditingController();
  var _userDiscrptionController = TextEditingController();

  bool _validateName = false;
  bool _validateContact = false;
  bool _validateDiscrption = false;
  var _userService = UserService();

  @override
  void initState() {
    setState(() {
      _userNameController.text=widget.user.name??'';
      _userContactController.text=widget.user.contact??'';
      _userDiscrptionController.text=widget.user.discription??'';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQL Crud APP"),
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit New User',

              style: TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.w500,
              ),
              
            ),

            const SizedBox(
              height: 20.0,
            ),
            
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter Name',
                labelText: 'Name',
                errorText: 
                _validateName ? 'name value can\'t be empty' : null,
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            TextField(
              controller: _userContactController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter Number',
                labelText: 'Number',
                errorText: 
                _validateContact ? 'Number value can\'t be empty' : null,
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            TextField(
              controller: _userDiscrptionController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter Discrption',
                labelText: 'Discrption',
                errorText: 
                _validateContact ? 'Discrption value can\'t be empty' : null,
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(fontSize: 15)
                  ),

                  onPressed: () async {

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
                      _user.id=widget.user.id;
                      _user.name = _userNameController.text;
                      _user.contact = _userContactController.text;
                      _user.discription = _userDiscrptionController.text;
                      var result = await _userService.SaveUser(_user);
                      // Add the variyable 'result' in to a poup,  displaying the rsults

                      Navigator.pop(context, result);
                      
                    }                      

                  }, 
                  child: const Text('Update Details'),
                ),

                const SizedBox(
                  width: 10.0,
                ),

                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(fontSize: 15),
                  ),

                  onPressed: () {
                    _userNameController.text = '';
                    _userContactController.text = '';
                    _userDiscrptionController.text = '';
                  },
                    
                  child: const Text('Clear Details'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
