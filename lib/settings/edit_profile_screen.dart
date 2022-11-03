import 'package:cheffy/Utils/dateFunction.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool maleSelected = true;
  DateTime _selectedDate = DateTime.now();
  TextEditingController dobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        children: [
          Text(
            'Full Name',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            textCapitalization: TextCapitalization.words,
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.blue,
              )),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade100,
                  style: BorderStyle.solid,
                ),
              ),
              hintText: 'Your good fullname..',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Email',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            style: TextStyle(fontSize: 15),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.blue,
              )),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade100,
                  style: BorderStyle.solid,
                ),
              ),
              hintText: 'Your email-id..',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 20),
          //Phone Number
          Text(
            'Phone Number',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            style: TextStyle(fontSize: 15),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.blue,
              )),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade100,
                  style: BorderStyle.solid,
                ),
              ),
              hintText: 'Your 10-digit phone number..',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            maxLength: 10,
          ),
          SizedBox(height: 20),
          //Occupation
          Text(
            'Occupation',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.blue,
              )),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade100,
                  style: BorderStyle.solid,
                ),
              ),
              hintText: 'What you do?',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 20),
          //Bio
          Text(
            'Bio',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            style: TextStyle(fontSize: 15),
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.blue,
              )),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade100,
                  style: BorderStyle.solid,
                ),
              ),
              hintText: 'About yourself..',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            maxLines: 3,
            minLines: 1,
          ),
          SizedBox(height: 20),

          //DOB
          Text(
            'Date of Birth',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            controller: dobController,
            readOnly: true,
            style: TextStyle(fontSize: 15),
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1901, 1),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  _selectedDate = pickedDate;
                  dobController.text = getFullDate(_selectedDate);
                });
              }
            },
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.blue,
              )),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade100,
                  style: BorderStyle.solid,
                ),
              ),
              hintText: 'When were you born?',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 20),

          //City
          Text(
            'City',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.blue,
              )),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade100,
                  style: BorderStyle.solid,
                ),
              ),
              hintText: 'You are living in..',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 20),

          //Gender
          Text(
            'Who are you',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: maleSelected ? Colors.blue : Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      maleSelected = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.male,
                          color: maleSelected ? Colors.blue : Colors.black,
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: maleSelected ? Colors.blue : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: maleSelected ? Colors.black : Colors.blue,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      maleSelected = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Icon(Icons.female,
                            color: maleSelected ? Colors.black : Colors.blue),
                        Text(
                          'Female',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: maleSelected ? Colors.black : Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
