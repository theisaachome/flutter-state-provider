class User {
  String name;
  String profileImage;
  String postImage;
  User({this.name, this.profileImage, this.postImage});

  get currentUser => User(
      name: "Isaachome",
      profileImage:
          "https://images.unsplash.com/photo-1579758629938-03607ccdbaba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      postImage:
          "https://images.unsplash.com/photo-1579758682665-53a1a614eea6?ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80");
}
