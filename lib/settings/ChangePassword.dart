import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool hide1 = true, hide2 = true, hide3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Change password',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            'Old Password',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            // keyboardType: TextInputType.phone,

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
              hintText: 'Enter your password',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  size: 20,
                ),
                onPressed: () {
                  hide1 = !hide1;
                  setState(() {});
                },
              ),
            ),
            obscureText: hide1,
          ),
          SizedBox(height: 25),
          Text(
            'New Password',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            // keyboardType: TextInputType.phone,
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
              hintText: 'Enter your password',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  size: 20,
                ),
                onPressed: () {
                  hide2 = !hide2;
                  setState(() {});
                },
              ),
            ),
            obscureText: hide2,
          ),
          SizedBox(height: 25),
          Text(
            'Confirm new password',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            // keyboardType: TextInputType.phone,
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
              hintText: 'Enter your password',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  size: 20,
                ),
                onPressed: () {
                  hide3 = !hide3;
                  setState(() {});
                },
              ),
            ),
            obscureText: hide3,
          ),
          SizedBox(height: 5),
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Reset password',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              )),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {},
            child: Text(
              'Update',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
