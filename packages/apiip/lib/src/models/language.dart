/// A language that can be specified to control the language results are
/// returned in.
enum Language {
  en('en'),
  de('de'),
  es('es'),
  fr('fr'),
  ja('ja'),
  ptBr('pt-BR'),
  ru('ru'),
  zhCn('zn-CN');

  final String _value;

  /// @nodoc
  const Language(this._value);

  @override
  String toString() => _value;
}
