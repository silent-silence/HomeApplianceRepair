#include "accountregistermanager.h"
#include "../../network/datashunt.h"

using std::string;

AccountRegisterManager &AccountRegisterManager::Init()
{
    static AccountRegisterManager account_register_manager;
    return account_register_manager;
}

string AccountRegisterManager::shunt_message(const string &data)
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

AccountRegisterManager::AccountRegisterManager()
{

}
