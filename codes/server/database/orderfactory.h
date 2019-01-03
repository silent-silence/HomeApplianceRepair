
#ifndef HAR_ORDERFACTORY_H
#define HAR_ORDERFACTORY_H

#include <memory>
#include "../entity/addressinformation.h"
#include "../entity/order/orderpricerange.h"

class Order;
class OrderStateAbstractFactory;
class OrderState;
class CustomerAccount;

class OrderFactory {
public:
	std::shared_ptr<Order> readOrder(std::weak_ptr<CustomerAccount> commiter, unsigned long orderId);
	std::shared_ptr<Order> createOrder(std::weak_ptr<CustomerAccount> commiter, AddressInformation address, std::string detail, unsigned long id, OrderPriceRange range);

private:
	std::shared_ptr<OrderState> getStates(std::shared_ptr<Order> &order, unsigned long stateId, unsigned call = 0);
};

#endif //HAR_ORDERFACTORY_H
