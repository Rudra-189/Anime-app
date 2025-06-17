
class Anime{
  final int malId;
  final String url;
  final Images images;
  final Trailer? trailer;
  final bool approved;
  final List<Title> titles;
  final String title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<String> titleSynonyms;
  final String? type;
  final String? source;
  final int? episodes;
  final String? status;
  final bool? airing;
  final Aired? aired;
  final String? duration;
  final String? rating;
  final double? score;
  final int? scoredBy;
  final int? rank;
  final int? popularity;
  final int? members;
  final int? favorites;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;
  final Broadcast? broadcast;
  final List<Producer> producers;
  final List<Producer> licensors;
  final List<Producer> studios;
  final List<Genre> genres;
  final List<Genre> explicitGenres;
  final List<Genre> themes;
  final List<Genre> demographics;

  Anime({
    required this.malId,
    required this.url,
    required this.images,
    this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    this.titleEnglish,
    this.titleJapanese,
    required this.titleSynonyms,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
    malId: json['mal_id'] ?? 0,
    url: json['url'] ?? 'no url',
    images: Images.fromJson(json['images']),
    trailer: json['trailer'] != null ? Trailer.fromJson(json['trailer']) : null,
    approved: json['approved'],
    titles: List<Title>.from(json['titles'].map((x) => Title.fromJson(x))),
    title: json['title'],
    titleEnglish: json['title_english'],
    titleJapanese: json['title_japanese'],
    titleSynonyms: List<String>.from(json['title_synonyms']),
    type: json['type'],
    source: json['source'],
    episodes: json['episodes'],
    status: json['status'],
    airing: json['airing'],
    aired: json['aired'] != null ? Aired.fromJson(json['aired']) : null,
    duration: json['duration'],
    rating: json['rating'],
    score: (json['score'] as num?)?.toDouble(),
    scoredBy: json['scored_by'],
    rank: json['rank'],
    popularity: json['popularity'] ?? 0,
    members: json['members'] ?? 0,
    favorites: json['favorites'] ?? 0,
    synopsis: json['synopsis'],
    background: json['background'],
    season: json['season'],
    year: json['year'],
    broadcast: json['broadcast'] != null ? Broadcast.fromJson(json['broadcast']) : null,
    producers: List<Producer>.from(json['producers'].map((x) => Producer.fromJson(x))),
    licensors: List<Producer>.from(json['licensors'].map((x) => Producer.fromJson(x))),
    studios: List<Producer>.from(json['studios'].map((x) => Producer.fromJson(x))),
    genres: List<Genre>.from(json['genres'].map((x) => Genre.fromJson(x))),
    explicitGenres: List<Genre>.from(json['explicit_genres'].map((x) => Genre.fromJson(x))),
    themes: List<Genre>.from(json['themes'].map((x) => Genre.fromJson(x))),
    demographics: List<Genre>.from(json['demographics'].map((x) => Genre.fromJson(x))),
  );
}

class Images {
  final ImageFormat jpg;
  final ImageFormat webp;

  Images({required this.jpg, required this.webp});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    jpg: ImageFormat.fromJson(json['jpg']),
    webp: ImageFormat.fromJson(json['webp']),
  );
}

class ImageFormat {
  final String imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  ImageFormat({
    required this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  factory ImageFormat.fromJson(Map<String, dynamic> json) => ImageFormat(
    imageUrl: json['image_url'] ?? 'no image',
    smallImageUrl: json['small_image_url']?? 'no image',
    largeImageUrl: json['large_image_url']?? 'no image',
  );
}

class Trailer {
  final String? youtubeId;
  final String? url;
  final String? embedUrl;
  final TrailerImages? images;

  Trailer({this.youtubeId, this.url, this.embedUrl, this.images});

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
    youtubeId: json['youtube_id'] ?? 'no youtubeId',
    url: json['url'] ?? 'no url',
    embedUrl: json['embed_url'] ?? 'no embedUrl',
    images: json['images'] != null ? TrailerImages.fromJson(json['images']) : null,
  );
}

class TrailerImages {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? mediumImageUrl;
  final String? largeImageUrl;
  final String? maximumImageUrl;

  TrailerImages({
    this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  factory TrailerImages.fromJson(Map<String, dynamic> json) => TrailerImages(
    imageUrl: json['image_url']?? 'no image',
    smallImageUrl: json['small_image_url']?? 'no image',
    mediumImageUrl: json['medium_image_url']?? 'no image',
    largeImageUrl: json['large_image_url']?? 'no image',
    maximumImageUrl: json['maximum_image_url']?? 'no image',
  );
}

class Title {
  final String type;
  final String title;

  Title({required this.type, required this.title});

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    type: json['type'] ?? 'no type',
    title: json['title']?? 'no title',
  );
}

class Aired {
  final String? from;
  final String? to;
  final Prop? prop;
  final String? string;

  Aired({this.from, this.to, this.prop, this.string});

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
    from: json['from'] ?? 'no from',
    to: json['to'] ?? 'no to',
    prop: json['prop'] != null ? Prop.fromJson(json['prop']) : null,
    string: json['string'] ?? 'no string',
  );
}

class Prop {
  final DatePart? from;
  final DatePart? to;

  Prop({this.from, this.to});

  factory Prop.fromJson(Map<String, dynamic> json) => Prop(
    from: json['from'] != null ? DatePart.fromJson(json['from']) : null,
    to: json['to'] != null ? DatePart.fromJson(json['to']) : null,
  );
}

class DatePart {
  final int? day;
  final int? month;
  final int? year;

  DatePart({this.day, this.month, this.year});

  factory DatePart.fromJson(Map<String, dynamic> json) => DatePart(
    day: json['day'] ?? 0,
    month: json['month'] ?? 0,
    year: json['year'] ?? 0,
  );
}

class Broadcast {
  final String? day;
  final String? time;
  final String? timezone;
  final String? string;

  Broadcast({this.day, this.time, this.timezone, this.string});

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
    day: json['day'] ?? 'no day',
    time: json['time'] ?? 'no time',
    timezone: json['timezone'] ?? 'no timezone',
    string: json['string'] ?? 'no String',
  );
}

class Producer {
  final int malId;
  final String type;
  final String name;
  final String url;

  Producer({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Producer.fromJson(Map<String, dynamic> json) => Producer(
    malId: json['mal_id'] ?? 0,
    type: json['type'] ?? 'no type',
    name: json['name'] ?? 'no name',
    url: json['url'] ?? 'no url',
  );
}

class Genre {
  final int malId;
  final String type;
  final String name;
  final String url;

  Genre({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    malId: json['mal_id'] ?? 0,
    type: json['type'] ?? 'no type',
    name: json['name'] ?? 'no name',
    url: json['url'] ?? 'no url',
  );
}
