import 'package:flutter/material.dart';
import 'package:foodorderapp/help/Style.dart';
import 'package:sizer/sizer.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;


  const MenuItem({Key key, this.title, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: InkWell(
          onTap: (){
            print("side menu");
          },
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 30,),
              SizedBox(width: 16),
              Expanded(child: Text(title, style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                fontFamily: 'mont'
              ),))
            ],
          ),
        ),

    );

  }
}


class MenuItemButton extends StatelessWidget {
  const MenuItemButton({this.icon,this.title}) ;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: RaisedButton.icon(
        color: white,
          onPressed: (){},
          icon: Icon(icon,color: red,size: 30,),
          label: Text(title,
          style: TextStyle(
            color: red,
            fontSize: 16,
              fontFamily: 'mont'
          ),))


    );
  }
}
