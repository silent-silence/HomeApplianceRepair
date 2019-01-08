#include "networkclient.h"

using std::shared_ptr;
using std::make_shared;
using boost::asio::ip::tcp;
using boost::asio::io_context;
using boost::asio::ip::address;

NetworkClient::NetworkClient()
{
    m_io=make_shared<io_context>();
    m_socket=make_shared<tcp::socket>(*m_io);

    m_socket->connect(tcp::endpoint(address::from_string("193.168.1.106"), 1234));
}
