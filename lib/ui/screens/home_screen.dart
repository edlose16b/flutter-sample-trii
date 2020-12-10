import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triiapp/data/models/game_model.dart';
import 'package:triiapp/ui/blocs/app_bloc.dart';
import 'package:triiapp/ui/blocs/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppBloc>(context, listen: false).user;

    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/trii.png',
            width: 35,
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(15, 20, 15, 10),
              child: Text(
                'Hola ' + user,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SearchWidget(),
            Expanded(
              child: Consumer<HomeBloc>(
                builder: (context, bloc, _) {
                  return ListView.builder(
                    itemCount: bloc.gamesShowing.length,
                    itemBuilder: (context, index) {
                      print('mostrnado $index');
                      final game = bloc.gamesShowing[index];
                      return GameItem(game: game);
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar por nombre',
          border: InputBorder.none,
        ),
        onChanged: (value) {
          context.read<HomeBloc>().filterByName = value;
        },
      ),
    );
  }
}

class GameItem extends StatelessWidget {
  const GameItem({
    Key key,
    @required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: ListTile(
        leading: Image.network(game.thumbnail),
        title: Text(game.title),
      ),
    );
  }
}
