import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/userSession/userSessionNavigator/Cubit/userDataCubit.dart';
import 'package:test_login/userSession/userSessionNavigator/Cubit/userDataState.dart';
import 'package:test_login/appNavigator/Cubit/sessionCubit.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDataCubit cubit = context.read<UserDataCubit>();
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
                    onPressed: () {
                      BlocProvider.of<SessionCubit>(context).signOut();
                    },
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
          BlocBuilder<UserDataCubit, UserDataState>(
              bloc: cubit,
              builder: (context, state) {
                if (state is LoadingDataState) {
                  cubit.attemptLoadingData();
                }
                if (state is LoadedDataState) {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      return Card(
                        elevation: 0.0,
                        child: ListTile(
                          title: Text('${state.loadedUser[i].name}',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${state.loadedUser[i].email}',
                                  style: TextStyle(fontSize: 13.0)),
                              Text('${state.loadedUser[i].companyName}',
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
                    childCount: state.loadedUser.length,
                  ));
                }
                return SliverFillRemaining();
              }),
        ],
      ),
    );
  }
}
