#include "usermanagesystem.h"
#include "datashunt.h"

using std::string;

UserManageSystem &UserManageSystem::Init()
{
    static UserManageSystem user_manage_system;
    return user_manage_system;
}

std::string UserManageSystem::shunt_message(const std::string &data)
{
    string str;
    int type=atoi(DataShunt::Init().json_get(DataShunt::JsonData().TYPE, data).data());
    switch(type){
    case 0:
        str="number 1";
        break;
    case 2:
        str="number 2";
        break;
    default:
        str="unknow command";
        break;
    }
    str=DataShunt::Init().json_set(DataShunt::JsonData().DATA, str);
    str=DataShunt::Init().json_set(DataShunt::JsonData().TYPE, "0");
    return str;
}

UserManageSystem::UserManageSystem()
{

}
