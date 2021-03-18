import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/data/networking/place_service.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  AddressSearch(this.sessionToken);
  final sessionToken;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    PlaceApiProvider placeApiProvider = PlaceApiProvider(sessionToken);

    return FutureBuilder(
      future: placeApiProvider.fetchSuggestions(query, ''),
      builder: (context, snapshot) => query == ''
          ? Container(
              padding: EdgeInsets.all(16.0),
              child: Text('Enter your address'),
            )
          : snapshot.hasData
              ? ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(snapshot.data[index].toString()),
                    onTap: () {
                      close(context, snapshot.data[index]);
                    },
                  ),
                  itemCount: snapshot.data.length,
                )
              : Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Enter your address'),
                ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    PlaceApiProvider placeApiProvider = PlaceApiProvider(sessionToken);

    return FutureBuilder(
      future: placeApiProvider.fetchSuggestions(query, ''),
      builder: (context, snapshot) => query == ''
          ? Container(
              padding: EdgeInsets.all(16.0),
              child: Text('Enter your address'),
            )
          : snapshot.hasData
              ? ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(snapshot.data[index].toString()),
                    onTap: () {
                      close(context, snapshot.data[index]);
                    },
                  ),
                  itemCount: snapshot.data.length,
                )
              : Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Enter your address'),
                ),
    );
  }
}
