#include "networkserver.h"
#include <boost/bind.hpp>
#include <iostream>

using std::cout;
using std::endl;
using std::shared_ptr;
using std::weak_ptr;
using std::make_shared;
using boost::asio::ip::tcp;
using boost::asio::io_service;
using boost::bind;

NetworkServer::NetworkServer()
{
    m_io=make_shared<io_service>();
    m_acceptor=make_shared<tcp::acceptor>(*m_io, tcp::endpoint(tcp::v4(), 1234));

    weak_ptr<tcp::socket> socket;
    accept(socket);

    m_io->run();
}

void NetworkServer::accept(weak_ptr<tcp::socket> conn)
{
    if(conn.use_count()!=0){
        m_connects.push_back(conn.lock());
        cout<<"Client:"<<conn.lock()->remote_endpoint().address()<<endl;
        cout<<"Server:"<<conn.lock()->local_endpoint().address()<<endl;
        cout<<"Count:"<<m_connects.size()<<endl;
    }
    shared_ptr<tcp::socket> socket=make_shared<tcp::socket>(*m_io);
    m_acceptor->async_accept(*socket, bind(&NetworkServer::accept, this, socket));
}
