abstract class Constants {
  static String get baseUrl => 'https://jsonplaceholder.typicode.com';
  static String get usersEndPoint => '/users';
  static String get albumsEndPoint => '/albums';
  static String get postsEndPoint => '/posts';
  static String get photosEndPoint => '/photos';
  static String get commentsEndPoint => '/comments';
  static String get commentsByPostIdEndPoint => '/comments?postId=';
  static String get noInternetAsset => 'assets/icons/no_internet.svg';
  static String get sadAsset => 'assets/icons/sad.svg';
  static int get postPreviewItemCount => 3;
  static int get albumPreviewItemCount => 3;
}
