//
// Created by gaojian on 19-1-1.
//

#ifndef HAR_ORDERSTATEFACTORY_H
#define HAR_ORDERSTATEFACTORY_H

#include <memory>
#include "../entity/order/orderpricerange.h"

class OrderState;
class Order;
class MerchantAccount;

class OrderStateFactory {
public:
	std::shared_ptr<OrderState> readStatesForOrder(std::weak_ptr<Order> order, unsigned long nextState = 0);
};

#endif //HAR_ORDERSTATEFACTORY_H
