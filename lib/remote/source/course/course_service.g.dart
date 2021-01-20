// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CourseService implements CourseService {
  _CourseService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://api.dev.letstudy.org/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<ListCategoryResponse> getCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/category/all',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListCategoryResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<MessageResponse> enrollCourse(bearToken, courseId) async {
    ArgumentError.checkNotNull(bearToken, 'bearToken');
    ArgumentError.checkNotNull(courseId, 'courseId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'courseId': courseId};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/payment/get-free-courses',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{r'Authorization': bearToken},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MessageResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<MessageResponse> likeCourse(bearToken, courseId) async {
    ArgumentError.checkNotNull(bearToken, 'bearToken');
    ArgumentError.checkNotNull(courseId, 'courseId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'courseId': courseId};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/user/like-course',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{r'Authorization': bearToken},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MessageResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<CourseDetailResponse> getCourseInfo(id, idUser) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(idUser, 'idUser');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/course/get-course-detail/$id/$idUser',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CourseDetailResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ListCourseResponse> getTopRate(limit, page) async {
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'limit': limit, 'page': page};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/course/top-rate',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListCourseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ListCourseResponse> getTopNew(limit, page) async {
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'limit': limit, 'page': page};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/course/top-new',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListCourseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ListCourseResponse> getTopSell(limit, page) async {
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'limit': limit, 'page': page};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/course/top-sell',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListCourseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyCourseResponse> getFavoritesCourses(bearToken) async {
    ArgumentError.checkNotNull(bearToken, 'bearToken');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/user/get-favorite-courses',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': bearToken},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MyCourseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<MyCourseResponse> getMyCourses(bearToken) async {
    ArgumentError.checkNotNull(bearToken, 'bearToken');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/user/get-process-courses',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': bearToken},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MyCourseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ListCourseSearchResponse> searchV2(
      token, keyword, limit, offset) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(keyword, 'keyword');
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(offset, 'offset');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'token': token,
      'keyword': keyword,
      'limit': limit,
      'offset': offset
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/course/searchV2',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListCourseSearchResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ListCourseSearchResponse> search(token, keyword, opt) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(keyword, 'keyword');
    ArgumentError.checkNotNull(opt, 'opt');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'token': token, 'keyword': keyword, 'opt': opt};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/course/searchV2',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListCourseSearchResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<SearchHistoryResponse> getSearchHistory(bearToken) async {
    ArgumentError.checkNotNull(bearToken, 'bearToken');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'course/search-history',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': bearToken},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SearchHistoryResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<MessageResponse> deleteSearchHistory(bearToken, id) async {
    ArgumentError.checkNotNull(bearToken, 'bearToken');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'course/delete-search-history/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{r'Authorization': bearToken},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MessageResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<VideoResponse> getVideoInfo(bearToken, idCourse, idLesson) async {
    ArgumentError.checkNotNull(bearToken, 'bearToken');
    ArgumentError.checkNotNull(idCourse, 'idCourse');
    ArgumentError.checkNotNull(idLesson, 'idLesson');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'lesson/video/$idCourse/$idLesson',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': bearToken},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VideoResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ListCourseResponse> getRecommendCourses(id, limit, offset) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(offset, 'offset');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'user/recommend-course/$id/$limit/$offset',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListCourseResponse.fromJson(_result.data);
    return value;
  }
}
