import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umsonst_app_2/api/model/post_get.dart';
import 'package:umsonst_app_2/api/model/register_post.dart';
import 'model/token_post.dart';

class HttpService {
  String baseApiUrl = "/miniature-couscous-rp4694vx697frp9-8000.app.github.dev";
  String accessToken = "";

  HttpService({required this.baseApiUrl}) {
    loadAccessToken();
  }

  Future<void> loadAccessToken() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: "UMSONST_API_TOKEN");
    if (token != null) {
      accessToken = token;
    }
  }

  static Future<String?> getCurrentServerUrl() async {
    final prefs = await SharedPreferences.getInstance();
    String? address = prefs.getString("SERVER_ADDRESS");
    return address;
  }

  Future<List<PostModel>> getPosts() async {
    if(accessToken == ""){
      await loadAccessToken();
    }
    Response res = await get(
        Uri.parse('$baseApiUrl/api/post/'),
        headers: {'Authorization': "Token $accessToken"}
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<PostModel> posts = body
          .map(
            (dynamic item) => PostModel.fromJson(item),
          )
          .toList();

      print(posts);

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<bool> createPost(String title, String description) async {
    Response res = await post(Uri.parse('$baseApiUrl/posts/'),
        headers: {'Authorization': "Token $accessToken", 'Content-Type': 'application/json'},
        body: json.encode({
          "title": title,
          "description": description,
          "type": 0,
          "longitude": 8.022855,
          "latitude": 50.874534,
          "location": "Siegen",
          "item_size": "Default"
        }));

    if (res.statusCode == 200) {
      return true;
    } else {
      print(res);
      throw "Unable to create post.";
    }
  }

  Future<RegisterModel> registerUser(String email, String password) async {
    Response res = await post(Uri.parse('$baseApiUrl/api/user/register/'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"email": email, "password": password})
    );
    if (res.statusCode == 201) {
      dynamic body = jsonDecode(res.body);
      RegisterModel registeredUserModel = RegisterModel.fromJson(body);
      return registeredUserModel;
    } else {
      throw "Unable to register user.";
    }
  }

  Future<TokenModel> createToken(String user, String password) async {
    Response res = await post(Uri.parse('$baseApiUrl/api-token-auth/'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"username": user, "password": password}));

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      TokenModel token = TokenModel.fromJson(body);
      return token;
    } else {
      throw "Unable to retrieve token.";
    }
  }
}
