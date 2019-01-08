#ifndef NETWORKCLIENT_H
#define NETWORKCLIENT_H

#include <boost/asio.hpp>
#include <memory>

class NetworkClient
{
public:
    NetworkClient();
private:
    std::shared_ptr<boost::asio::io_context> m_io;
    std::shared_ptr<boost::asio::ip::tcp::socket> m_socket;
};

#endif // NETWORKCLIENT_H
