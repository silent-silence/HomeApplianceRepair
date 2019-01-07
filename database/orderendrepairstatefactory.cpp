#include "orderendrepairstatefactory.h"
#include "../entity/order/order.h"
#include "../entity/order/orderendrepairstate.h"
#include "orderstateparameters.h"

using std::make_shared;

std::shared_ptr<OrderState> OrderEndRepairStateFactory::readStateForOrder(std::weak_ptr<Order> order, OrderStateParameters &parameters)
{
	auto endRepair = make_shared<OrderEndRepairState>(order, parameters.lastState, parameters.transactionPrice, parameters.evaluate, parameters.date);
	order.lock()->m_endRepairState = endRepair;
	return endRepair;
}