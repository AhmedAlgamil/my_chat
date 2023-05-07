import 'package:flutter/cupertino.dart';

class LanguageChangeProvider with ChangeNotifier{
  Locale _currentLocal=new Locale("en");


  Locale get currentLocal => _currentLocal;

  void changeLocale(String _locale)
  {
    this._currentLocal= new Locale(_locale);
    notifyListeners();
  }

}