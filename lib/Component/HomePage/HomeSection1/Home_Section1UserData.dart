import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local24/Constant/App_Constant.dart';


class HomeSection1UserData extends StatelessWidget {
  const HomeSection1UserData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  'New Restaurant open in Town',
                  style: postTitle,
                ),
              ),
              // FaIcon(
              //   FontAwesomeIcons.ellipsis,
              //   color: Colors.grey,
              // )
              PopupMenuButton(
                  icon: FaIcon(FontAwesomeIcons.ellipsis,color: Colors.grey,),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      child: ListTile(
                        // leading: Icon(Icons.add),
                        title: Text('Save',style: menuItems,),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        // leading: Icon(Icons.anchor),
                        title: Text('Report',style: menuItems,),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        // leading: Icon(Icons.anchor),
                        title: Text('Share',style: menuItems,),
                      ),
                    ),

                  ]
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                    )
                  // child: Image.network('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'local360',
                          style: postUserName,
                        ),
                        Container(
                          child: Image.asset(
                            verified,
                            width: size.width * 0.04,
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: size.width * 0.7,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New Delhi',
                            style: postDetail,
                          ),
                          Text(
                            '5 hour ago',
                            style: postDetail,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
