#ifndef DATASHUNT_H
#define DATASHUNT_H

#include <list>
#include <map>
#include <memory>
#include <string>
#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/json_parser.hpp>

class NetworkConnection;

class DataShunt
{
public:
    static DataShunt create();
    int get_flag(const std::string &data);
    std::string set_flag(int flag, const std::string &data);
    std::string set_date(const std::string &data);
    std::string set_data(const std::string &data);
    std::string shunt_message(std::shared_ptr<NetworkConnection> socket, const std::string &data);
private:
    DataShunt();
    std::string getTime();

    std::list<std::shared_ptr<DataShunt>> m_self;
    std::map<unsigned int, std::shared_ptr<NetworkConnection>> m_connects;
};

#endif // DATASHUNT_H
