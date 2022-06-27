import 'package:dio/dio.dart';
import '/app/constants.dart';
import '/data/response/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/customers/login')
  Future<AuthenticationResponse> login(
      @Field("email") String email, @Field("password") String password);

  @POST('/customers/forgotPassword')
  Future<ForgotPasswordResponse> forgotPassword(
    @Field("email") String email,
  );

  @POST('/customers/register')
  Future<AuthenticationResponse> register(
    @Field("user_name") String userName,
    @Field("country_mobile_code") String countryMobileCode,
    @Field("email") String email,
    @Field("password") String password,
    @Field("mobile_number") String mobileNumber,
    @Field("profile_picture") String profilePicture,
  );

  @GET('/home')
  Future<HomeResponse> getHomeData();
}