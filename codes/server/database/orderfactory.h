
#ifndef HAR_ORDERFACTORY_H
#define HAR_ORDERFACTORY_H

#include <memory>
#include "../entity/addressinformation.h"
#include "../entity/order/orderpricerange.h"

class Order;
class OrderStateFactory;

class OrderFactory {
public:
	OrderFactory();

	std::shared_ptr<Order> readOrder(unsigned long orderId);
	std::shared_ptr<Order> createOrder(AddressInformation address, std::string detail, unsigned long id, OrderPriceRange range);

private:
	std::shared_ptr<OrderStateFactory> m_stateFactory;
};

#endif //HAR_ORDERFACTORY_H
