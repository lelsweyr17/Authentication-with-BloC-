import 'package:flutter/material.dart';
import 'package:test_app_surf/users/UI/curcilarLoadingIndicatior/indicator.dart';
import 'package:test_app_surf/users/UI/loadingErrorPage/LoadingErrorPage.dart';
import 'package:test_app_surf/users/UI/userPage/listOfUsersData/User.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //TODO: floating alignment of title(from bottomLeft to Center)
            // backgroundColor: Colors.amber,
            expandedHeight: 120.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                title: Text('Пользователи',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
                titlePadding: EdgeInsets.all(16.0),
                centerTitle: false),
          ),
          FutureBuilder<List<User>>(
              future: fetchUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  //TODO: loader indicator to full screen
                  return SliverFillRemaining(
                    child: CircularIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return SliverFillRemaining(
                    child: LoadingErrorPage(),
                  );
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      return Card(
                        elevation: 0.0,
                        child: ListTile(
                          title: Text(snapshot.data![i].name,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${snapshot.data![i].email}',
                                  style: TextStyle(fontSize: 13.0)),
                              Text('${snapshot.data![i].companyName}',
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.black)),
                            ],
                          ),
                          isThreeLine: true,
                          leading: Icon(Icons.account_circle_outlined,
                              size: 50.0,
                              color: Color.fromRGBO(187, 187, 189, 1)),
                          onTap: () {},
                        ),
                      );
                    },
                    childCount: snapshot.data!.length,
                  ),
                );
              })
        ],
      ),
    );
  }
}
