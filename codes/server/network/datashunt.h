#ifndef DATASHUNT_H
#define DATASHUNT_H

#include <map>
#include <memory>
#include <string>
#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/json_parser.hpp>

struct JSONDATA{
    std::string TYPE="type";
    std::string DATE="date";
    std::string DATA="data";
};

struct JSONORDER{
    std::string Id="id";
    std::string Date="date";
};

struct JSONUSER{
    std::string Id="id";
};

struct JSONMESSAGE{
    std::string Id="id";
};

class NetworkConnection;

class DataShunt
{
public:
    static DataShunt &Init();
    static JSONDATA &JsonData();
    static JSONUSER &JsonUser();
    static JSONORDER &JsonOrder();
    static JSONMESSAGE &JsonMessage();

    std::string shunt_message(std::shared_ptr<NetworkConnection> socket, const std::string &data);

    std::string json_set(const std::string &flag, const std::string &value, const std::string &data="{}");
    std::string json_get(const std::string &flag, const std::string &data);

private:
    DataShunt();
    std::string getTime();

    time_t timep;
    std::map<unsigned int, std::shared_ptr<NetworkConnection>> m_connects;
};

#endif // DATASHUNT_H
