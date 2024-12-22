import 'package:ten_twenty_asgn/data/model/UpcomingMovieResult.dart';

class UpComingMoviesResponse {
  Dates? dates;
  int? page;
  List<UpComingMovieResult>? results;
  int? totalPages;
  int? totalResults;

  UpComingMoviesResponse({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  UpComingMoviesResponse.fromJson(Map<String, dynamic> json) {
    dates = (json['dates'] as Map<String,dynamic>?) != null ? Dates.fromJson(json['dates'] as Map<String,dynamic>) : null;
    page = json['page'] as int?;
    results = (json['results'] as List?)?.map((dynamic e) => UpComingMovieResult.fromJson(e as Map<String,dynamic>)).toList();
    totalPages = json['total_pages'] as int?;
    totalResults = json['total_results'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['dates'] = dates?.toJson();
    json['page'] = page;
    json['results'] = results?.map((e) => e.toJson()).toList();
    json['total_pages'] = totalPages;
    json['total_results'] = totalResults;
    return json;
  }
}

class Dates {
  String? maximum;
  String? minimum;

  Dates({
    this.maximum,
    this.minimum,
  });

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'] as String?;
    minimum = json['minimum'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['maximum'] = maximum;
    json['minimum'] = minimum;
    return json;
  }
}

