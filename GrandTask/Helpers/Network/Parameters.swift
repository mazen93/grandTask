//
//  Parameters.swift
//  HAWHAW
//
//  Created by Mohamed Macbook on 3/28/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation
import Alamofire
class parameters {
// singlton
//MARK: create only one instense
static let parameter=parameters()
    //MARK:Parameters
    
    
    
    class func sendLog(text:String)->Parameters{
        
        let pameters:[String:Any] = [
                           "text" : text,
                           
                       ]
                return pameters
    }
    
    class func addMix(body:String)->Parameters{
        
        let pameters:[String:Any] = [
                           "body" : body,
                           "status":"published"
                       ]
                return pameters
    }
    
    
    class func addFunds(amount:String)->Parameters{
        
        let pameters:[String:Any] = [
                           "amount" : amount
                       ]
                return pameters
    }
    
    
    class func transferFromBalance(amount:String,iban:String,bankName:String)->Parameters{
        
        let pameters:[String:Any] = [
                           "amount" : amount,
                           "iban" : iban,
                           "bank_name" : bankName
                       ]
                return pameters
    }
    
    
    
    class func addCreditCardToken(cardToken:String,cardMaskedPan:String,cardBrand:String)->Parameters{
        
        let pameters:[String:Any] = [
                           "card_token" : cardToken,
                           "card_masked_pan" : cardMaskedPan,
                           "card_brand" : cardBrand
                       ]
                return pameters
    }
    
    
    
    
    
    class func addAnswer(answer:String)->Parameters{
        
        let pameters:[String:Any] = [
                           "answer" : answer
                       ]
                return pameters
    }
    
    class func crearteQuestionsParameters(questions:[String:String])->Parameters{
        let pameters:[String:Any] = [
                           "questions" : questions
                       ]
                return pameters
    }
    class func updateAcceptOrders(accept:Bool)->Parameters{
        let pameters:[String:Any] = [
                           "can_accept_orders" : accept
                       ]
                return pameters
    }
    
    class func updateUserCategories(categoriesIDs:[String])->Parameters{
        let pameters:[String:Any] = [
                           "categories_ids" : categoriesIDs
                       ]
                return pameters
    }
    
    class func addRequest(body:String,address:String,latitude:String,longitude:String,price_from:String,price_to:String)->Parameters{
        let pameters:[String:Any] = [
                           "body" : body,
                           "address" : address,
                           "latitude": latitude,
                           "longitude": longitude,
                           "price_from": price_from,
                           "price_to": price_to
                       ]
                return pameters
    }
    class func addResponse(body:String,planId:String,plabRequestID:String,price_from:String,price_to:String)->Parameters{
        let pameters:[String:Any] = [
                           "body" : body,
                           "plan_id" : planId,
                           "plan_request_id": plabRequestID,
                           "price_from": price_from,
                           "price_to": price_to
                       ]
       
        return pameters
    }
    
    class func addVlog(body:String,status:String)->Parameters{
        let pameters:[String:Any] = [
                           "body" : body,
                           "status" : status
                           
                       ]
                return pameters
    }
    
    
    
    
    class func addJumpin(name:String,description:String,location:String,date:String,price:String,lat:String,long:String,isPublic:String,status:String,invitations:[String],categoryId:String,maximumSubscriptionsNumber:String)->Parameters{
        let pameters:[String:Any] = [
                           "name" : name,
                           "description" : description,
                           "location" : location,
                           "date" : date,
                           "price" : price,
                           "latitude":lat,
                           "longitude":long,
                           "visibility":isPublic,
                           "status":status,
                           "category_id":categoryId,
                          // "invitations":invitations,
                           "maximum_subscriptions_number":maximumSubscriptionsNumber
                           
                       ]
                return pameters
    }
    class func updateJumpin(name:String,description:String,location:String,date:String,price:String,lat:String,long:String,invitations:[String],categoryId:String,isPublic:String,status:String,maximumSubscriptionsNumber:String)->Parameters{
        let pameters:[String:Any] = [
                           "name" : name,
                           "description" : description,
                           "location" : location,
                           "date" : date,
                           "price" : price,
                           "latitude":lat,
                           "longitude":long,
                           "category_id":categoryId,
                           "invitations":invitations,
                           "_method":"PATCH",
                           "visibility":isPublic,
                           "status":status,
                           "maximum_subscriptions_number":maximumSubscriptionsNumber
                           
                           
                       ]
                return pameters
    }
    
    
    class func checkChatRoomParameters(providerId:String) -> Parameters{
        let pameters:[String:Any] = [
                           
                       "receiver_id" : providerId
            
                       ]
                return pameters
    }
    
    
    
    class func addComment(comment:String)->Parameters{
        
        let pameters:[String:Any] = [
                           "comment" : comment
                       ]
                return pameters
    }
    
    class func addPlan(name:String, description: String, status:String)->Parameters{
        let pameters:[String:Any] = [
                           "name" : name,
                           "description" : description,
                            "status": status
                       ]
                return pameters
    }
    
    
     class func addReview(review:String,rate:Int)->Parameters{
         let pameters:[String:Any] = [
                            "review" : review,
                            "rate" : rate
                        ]
                 return pameters
     }
    class func getHomeParameter(type:Int)-> Parameters {
                 let pameters = [
                   "type" : type
                  ]
                 return  pameters
   }
    class func sendMessageParameter(message:String,reciverID:String,roomId:String)-> Parameters {
                   let pameters = [
                    
                    "receiver_id": reciverID,
                       "room_id": roomId,
                       "message": message
                                  ]
                  return  pameters
       }
class func getProductParameter(parentID:Int)-> Parameters {
               let pameters = [
                  "parent_id": parentID,
                  "type" : 0
                              ]
              return  pameters
   }
    class func updateViews(UserID:Int,PID:Int)-> Parameters{
        let pameters = [
                  "type" : "view",
                  "user_id" : UserID,
                  "item_id" : PID,
                  "table" : "product"
            ] as [String : Any] 
        
        
        return pameters
    }
    
    
    class func makeOrder(addressID:String)-> Parameters{
        let pameters = [
                  "address_id" : addressID
            ]
        
        
        return pameters
    }
    
    
    
    
    
    class func addAddreessHouseParameter(blockNumber:String,street:String,type:String)-> Parameters{
        let pameters = [
  
        
            "block_number" : blockNumber,
            "street_name" : street,
            "type"        : type
            ]
        
        
        return pameters
    }
    
    
    class func addAddreessBuildingParameter(floorNumber:String,flatNumber:String,blockNumber:String,street:String,type:String)-> Parameters{
        let pameters = [
  
            "floor_number" : floorNumber,
            "flat_number"  : flatNumber,
            "block_number" : blockNumber,
            "street_name" : street,
            "type"        : type
            ]
        
        
        return pameters
    }
    
    
    
    
    
    
    class func addToCartParameter(productID:String,quantity:String)-> Parameters {
                 let pameters = [
                   "product_id" : productID,
                    "quantity" : quantity
                  ]
                 return  pameters
   }
    
    
    class func updateToCartParameter(productID:String,quantity:Int)-> Parameters {
                 let pameters = [
                   "cart_id" : productID,
                    "quantity" : quantity
                 ] as [String : Any] 
                 return  pameters
   }
    
    
    
    class func makeOrderParameter(adverts:[String],comment:String,date:String)-> Parameters {
                 let pameters = [
                   "adverts" : adverts,
                    "comment" : comment,
                    "date" : date
                    
                 ] as [String : Any]
                 return  pameters
   }

    class func updateAdsParameter(overview:String,categories_id:String,city_id:String,price:String,name:String)-> Parameters {
                 let pameters = [
                    "overview" : overview,
                    "categories_id" : categories_id,
                    "city_id" : city_id,
                    "price":price,
                    "name":name
                 ] as [String : Any]
                 return  pameters
   }
    
    class func updateFirebaseToken(firebaseToken:String)->Parameters{
        let pameters = [
            "firebase_cloud_messaging_token" : firebaseToken
        ]
        return pameters
    }
    
     class func serviceFilterParameter(parameters:Dictionary<String,Any>)-> Parameters {
        print("parameters \(parameters)")
      return  parameters
    }

    class func registerParameters(fullname:String,username:String,password:String,phone:String,phoneCode:String,type:String,email:String)->Parameters{
        let pameters:[String:Any] = [
                   
                   "username" : username,
                   "full_name" : fullname,
                   "phone" : phone,
                   "password" : password,
                   "phone_code": phoneCode,
                   "type":type,
                   "email":email

                   
               ]
        return pameters
        
    }
    class func sendSmsParameters(title:String,phone:String,message:String)->Parameters{
        let pameters:[String:Any] = [
                   
                   "title" : title,
                   "phone" : phone,
                   "message" : message
                   
               ]
        return pameters
        
    }
    
    class func sendEmailSmsParameters(title:String,email:String,message:String)->Parameters{
        let pameters:[String:Any] = [
                   
                   "title" : title,
                   "email" : email,
                   "message" : message
                   
               ]
        return pameters
        
    }
    
    
    class func checkPhoneExsistParameters(phone:String)->Parameters{
        let pameters:[String:Any] = [
                   "phone" : phone
               ]
        return pameters
        
    }
    
    class func checkUsernameExsistParameters(username:String)->Parameters{
        let pameters:[String:Any] = [
                   "username" : username
               ]
        return pameters
        
    }
    
    
    class func forgotParameters(email:String)->Parameters{
        let pameters:[String:Any] = [
                   "email" : email
                   
               ]
        return pameters
        
    }
    
    
    
  

    
    
    
    class func contactusParameters(name:String,message:String,phone:String,email:String)->Parameters{
          let pameters:[String:Any] = [
                     "name" : name,
                     "email" : email,
                     "phone" : phone,
                     "message" : message
                 ]
          return pameters
          
      }
    
    class func editProfileParameters(fullName:String,overview:String)->Parameters{
        let pameters:[String:Any] = [
                   
                   "full_name" : fullName,
                    "overview" : overview
                   
               ]
        return pameters
        
    }
    class func updateLogoParameters(logo:UIImage)->Parameters{
        let pameters:[String:Any] = [
                   
                   "logo" : logo
                   
               ]
        return pameters
        
    }
  
    class func editPhoneProfileParameters(phone:String)->Parameters{
        let pameters:[String:Any] = [
                   
                   "phone" : phone
                   
               ]
        return pameters
        
    }
    
    
    
    class func resetPasswordParameters(password:String,confirmPassword:String,email:String)->Parameters{
           let pameters:[String:Any] = [
                      "password" : password,
                      "password_confirmation" : confirmPassword,
                      "email":email
            
                      
                  ]
           return pameters
           
       }
    
    
    class func editPasswordParameters(password:String,confirmPassword:String)->Parameters{
           let pameters:[String:Any] = [
                      "password" : password,
                      "password_confirmation" : confirmPassword
                      
                  ]
           return pameters
           
       }
    class func forgotPasswordParameters(password:String,phone:String,confirmPassword:String)->Parameters{
           let pameters:[String:Any] = [
                      "phone" : phone,
                      "password" : password,
                     "password_confirmation" : confirmPassword
                      
                  ]
           return pameters
           
       }
   
    class func forgotPasswordPhoneParameters(phone:String)->Parameters{
           let pameters:[String:Any] = [
                      "phone" : phone
                  ]
           return pameters
           
       }
   
    class func planRequestParameters(planId:String)->Parameters{
           let pameters:[String:Any] = [
                      "plan_id" : planId
                  ]
           return pameters
           
       }
    
    
    
    class func loginParameters(phone:String,password:String)->Parameters{
          let pameters = [
            "phone": phone,
            "password": password
           ]
           return pameters
           
       }
    class func loginByUsernameParameters(username:String,password:String)->Parameters{
          let pameters = [
            "username": username,
            "password": password
           ]
           return pameters
           
       }
    class func loginByEmailParameters(email:String,password:String)->Parameters{
          let pameters = [
            "email": email,
            "password": password
           ]
           return pameters
           
       }
    
    
    
    class func subCategoryParameters(categoryID:Int,type:Int)->Parameters{
            let pameters = [
                        "category_id" : categoryID,
                        "type" :type
                    ]
            return pameters
            
        }
    
 
         // subCategory
  
    class func filterParameters(parameters:Dictionary<String,String>)->Parameters{
             
               return parameters
               
           }
    
   class func adsParameters(parameters:Dictionary<String,String>)->Parameters{
               
                 return parameters
                 
             }
      
    
    class func bookingTripParameters(additions:[String],date:String,adults:String,children:String,infant:String)->Parameters{
            let pameters:[String:Any] = [
                       "date":date,
                       "additions_id":additions,
                       "adults_number" : adults,
                       "children_number" : children,
                       "infant_number" : infant
                   ]
            return pameters
            
        }
    
    class func bookingTripWithoutAdditionParameters(date:String,adults:String,children:String,infant:String)->Parameters{
            let pameters:[String:Any] = [
                       "date":date,
                       "adults_number" : adults,
                       "children_number" : children,
                       "infant_number" : infant
                   ]
            return pameters
            
        }
    
    
    class func updateUserData(fullname:String,username:String,phone:String,email:String)->Parameters{
        let pameters:[String:Any] = [
            
            "full_name":fullname,
            "username": username,
            "phone": phone,
            "email":email
            
          //  "categories_ids":categoriesIds
            
               ]
        return pameters
        
    }
    class func updateUserPrivacyAccount(isPrivate:Bool)->Parameters{
        let pameters:[String:Any] = [
            
            "is_account_private":isPrivate
            
            
               ]
        return pameters
        
    }
    
    class func updateUserOrders(isAccept:Bool)->Parameters{
        let pameters:[String:Any] = [
            
            "can_accept_orders":isAccept
            
            
               ]
        return pameters
        
    }
    
    
    
    
    
    class func updateWorkFields(workFields:[String])->Parameters{
        let pameters:[String:Any] = [
             "work_field_ids" : workFields
            
               ]
        return pameters
        
    }
    
    
    
    
    class func addReview(rate:Int)->Parameters{
        let pameters:[String:Any] = [
                           
                           "rate" : rate
                       ]
                return pameters
    }
    
    
    
    class func createHotelParameters(name:String,link:String)->Parameters{
        let pameters:[String:Any] = [
            "name":name,
            "link":link
                    ]
                return pameters
    }
    
    
    class func createPlanParameters(name:String,status:String)->Parameters{
        let pameters:[String:Any] = [
            "name":name,
            "status":status
                    ]
                return pameters
    }
    class func createDestinatioParameters(name:String,address:String)->Parameters{
        let pameters:[String:Any] = [
            "name":name,
            "description":name,
            "address":address
                    ]
                return pameters
    }
    
    
    
    class func specialParameters(name:String,address:String,description:String)->Parameters{
        let pameters:[String:Any] = [
            "name":name,
            "description":description,
            "address":address
                    ]
                return pameters
    }
    
    
    
    
    class func makeAPaymentParameters(jumpinId:String,paymentId:String,paymentMethodType:String,isFromSubscribe:Bool)->Parameters{
        
        if isFromSubscribe{
            let pameters:[String:Any] = [
                "jump_in_id":jumpinId,
                "payment_id":paymentId,
                "payment_method_type":paymentMethodType,
                "platform":"ios"
                        ]
                    return pameters
        }else{
            let pameters:[String:Any] = [
                "created_jump_in_id":jumpinId,
                "payment_id":paymentId,
                "payment_method_type":paymentMethodType,
                "platform":"ios"
                        ]
                    return pameters
        }
        
        
        
   
    }
    
    
    
    
    
    class func check3dParameters(amount:String,currency:String,sessionId:String)->Parameters{
        
        let pameters:[String:Any] = [
            "order_amount": amount,
            "order_currency": currency,
            "session_id": sessionId
                       ]
                return pameters
    }
   
    
    
    class func process3dParameters(secure3DSId:String,PaRes:String)->Parameters{
        
        let pameters:[String:Any] = [
            "PaRes": PaRes,
            "secure3DSId": secure3DSId
                       ]
                return pameters
    }
    
    
    class func completePlanPaymentParameters(amount:String,currency:String,sessionId:String,planId:String,thdsACSECI:String,threeToken:String,threePaResStatus:String,threeVeResenrolled:String,promoCodes:String)->Parameters{
       
        let pameters:[String:Any] = [
            "order_amount": amount,
            "order_currency": currency,
            "session_id": sessionId,
            "plan_id":planId,
            "three_ds_acs_eci":thdsACSECI,
            "three_ds_authentication_token":threeToken,
            "three_ds_1_pa_res_status":threePaResStatus,
            "three_ds_1_ve_res_enrolled":threeVeResenrolled,
            "promo_code":promoCodes,
            "platform": "ios"
                       ]
                return pameters
    }
    
    class func completeSubscribeJumpPaymentParameters(amount:String,currency:String,sessionId:String,jumpId:String,thdsACSECI:String,threeToken:String,threePaResStatus:String,threeVeResenrolled:String,promoCodes:String)->Parameters{
       
        let pameters:[String:Any] = [
            "order_amount": amount,
            "order_currency": currency,
            "session_id": sessionId,
            "jump_in_id":jumpId,
            "three_ds_acs_eci":thdsACSECI,
            "three_ds_authentication_token":threeToken,
            "three_ds_1_pa_res_status":threePaResStatus,
            "three_ds_1_ve_res_enrolled":threeVeResenrolled,
            "promo_code":promoCodes,
            "platform": "ios"
                       ]
                return pameters
    }
    class func completejumpinPaymentParameters(amount:String,currency:String,sessionId:String,jumpinCreation:String,thdsACSECI:String,threeToken:String,threePaResStatus:String,threeVeResenrolled:String,promoCodes:String)->Parameters{
       
        let pameters:[String:Any] = [
            "order_amount": amount,
            "order_currency": currency,
            "session_id": sessionId,
            "created_jump_in_id":jumpinCreation,
            "three_ds_acs_eci":thdsACSECI,
            "three_ds_authentication_token":threeToken,
            "three_ds_1_pa_res_status":threePaResStatus,
            "three_ds_1_ve_res_enrolled":threeVeResenrolled,
            "promo_code":promoCodes,
            "platform": "ios"
                       ]
                return pameters
    }
    
}
