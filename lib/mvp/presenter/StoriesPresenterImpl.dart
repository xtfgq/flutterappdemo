import 'package:my_flutter_app/mvp/presenter/StoriesPresenter.dart';

class StoriesPresenterImpl implements StoriesPresenter {

  StoriesView _view;

  StoriesRepository _repository;

  StoriesPresenterImpl(this._view) {
    _view.setPresenter(this);
  }

  @override
  void loadNews(String date) {
    assert(_view != null);
    _repository.loadNews(date).then((data) {
      _view.onLoadNewsSuc(data);
    }).catchError((error) {
      _view.onLoadNewsFail();
    });
  }

  @override
  init() {
    _repository = new StoriesRepositoryImpl();
  }
}