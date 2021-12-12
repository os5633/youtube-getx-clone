import 'package:flutter_application_1/src/model/video.dart';

class YoutubeVideoResult {
  int? totalResults;
  int? resultsPerPagel;
  String? nextPageToken;
  List<Video>? items;

  YoutubeVideoResult({
    this.totalResults,
    this.resultsPerPagel,
    this.nextPageToken,
    this.items,
  });

  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) =>
      YoutubeVideoResult(
        totalResults: json["pageInfo"]["totalResults"],
        resultsPerPagel: json['pageInfo']['resultsPerPage'],
        nextPageToken: json['nextPageToken'] ?? "",
        items: List<Video>.from(
          json['items'].map(
            (data) => Video.fromJson(data),
          ),
        ),
      );
}
