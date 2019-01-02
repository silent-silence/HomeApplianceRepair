#ifndef NETWORKCONNECTION_H
#define NETWORKCONNECTION_H

#define MAXSIZE 1024

#include <boost/asio.hpp>
#include <memory>
#include <string>
#include <list>

class DataShunt;

class NetworkConnection : public std::enable_shared_from_this<NetworkConnection>
{
public:
    static std::shared_ptr<NetworkConnection> create(boost::asio::io_context &io, std::shared_ptr<DataShunt> &shunt);
    void start();
    void end();

    boost::asio::ip::tcp::socket &socket();

private:
    void print(const std::string &data) const;
    NetworkConnection(boost::asio::io_context &io, std::shared_ptr<DataShunt> &shunt);
    void handle_read(const boost::system::error_code &ec);
    void handle_wait_read(const boost::system::error_code &ec);
    void handle_write(const boost::system::error_code& ec, const std::string &data);
    void handle_wait_write(const boost::system::error_code& ec, const std::string &data);

    std::shared_ptr<DataShunt> _dataShunt;
    boost::asio::ip::tcp::socket m_socket;
    std::list<std::shared_ptr<std::string>> m_readData;
};

#endif // NETWORKCONNECTION_H
