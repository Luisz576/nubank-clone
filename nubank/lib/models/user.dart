class User{
  final String _id, _name, _token;

  User(this._id, this._name, this._token);

  String get id => _id;
  String get name => _name;
  String get token => _token;
}