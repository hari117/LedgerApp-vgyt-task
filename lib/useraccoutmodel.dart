

import 'package:cloud_firestore/cloud_firestore.dart';

class UserAccountModel
{

  static UserAccountModel instance=UserAccountModel();
  // String userName;
  // String name;
  // String id;
  // String email;
  // String photoUrl;
  // String bankName;
  // String bankAccount;
  // String ifscCode;
  int accountBalanc=500;

  // UserAccountModel getModel(DocumentSnapshot d)
  // {
  //   print("called getmodel Funtion");
  //
  //   UserAccountModel userAccountModel=UserAccountModel();
  //   userAccountModel.userName=d["userNam"];
  //   userAccountModel.name=d["name"];
  //   userAccountModel.id=d["id"];
  //   userAccountModel.email=d["email"];
  //   userAccountModel.photoUrl=d["photoUrl"];
  //   userAccountModel.bankName=d["bankName"];
  //   userAccountModel.bankAccount=d["bankAccount"];
  //   userAccountModel.ifscCode=d["ifscCode"];
  //   userAccountModel.accountBalance=d['accountBalance'];
  //  return userAccountModel;
  //
  // }

}
final $userCall=UserAccountModel();