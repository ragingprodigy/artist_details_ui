import 'dart:ui' as ui;

import 'package:blurry_artist_details_ui/models.dart';
import 'package:blurry_artist_details_ui/video_card.dart';
import 'package:flutter/material.dart';

class ArtistDetailsPage extends StatelessWidget {
  final Artist artist;

  ArtistDetailsPage(this.artist);

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 32),
          _buildAvatar(),
          _buildInfo(),
          _buildVideoScroller(),
        ],
      ),
    );
  }

  Widget _buildAvatar() => Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
        ),
        margin: EdgeInsets.only(left: 16, top: 42),
        padding: EdgeInsets.all(3),
        child: ClipOval(
          child: Image.asset(artist.avatar),
        ),
      );

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            artist.firstName + '\n' + artist.lastName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          Text(
            artist.location,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.85),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: 225.0,
            height: 1.0,
          ),
          Text(
            artist.biography,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoScroller() => Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: SizedBox.fromSize(
          size: Size.fromHeight(245.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            itemCount: artist.videos.length,
            itemBuilder: (BuildContext context, int index) {
              var video = artist.videos[index];
              return VideoCard(video);
            },
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            artist.backdropPhoto,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }
}
