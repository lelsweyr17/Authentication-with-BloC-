import 'package:flutter/material.dart';
import 'package:test_login/session/loadingErrorPage/LoadingErrorPage.dart';
import 'package:test_login/session/loadingView.dart';
import 'package:test_login/session/sessionState/dataFromApi/User.dart';

class SessionView extends StatelessWidget {
  const SessionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //TODO: floating alignment of title(from bottomLeft to Center)
            expandedHeight: 120.0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.logout_outlined,
                        color: Colors.black, size: 30.0)),
              )
            ],
            floating: true,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
                title: Text('Пользователи',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                titlePadding: EdgeInsets.all(16.0),
                centerTitle: false),
          ),
          FutureBuilder<List<User>>(
              future: fetchUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  //TODO: loader indicator to full screen
                  return SliverFillRemaining(
                    child: LoadingView(),
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
