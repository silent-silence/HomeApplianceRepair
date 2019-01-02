#ifndef NETWORKSERVER_H
#define NETWORKSERVER_H

#define PORT 8888

#include <boost/asio.hpp>
#include <memory>

class DataShunt;
class NetworkConnection;

class NetworkServer : public boost::asio::io_service
{
public:
    NetworkServer(std::shared_ptr<DataShunt> &shunt);

    void start();
    void end();

    std::shared_ptr<boost::asio::ip::tcp::acceptor> acceptor() const;
    void setAcceptor(const std::shared_ptr<boost::asio::ip::tcp::acceptor> &acceptor);

private:
    void handle_acceptor();
    void handle_wait_acceptor(const boost::system::error_code &ec, const std::shared_ptr<NetworkConnection> &conn);
    std::shared_ptr<boost::asio::ip::tcp::acceptor> m_acceptor;
    std::shared_ptr<DataShunt> _dataShunt;
};

#endif // NETWORKSERVER_H
