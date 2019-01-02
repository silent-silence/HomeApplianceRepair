#include "networkconnection.h"
#include "datashunt.h"
#include <boost/bind.hpp>
#include <iostream>

using std::cout;
using std::endl;
using std::string;
using std::shared_ptr;

using boost::bind;
using boost::asio::buffer;
using boost::asio::ip::tcp;
using boost::asio::io_context;
using boost::system::error_code;
using boost::asio::placeholders::error;

NetworkConnection::NetworkConnection(io_context &io, std::shared_ptr<DataShunt> &shunt)
    :m_socket{io}
{
    _dataShunt=shunt;
}

void NetworkConnection::handle_read(const error_code& ec)
{
    if(!ec){
        m_socket.async_wait(tcp::socket::wait_read, bind(&NetworkConnection::handle_wait_read, shared_from_this(), error));
    }
    else{
        cout<<"@read: "<<ec.message()<<endl;
        end();
    }
}

void NetworkConnection::handle_wait_read(const error_code &ec)
{
    if(!ec){
        shared_ptr<string> data(new string(MAXSIZE, 0));
        m_readData.push_back(data);
        m_socket.async_read_some(buffer(*data), bind(&NetworkConnection::handle_read, shared_from_this(), error));
    }
    else{
        cout<<"@wait_read: "<<ec.message()<<endl;
        end();
    }
}

void NetworkConnection::handle_write(const error_code &ec, const string &data)
{
    if(!ec){
        m_socket.async_wait(tcp::socket::wait_write, bind(&NetworkConnection::handle_wait_write, shared_from_this(), error, data));
    }
    else{
        cout<<m_socket.local_endpoint().address()<<"@write: "<<ec.message()<<endl;
    }
}

void NetworkConnection::handle_wait_write(const error_code &ec, const string &data)
{
    if(!ec){
        m_socket.async_write_some(buffer(data.data(), data.size()), bind(&NetworkConnection::print, shared_from_this(), data));
    }
    else{
        cout<<m_socket.local_endpoint().address()<<"@wait_write: "<<ec.message()<<endl;
    }
}

tcp::socket &NetworkConnection::socket()
{
    return m_socket;
}

void NetworkConnection::print(const std::string &data) const
{
    cout<<data<<endl;
}

std::shared_ptr<NetworkConnection> NetworkConnection::create(boost::asio::io_context &io, std::shared_ptr<DataShunt> &shunt)
{
    return shared_ptr<NetworkConnection>(new NetworkConnection(io, shunt));
}

void NetworkConnection::start()
{
    cout<<"start: "<<shared_from_this().use_count()<<endl;
    m_socket.async_wait(tcp::socket::wait_read, bind(&NetworkConnection::handle_wait_read, shared_from_this(), error));
}

void NetworkConnection::end()
{
    m_readData.clear();
    cout<<"end: "<<shared_from_this().use_count()<<endl;
    for(auto &i:m_readData){
        cout<<"read: "<<i->data()<<endl;
    }
}
