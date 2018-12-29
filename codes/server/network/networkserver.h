#ifndef NETWORKSERVER_H
#define NETWORKSERVER_H

#include <boost/asio.hpp>
#include <list>

class NetworkServer
{
public:
    NetworkServer();
private:
    void accept(std::weak_ptr<boost::asio::ip::tcp::socket> conn);
    std::shared_ptr<boost::asio::io_service> m_io;
    std::shared_ptr<boost::asio::ip::tcp::acceptor> m_acceptor;
    std::list<std::shared_ptr<boost::asio::ip::tcp::socket>> m_connects;
};

#endif // NETWORKSERVER_H
