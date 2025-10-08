





import 'package:order_delivery_application/core/class/statusrequest.dart';

handlingData(response){
  if (response is StatusRequest){
   return response ; 
  }else {
   return StatusRequest.success ; 
  }
}