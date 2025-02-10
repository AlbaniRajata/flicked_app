import 'dart:ui';

//Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Models
import '../models/search_category.dart';
import '../models/movie.dart';

class MainPage extends ConsumerWidget{

  late double _deviceWidth;
  late double _deviceHeight;

  TextEditingController? _searchTextFieldController;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    _searchTextFieldController = TextEditingController();
    return _buildUI();
  }

  Widget _buildUI(){
    resizeToAvoidBottomInset: false;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _backgroundWidget(),
            _foregroundWidget(),
          ],
        ),
      ),
    );
  }

  Widget _backgroundWidget(){
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            "https://image.tmdb.org/t/p/original/5bFK5d3mVTAvBCXi5NPWH0tYjKl.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
    );
  }

  Widget _foregroundWidget(){
    return Container(
      padding: EdgeInsets.fromLTRB(0, _deviceHeight * 0.02, 0, 0),
      width: _deviceWidth * 0.90,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(),
          Container(
            height: _deviceHeight * 0.83,
            padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
            child: _moviesListViewWidget(),
          )
        ],
      ),
    );
  }

  Widget _topBarWidget(){
    return Container(
      height: _deviceHeight * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchFieldWidget(),
          _categorySelectionWidget(),
        ],
      ),
    );
  }

  Widget _searchFieldWidget(){
    final _border = InputBorder.none;
    return SizedBox(
      width: _deviceWidth * 0.50,
      height: _deviceHeight * 0.05,
      child: TextField(
        controller: _searchTextFieldController,
        onSubmitted: (_input) {},
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: _border,
          border: _border,
          prefixIcon: Icon(Icons.search, color: Colors.white24),
          hintStyle: TextStyle(color: Colors.white54),
          filled: false,
          fillColor: Colors.white24,
          hintText: ('Search....'),
      ),
      ),
    );
  }

  Widget _categorySelectionWidget() {
    return DropdownButton(
      dropdownColor: Colors.black38,
      value: SearchCategory.popular,
      icon: Icon(
        Icons.menu,
        color: Colors.white24,
      ),
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      onChanged: (_value) {},
      items: [
        DropdownMenuItem(
          value: SearchCategory.popular,
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DropdownMenuItem(
          value: SearchCategory.upcoming,
          child: Text(
            SearchCategory.upcoming,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DropdownMenuItem(
          value: SearchCategory.none,
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _moviesListViewWidget() {
    final List<Movie> _movies = [];

    for (var i=0; i < 20; i++){
      _movies.add(
        Movie(
          name: "Sonic the Hedgehog 3",
          language: "En",
          isAdult: false,
          description: 
            "Sonic, Knuckles, and Tails reunite against a powerful new adversary, Shadow, a mysterious villain with powers unlike anything they have faced before. With their abilities outmatched in every way, Team Sonic must seek out an unlikely alliance in hopes of stopping Shadow and protecting the planet.",
          posterPath: "/d8Ryb8AunYAuycVKDp5HpdWPKgC.jpg",
          backdropPath: "/zOpe0eHsq0A2NvNyBbtT6sj53qV.jpg",
          rating: 7.8, 
          releaseDate: "2024-12-19",
        ),
      );
    }

    if (_movies.isNotEmpty) {
      return ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (BuildContext _context, int _count) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: _deviceHeight * 0.01, horizontal: 0),
              child: GestureDetector(
                onTap: () {},
                child: Text(_movies[_count].name ?? 'Movie Name'),
              ),
          );
        });
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
  }
}