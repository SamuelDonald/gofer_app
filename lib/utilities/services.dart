import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gofer_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

 class ServiceClass extends ChangeNotifier{

  bool _loggedIn = false;

  //String BaseUrl = "http://172.20.10.9:5300/";
  String BaseUrl = "https://marketshare.iflsc.com/";
  int CurrentIndex = 0;
  String CurrentCity = "",CurrentAddress= "", CurrentCountry = "",Name = "",PhoneNumber = "";


  toggle(){
    _loggedIn = !_loggedIn;
    notifyListeners();
  }


  void notifyLogin(medUser){
    notifyListeners();
  }


  void addCity(String country,String city,String address){
    CurrentCountry = country;
    CurrentCity = city;
    CurrentAddress = address;
    notifyListeners();
  }

  void changeProfile(String name,String phone){
    Name = name;
    PhoneNumber = phone;
    notifyListeners();
  }

  // void increaseCart() async{
  //
  //   SharedPreferences sharedpreference = await SharedPreferences.getInstance();
  //   String Email = sharedpreference.getString("Email")!;
  //
  //   try {
  //     var dataB = {
  //       "Email": Email
  //     };
  //     var url = Uri.parse(BaseUrl + "user/cart/list");
  //     http.Response response = await http.post(url,body: dataB);
  //     print(response);
  //     if (response.statusCode == 200) {
  //       //return response.body;
  //       var data = json.decode(response.body);
  //       List<dynamic> productListX = data["data"];
  //       if(productListX != null){
  //         List<Cart> dataList = productListX.map((e) => Cart.fromJson(e)).toList();
  //         CurrentIndex = dataList.length;
  //         print("Live now .... ${dataList.length}");
  //         print("CCCCCCCCYYYUUU ------- 2");
  //       }else{
  //         CurrentIndex = 0;
  //         print("CCCCCCCCYYYUUU ------- 1");
  //       }
  //       notifyListeners();
  //     } else {
  //       CurrentIndex = CurrentIndex + 1;
  //       notifyListeners();
  //     }
  //   } on SocketException catch (e) {
  //     print("Error messages now ooooo");
  //     CurrentIndex = CurrentIndex + 1;
  //     notifyListeners();
  //   }
  // }





  Future<String> placesAPIKey () async {
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFbWFpbCI6ImNsZW1iYWJhaW5mb0BnbWFpbC5jb20iLCJQYXNzd29yZCI6ImNoZWxzZWF3cWUyMiIsImlhdCI6MTYyMTg0NzEzNCwiZXhwIjoxNjIxODQ3NzM0fQ.MCJ94nKO3RIOf-TgiEDDmne0o9J2HVEmwso-3MGPvIA',
    };
    try {
      print("Inside the apikey");
      var url = Uri.parse("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=formatted_address%2Cname%2Crating%2Copening_hours%2Cgeometry &input=Museum%20of%20Contemporary%20Art%20Australia&inputtype=textquery&key=AIzaSyCtBsoVivP30BmOeK5HR8RmKENxCnEKpX8");
      http.Response response =
      await http.get(url, headers: headers);
      print(response);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.body;
      }
    } on SocketException catch (_) {
      print("Error messages now ooooo");
      return "Network Error";
    }
  }



  Future<ResponseModel> viewCart() async {

    SharedPreferences sharedpreference = await SharedPreferences.getInstance();
    String Email = sharedpreference.getString("Email")!;


    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "Email": Email
      };
      print("Inside the cart");
      var url = Uri.parse(
          BaseUrl + "user/cart/list");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel = new ResponseModel(code: response.statusCode,body:response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600,body:"Network error");
      return responseModel;
    }
  }



  Future<ResponseModel> deleteCart (String Email,String id) async {
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "Email": Email,
        "ProductId":id
      };
      print("Inside the cart");
      var url = Uri.parse(
          BaseUrl + "user/cart/delete");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel = new ResponseModel(code: response.statusCode,body:response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600,body:"Network error");
      return responseModel;
    }
  }

  // Future<ResponseModel> addToCart(Cart cart) async {
  //
  //   ResponseModel responseModel;
  //   print("It is well");
  //   print(cart.productID);
  //   try {
  //     var dataB = {
  //       "ProductID": cart.productID!,
  //       "ProductName": cart.productName!,
  //       "Email": cart.email!,
  //       "ProductPrice": cart.productPrice!.toString(),
  //       "ProductImage":cart.productImage!,
  //       "Quantity": cart.quantity.toString(),
  //       "VendorName":cart.vendorName,
  //       "VendorPhone":cart.vendorPhone,
  //       "VendorMarket":cart.vendorMarket,
  //       "Status": "Pending",
  //       "VendorEmail": cart.vendorEmail
  //     };
  //
  //     print("Inside the cart");
  //     var url = Uri.parse(
  //         BaseUrl + "user/post/cart");
  //     http.Response response =
  //     await http.post(url, body: dataB);
  //     print(response);
  //     responseModel = new ResponseModel(code: response.statusCode,body:response.body);
  //     if (response.statusCode == 200) {
  //       return responseModel;
  //     } else {
  //       return responseModel;
  //     }
  //   } on SocketException catch (_) {
  //     responseModel = new ResponseModel(code: 600,body:"Network error");
  //     return responseModel;
  //   }
  // }


  Future<ResponseModel> viewProductDetail(id) async {
    var headers = {
      HttpHeaders.authorizationHeader: 'Bearer ',
      'Content-Type': 'application/problem+json; charset=utf-8 '
    };
    ResponseModel responseModel;
    try {
      print("Inside the Home data");
      var url = Uri.parse(
          BaseUrl + "user/products/$id");
      http.Response response =
      await http.get(url, headers: headers);
      print(response);
      responseModel = new ResponseModel(code: response.statusCode,body:response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600,body:"Network error");
      return responseModel;
    }
  }


  Future<ResponseModel> viewHomeData() async {
    SharedPreferences sharedpreference = await SharedPreferences.getInstance();
    String City = sharedpreference.getString("City")!;
    var headers = {
      HttpHeaders.authorizationHeader: 'Bearer ',
    };
    ResponseModel responseModel;
    try {
      print("Inside the Home data");
      var url = Uri.parse(BaseUrl + "user/home/list/$City");
      http.Response response =
      await http.get(url, headers: headers);
      print(response);
      responseModel = new ResponseModel(code: response.statusCode,body:response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600,body:"Network error");
      return responseModel;
    }
  }


  Future<ResponseModel> filterByMarket(String market) async {

    SharedPreferences sharedpreference = await SharedPreferences.getInstance();
    String City = sharedpreference.getString("City")!;

    var headers = {
      HttpHeaders.authorizationHeader: 'Bearer ',
    };
    ResponseModel responseModel;
    try {

      var data = {
        "city":City
      };
      print("Inside the Home data");
      var url = Uri.parse(BaseUrl + "user/home/filter_market/$market");
      http.Response response =
      await http.post(url,body: data, headers: headers);
      print(response);
      responseModel = new ResponseModel(code: response.statusCode,body:response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600,body:"Network error");
      return responseModel;
    }
  }


  Future<ResponseModel> searchProducts(String text) async {
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "productText": text,
      };

      print("Inside the cart");
      var url = Uri.parse(
          BaseUrl + "user/post/cart");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel = new ResponseModel(code: response.statusCode,body:response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600,body:"Network error");
      return responseModel;
    }
  }



  Future<ResponseModel> viewVendorDetail(email) async {
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      print("Inside the Home data");
      var url = Uri.parse(
          BaseUrl + "vendor/find/$email");
      http.Response response =
      await http.get(url, headers: headers);
      print(response);
      responseModel = new ResponseModel(code: response.statusCode,body:response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600,body:"Network error");
      return responseModel;
    }
  }


  Future<ResponseModel> allLocations() async {
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      print("Inside Location data");
      var url = Uri.parse(
          BaseUrl + "user/change/location");
      http.Response response =
      await http.get(url, headers: headers);
      print(response);
      responseModel = new ResponseModel(code: response.statusCode,body:response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600,body:"Network error");
      return responseModel;
    }
  }


  // Future<ResponseModel> createOrder(List<Cart> cartList,int TotalAmount,String OrderId,int Subtotal,int DeliveryCharge,String OrderTime ) async {
  //
  //   SharedPreferences sharedpreference = await SharedPreferences.getInstance();
  //   String Address = sharedpreference.getString("Address")!;
  //   String City = sharedpreference.getString("City")!;
  //   String Country = sharedpreference.getString("Country")!;
  //   String Email = sharedpreference.getString("Email")!;
  //   String Name = sharedpreference.getString("Name")!;
  //   String PhoneNumber = sharedpreference.getString("PhoneNumber")!;
  //   String Latitude = sharedpreference.getString("Latitude")!;
  //   String Longitude = sharedpreference.getString("Longitude")!;
  //
  //   print("UUU ======--------------------#GGTTTYT");
  //
  //   var headers = {
  //     HttpHeaders.authorizationHeader:
  //     'Bearer ',
  //   };
  //   ResponseModel responseModel;
  //   print("It is well");
  //   try {
  //
  //     //List<Cart> list =
  //
  //     Map<String, Object> dataB = {
  //       "Products" : jsonEncode(cartList),
  //       "PaymentMethod": "FlutterWave",
  //       "TotalAmount": TotalAmount.toString(),
  //       "OrderId": OrderId,
  //       "Subtotal": Subtotal.toString(),
  //       "DeliveryCharge": DeliveryCharge.toString(),
  //       "OrderStatus": "Pending",
  //       "OrderTime": OrderTime,
  //       "Customer": jsonEncode(<String,String>{
  //         "name":Name,
  //         "email" : Email,
  //         "city" : City,
  //         "phone" : PhoneNumber,
  //         "latitude" : Latitude,
  //         "longitude" : Longitude,
  //       }),
  //
  //     };
  //
  //     print("Inside the cart");
  //     var url = Uri.parse(
  //         BaseUrl + "user/create_orders");
  //     http.Response response = await http.post(url, body: dataB,headers: headers);
  //     print(response);
  //     responseModel = new ResponseModel(code: response.statusCode,body:response.body);
  //     if (response.statusCode == 200) {
  //       return responseModel;
  //     } else {
  //       return responseModel;
  //     }
  //   } on SocketException catch (_) {
  //     responseModel = new ResponseModel(code: 600,body:"Network error");
  //     return responseModel;
  //   }
  // }


  Future<ResponseModel> viewAllLocations() async {

    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {

      print("Inside the forgot password");
      var url = Uri.parse(
          BaseUrl + "vendor/select_all/location");
      http.Response response =
      await http.get(url, headers: headers);
      print(response);
      responseModel = ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }


  Future<ResponseModel> createUser(String Name,String PhoneNumber,String OTP, String Email, String Password) async {

    SharedPreferences sharedpreference = await SharedPreferences.getInstance();
    String Address = sharedpreference.getString("Address")!;
    String City = sharedpreference.getString("City")!;
    String Country = sharedpreference.getString("Country")!;


    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;

    try {
      var dataB = {
        "Name": Name,
        "PhoneNumber": PhoneNumber,
        "Email": Email,
        "Password": Password,
        "Country": Country,
        "City": City,
        "Latitude": "",
        "Longitude": "",
        "Address": Address,
        "OTP": OTP
      };

      print("Inside the forgot password");
      var url = Uri.parse(
          BaseUrl + "user/register");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }



  Future<ResponseModel> loginUser(String email, String password) async {
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "Email": email,
        "Password": password
      };

      print("Inside the forgot password");
      var url = Uri.parse(
          BaseUrl + "user/login");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }


  Future<ResponseModel> activateUser(String email) async {
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "Email": email,
      };

      print("Inside the cart");
      var url = Uri.parse(
          BaseUrl + "user/activate");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }


  Future<ResponseModel> forgotPasswordUser(String email, String OTP) async {
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "Email": email,
        "OTP": OTP
      };

      print("Inside the forgot password");
      var url = Uri.parse(
          BaseUrl + "user/forgot_password");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }

  Future<ResponseModel> changePasswordUser(String email,
      String password) async {
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "Email": email,
        "Password": password
      };

      print("Inside the forgot password");
      var url = Uri.parse(BaseUrl + "user/reset_password");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }


  Future<ResponseModel> viewMyOrders(String Email) async {
    SharedPreferences sharedpreference = await SharedPreferences.getInstance();
    String City = sharedpreference.getString("City")!;

    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "Email": Email,
      };

      print("Inside the forgot password");
      var url = Uri.parse(
          BaseUrl + "users/orders/find");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }


  Future<ResponseModel> editAccount(String BizName, String Phone) async {
    SharedPreferences sharedpreference = await SharedPreferences.getInstance();
    String Email = sharedpreference.getString("Email")!;

    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {

      var dataB = {
        "Name": BizName,
        "Email": Email,
        "Phone": Phone,
      };

      print("Inside the forgot password");
      var url = Uri.parse(BaseUrl + "user/update_profile/no_image");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }


  Future<ResponseModel> citiesAPIKey(String CityText) async {
    ResponseModel responseModel;
    try {
      print("Inside the forgot password");
      var url = Uri.parse("https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$CityText&types=(cities)&key=AIzaSyCtBsoVivP30BmOeK5HR8RmKENxCnEKpX8");
      http.Response response =
      await http.get(url);
      print(response);
      responseModel = new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }


  // Future<ResponseModel> getDestinationAPI (LatLng origin, LatLng destination) async {
  //   var headers = {
  //     HttpHeaders.authorizationHeader:
  //     'Bearer ',
  //   };
  //   ResponseModel responseModel;
  //   try {
  //     print("Inside the apikey");
  //     var url = Uri.parse("https://maps.googleapis.com/maps/api/directions/json?destination=${destination.latitude},${destination.longitude}&origin=${origin.latitude},${origin.longitude}&key=AIzaSyDgG7r9ABJmq1btpStTQDbSTuBnvOM-qLI");
  //     http.Response response =
  //     await http.get(url, headers: headers);
  //     print(response);
  //     responseModel = new ResponseModel(code: response.statusCode, body: response.body);
  //     if (response.statusCode == 200) {
  //       return responseModel;
  //     } else {
  //       return responseModel;
  //     }
  //   } on SocketException catch (_) {
  //     responseModel = new ResponseModel(code: 600, body: "Network error");
  //     return responseModel;
  //   }
  // }


  Future<ResponseModel> trackCourier(String OrderId, String Latitude, String Longitude,String TrackerId) async {

    SharedPreferences sharedpreference = await SharedPreferences.getInstance();
    String Email = sharedpreference.getString("Email")!;

    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "OrderId": OrderId,
        "Latitude": Latitude,
        "Longitude": Longitude,
        "TrackerId":TrackerId
      };

      print("Inside the forgot password");
      var url = Uri.parse(
          BaseUrl + "courier/update/tracker");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }


  Future<ResponseModel> updateCourier(String OrderId) async {
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "orderId": OrderId
      };

      print("Inside the forgot password");
      var url = Uri.parse(
          BaseUrl + "courier/tracker/order");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }



  Future<ResponseModel> updateCourierDelivered(String OrderId) async {
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "orderId": OrderId
      };

      print("Inside the forgot password");
      var url = Uri.parse(
          BaseUrl + "courier/tracker/order_delivered");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }

  Future<ResponseModel> trackCourierLocation(String OrderId) async {
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "OrderId": OrderId
      };

      print("Inside the port");
      var url = Uri.parse(
          BaseUrl + "user/order/tracker");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }


  Future<ResponseModel> findProductsBaseOnCategories(String Category) async {
    SharedPreferences sharedpreference = await SharedPreferences.getInstance();
    String City = sharedpreference.getString("City")!;
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "Category": Category,
        "City": City
      };

      print("Inside the forgot password");
      var url = Uri.parse(
          BaseUrl + "user/find/categories");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }


  Future<ResponseModel> sendVerifyEmail(String Email,String OTP) async {
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "Email": Email,
        "OTP": OTP
      };

      print("Inside the forgot password");
      var url = Uri.parse(
          BaseUrl + "send/verified/email");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }

  Future<ResponseModel> getallVendors() async {
    SharedPreferences sharedpreference = await SharedPreferences.getInstance();
    String City = sharedpreference.getString("City")!;
    var headers = {
      HttpHeaders.authorizationHeader:
      'Bearer ',
    };
    ResponseModel responseModel;
    try {
      var dataB = {
        "City": City
      };

      print("Inside the forgot password");
      var url = Uri.parse(
          BaseUrl + "user/find/all_vendors");
      http.Response response =
      await http.post(url, body: dataB, headers: headers);
      print(response);
      responseModel =
      new ResponseModel(code: response.statusCode, body: response.body);
      if (response.statusCode == 200) {
        return responseModel;
      } else {
        return responseModel;
      }
    } on SocketException catch (_) {
      responseModel = new ResponseModel(code: 600, body: "Network error");
      return responseModel;
    }
  }

}





