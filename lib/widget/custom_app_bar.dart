import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget> ? actions;
  CustomAppBar({
    Key? key,
    this.title = "",
     this.leading,
    this.actions,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeSetting>(context);

    return AppBar(
      actions: actions,
      backgroundColor: Colors.transparent,
      
      leading: leading ?? InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.arrow_back_ios_new_rounded,
                 size: 20,color: Theme.of(context).iconTheme.color),
          )),
      //BackButton(color: Theme.of(context).primaryColor, onPressed: ()=> Navigator.pop(context),),
      title: Text(
        title,
       style: Theme.of(context).appBarTheme.titleTextStyle ,
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}
