class CategoryResponse {
  int status;
  List<dynamic> data;

  CategoryResponse(this.status, this.data);

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    this.status = json['status'];
    this.data = json['data'];
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data,
      };
}

class HistoryResponse {
  bool error;
  List<dynamic> results;

  HistoryResponse(this.error, this.results);

  HistoryResponse.fromJson(Map<String, dynamic> json) {
    this.error = json['error'];
    this.results = json['results'];
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'results': results,
      };
}

class PostData {
  String _id;
  String createdAt;
  String desc;
  List<dynamic> images;
  String publishedAt;
  String source;
  String type;
  String url;
  bool used;
  String author;
  bool isTitle = false;
  String category;
  int stars;

  PostData(this._id, this.createdAt, this.desc, this.images, this.publishedAt,
      this.source, this.type, this.url, this.used, this.author);

  PostData.title(this.isTitle, this.category);

  PostData.addField(Map<String, dynamic> json, {String category}) {
    this.category = category;
    setField(json);
  }

  void setField(Map<String, dynamic> json) {
    this.createdAt = json['createdAt'];
    this.desc = json['desc'] ?? '';
    this.images =
        json['images']?.map<String>((image) => image as String)?.toList() ?? [];
    this.publishedAt = json['publishedAt'];
    this.source = json['source'];
    this.type = json['type'];
    this.url = json['url'];
    this.stars = json['stars'];
    this.author = json['author'] ?? "github";
  }

  PostData.fromJson(Map<String, dynamic> json) {
    this._id = json['_id'];
    this.createdAt = json['createdAt'];
    this.desc = json['desc'];
    this.images = json['images'];
    this.publishedAt = json['publishedAt'];
    this.source = json['source'];
    this.type = json['type'];
    this.url = json['url'];
    this.stars = json['stars'];
    this.used = json['used'];
    this.author = json['author'];
  }

  Map<String, dynamic> toJson() => {
        '_id': _id,
        'createdAt': createdAt,
        'desc': desc,
        'images': images,
        'publishedAt': publishedAt,
        'source': source,
        'type': type,
        'url': url,
        'used': used,
        'author': author,
        'category': category,
      };
}

class BannerData {
  String image;
  String title;
  String url;

  BannerData(this.image, this.title, this.url);

  BannerData.fromJson(Map<String, dynamic> json) {
    this.image = json['image'];
    this.title = json['title'];
    this.url = json['url'];
  }
}

class GankPost {
  List<String> category;
  Map itemDataMap = Map();
  String girlImage;
  List<PostData> gankItems = [];

  GankPost.fromJson(Map<String, dynamic> json)
      : category =
            json['category']?.map<String>((c) => c.toString())?.toList() {
    var results = json['results'];
    results.forEach((name, value) {
      if (name != '福利') {
        itemDataMap[name] = _createGankItemListFromJson(name, value);
      }
    });
    girlImage = json['results']['福利'][0]['url'];
  }

  List<PostData> _createGankItemListFromJson(String name, List value) {
    var gankItemList = value
        .map<PostData>((item) => PostData.addField(item, category: name))
        .toList();
    gankItems.add(PostData.title(true, name));
    gankItems.addAll(gankItemList);
    return gankItemList;
  }
}
