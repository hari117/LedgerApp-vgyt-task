

class User
{

  String name;

   User createUser(String newAccoutUser)
  {
    User newUser=User();
    newUser.name=newAccoutUser;
    return newUser;
  }

}