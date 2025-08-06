import 'package:flutter/material.dart';
import 'package:frontend/View/Dashboard/Main/Components/background.dart';
import 'package:frontend/Core/Common/Widgets/custom_headin_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomHeadingText(title: '@Arslan Posts'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Card(child: Text('this is the title')),
                subtitle: Text('this is the subtitle of the post'),
                trailing: Container(
                  child: Column(
                    children: [Icon(Icons.edit), Icon(Icons.delete)],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
