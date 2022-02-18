import 'package:flutter/material.dart';


class ContactCard extends StatelessWidget {

  String name,number,mail;
  ContactCard(this.name,this.mail,this.number);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      height: 180.0,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Container(
            width: 100.0,
            margin: EdgeInsets.only(left: 20.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('profile.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.phone,),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        number,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.mail,),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        mail,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
