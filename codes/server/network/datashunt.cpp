#include "datashunt.h"
#include <iostream>

using std::cout;
using std::endl;
using std::string;
using std::shared_ptr;
using std::stringstream;

using boost::property_tree::ptree;
using boost::property_tree::read_json;
using boost::property_tree::write_json;
using boost::property_tree::ptree_error;

DataShunt::DataShunt()
{

}

DataShunt DataShunt::create()
{
    static DataShunt data_shunt;
    return data_shunt;
}

string DataShunt::shunt_message(std::shared_ptr<NetworkConnection> socket, const string &data)
{
    string str;
    switch(get_flag(data)){
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
    str=set_flag(1 ,set_date(set_data(str)));
    return str;
}

string DataShunt::getTime()
{
    time_t timep;
    time (&timep);
    char tmp[64];
    strftime(tmp, sizeof(tmp), "%Y-%m-%d %H:%M:%S",localtime(&timep));
    return string(tmp);
}

int DataShunt::get_flag(const std::string &data)
{
    stringstream str(data);
    ptree json;
    try{
        read_json(str, json);
    } catch (ptree_error &e) {
        cout<<"json_error:"<<e.what()<<endl;
    }
    return json.get<int>("flag");
}

string DataShunt::set_flag(int flag, const string &data)
{
    stringstream s1(data);
    ptree json;
    try{
        read_json(s1, json);
        json.put("flag", flag);
    } catch (ptree_error &e) {
        cout<<"json_error:"<<e.what()<<endl;
    }
    stringstream s2;
    write_json(s2, json);
    return string(s2.str());
}

string DataShunt::set_date(const string &data)
{
    stringstream s1(data);
    ptree json;
    try{
        read_json(s1, json);
        json.put("date", getTime());
    } catch (ptree_error &e) {
        cout<<"json_error:"<<e.what()<<endl;
    }
    stringstream s2;
    write_json(s2, json);
    return string(s2.str());
}

string DataShunt::set_data(const string &data)
{
    string str="{}";
    stringstream s1(str);
    ptree json;
    try{
        read_json(s1, json);
        json.put("data", data);
    } catch (ptree_error &e) {
        cout<<"json_error:"<<e.what()<<endl;
    }
    stringstream s2;
    write_json(s2, json);
    return string(s2.str());
}
