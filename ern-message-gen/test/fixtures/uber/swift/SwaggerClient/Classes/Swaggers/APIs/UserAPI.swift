//
// UserAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



public class UserAPI: APIBase {
    /**
     User Activity
     - parameter offset: (query) Offset the list of returned results by this amount. Default is zero. (optional)
     - parameter limit: (query) Number of items to retrieve. Default is 5, maximum is 100. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func historyGet(offset offset: Int32? = nil, limit: Int32? = nil, completion: ((data: Activities?, error: ErrorType?) -> Void)) {
        historyGetWithRequestBuilder(offset: offset, limit: limit).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }


    /**
     User Activity
     - GET /history
     - The User Activity endpoint returns data about a user&#39;s lifetime activity with Uber. The response will include pickup locations and times, dropoff locations and times, the distance of past requests, and information about which products were requested.&lt;br&gt;&lt;br&gt;The history array in the response will have a maximum length based on the limit parameter. The response value count may exceed limit, therefore subsequent API requests may be necessary.
     - examples: [{"contentType":"application/json","example":"{\n  \"offset\": \"\",\n  \"limit\": \"\",\n  \"count\": \"\",\n  \"history\": [\n    {\n      \"uuid\": \"aeiou\"\n    }\n  ]\n}"}]
     - parameter offset: (query) Offset the list of returned results by this amount. Default is zero. (optional)
     - parameter limit: (query) Number of items to retrieve. Default is 5, maximum is 100. (optional)

     - returns: RequestBuilder<Activities> 
     */
    public class func historyGetWithRequestBuilder(offset offset: Int32? = nil, limit: Int32? = nil) -> RequestBuilder<Activities> {
        let path = "/history"
        let URLString = SwaggerClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [
            "offset": offset?.encodeToJSON(),
            "limit": limit?.encodeToJSON()
        ]

        let parameters = APIHelper.rejectNil(nillableParameters)

        let convertedParameters = APIHelper.convertBoolToString(parameters)

        let requestBuilder: RequestBuilder<Activities>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

    /**
     User Profile
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func meGet(completion: ((data: Profile?, error: ErrorType?) -> Void)) {
        meGetWithRequestBuilder().execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }


    /**
     User Profile
     - GET /me
     - The User Profile endpoint returns information about the Uber user that has authorized with the application.
     - examples: [{"contentType":"application/json","example":"{\n  \"first_name\": \"aeiou\",\n  \"last_name\": \"aeiou\",\n  \"email\": \"aeiou\",\n  \"picture\": \"aeiou\",\n  \"promo_code\": \"aeiou\"\n}"}]
     - returns: RequestBuilder<Profile> 
     */
    public class func meGetWithRequestBuilder() -> RequestBuilder<Profile> {
        let path = "/me"
        let URLString = SwaggerClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [:]

        let parameters = APIHelper.rejectNil(nillableParameters)

        let convertedParameters = APIHelper.convertBoolToString(parameters)

        let requestBuilder: RequestBuilder<Profile>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: true)
    }

}
