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
  Future<NetworkCourse> getCourseInfo(courseId) async {
    ArgumentError.checkNotNull(courseId, 'courseId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/user/intro-page',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NetworkCourse.fromJson(_result.data);
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
  Future<ListCourseResponse> getFavoritesCourses(bearToken) async {
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
    final value = ListCourseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ListCourseResponse> getMyCourses(bearToken) async {
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
    final value = ListCourseResponse.fromJson(_result.data);
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
  Future<ListCourseSearchResponse> search(keyword, limit, offset) async {
    ArgumentError.checkNotNull(keyword, 'keyword');
    ArgumentError.checkNotNull(limit, 'limit');
    ArgumentError.checkNotNull(offset, 'offset');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'keyword': keyword, 'limit': limit, 'offset': offset};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/course/search',
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
}
