//
// Created by gaojian on 18-12-31.
//

#include "orderfactory.h"
#include "orderstatefactory.h"
#include "databaseconnection.h"
#include "../entity/order/order.h"
#include "../entity/order/orderstate.h"
#include <tuple>

using std::make_shared;			using std::get;
using std::shared_ptr;

OrderFactory::OrderFactory()
{
	m_stateFactory = make_shared<OrderStateFactory>();
}

std::shared_ptr<Order> OrderFactory::readOrder(unsigned long orderId)
{
	auto orderInfo = DatabaseConnection::getInstance().queryOrderById(orderId);
	shared_ptr<Order> newOrder = make_shared<Order>(get<0>(orderInfo), get<1>(orderInfo), get<2>(orderInfo));

	m_stateFactory->readStatesForOrder(newOrder);

	return newOrder;
}

std::shared_ptr<Order> OrderFactory::createOrder(AddressInformation address, std::string detail, unsigned long id, OrderPriceRange range)
{
	shared_ptr<Order> newOrder = make_shared<Order>(address, detail, id);
	newOrder->orderInitState(range);
	return newOrder;
}