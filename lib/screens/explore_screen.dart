import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'news_article.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final String _apiKey = '83f7a716186b459f8cb9d1c6af4ca8ef'; // Replace with your API key
  List<NewsArticle> _articles = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchTechnologyNews();
  }

  Future<void> fetchTechnologyNews() async {
    final String url =
        'https://newsapi.org/v2/top-headlines?category=technology&language=en&pageSize=100&apiKey=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        if (jsonData['status'] == 'ok') {
          List articlesJson = jsonData['articles'];
          setState(() {
            _articles = articlesJson
                .map((articleJson) => NewsArticle.fromJson(articleJson))
                .toList();
            _isLoading = false;
          });
        } else {
          setState(() {
            _errorMessage =
                jsonData['message'] ?? 'Unknown error occurred.';
            _isLoading = false;
          });
        }
      } else {
        setState(() {
          _errorMessage =
              'Failed to load news. Status code: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshNews() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    await fetchTechnologyNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Technology News'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _refreshNews,
                  child: PageView.builder(
                    scrollDirection: Axis.vertical, // Vertical scroll like reels
                    itemCount: _articles.length,
                    itemBuilder: (context, index) {
                      final article = _articles[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Article Image
                          CachedNetworkImage(
                            imageUrl: article.urlToImage,
                            width: double.infinity,
                            height: 300, // Increase height for reels effect
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              height: 300,
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/logoRM.png',
                              width: double.infinity,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(16.0),
                              children: [
                                // Article Title
                                Text(
                                  article.title,
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                // Source Name
                                Text(
                                  'Source: ${article.sourceName}',
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                                SizedBox(height: 8),
                                // Publication Date
                                Text(
                                  'Published at: ${article.publishedAt.substring(0, 10)}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 8),
                                // Article Description
                                Text(
                                  article.description != 'No Description Available'
                                      ? article.description
                                      : 'No description available.',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                // Article Content
                                Text(
                                  article.content != 'No Content Available'
                                      ? article.content
                                      : 'No content available.',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
    );
  }
}
