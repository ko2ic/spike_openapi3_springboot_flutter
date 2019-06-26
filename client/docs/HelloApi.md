# openapi.api.HelloApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://10.0.2.2:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPerson**](HelloApi.md#createPerson) | **POST** /hello/person | putPerson
[**fetchPerson**](HelloApi.md#fetchPerson) | **GET** /hello/person | getPerson


# **createPerson**
> Person createPerson(person)

putPerson

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new HelloApi();
var person = new Person(); // Person | person

try { 
    var result = api_instance.createPerson(person);
    print(result);
} catch (e) {
    print("Exception when calling HelloApi->createPerson: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **person** | [**Person**](Person.md)| person | 

### Return type

[**Person**](Person.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **fetchPerson**
> Person fetchPerson(id)

getPerson

### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new HelloApi();
var id = 56; // int | id

try { 
    var result = api_instance.fetchPerson(id);
    print(result);
} catch (e) {
    print("Exception when calling HelloApi->fetchPerson: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| id | [optional] [default to 1]

### Return type

[**Person**](Person.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

