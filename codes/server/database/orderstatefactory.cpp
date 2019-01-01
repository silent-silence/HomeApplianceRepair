//
// Created by gaojian on 19-1-1.
//

#include "orderstatefactory.h"
#include "databaseconnection.h"
#include "../entity/order/order.h"
#include "../entity/order/orderunreceivedstate.h"
#include "../entity/order/orderreceivedstate.h"
#include "orderstateconstructorparameters.h"
#include "../entity/order/orderstartrepairstate.h"
#include "../entity/order/orderendrepairstate.h"
#include "../entity/order/orderfinishedstate.h"

using std::get;				using std::shared_ptr;
using std::make_shared;

shared_ptr<OrderState> OrderStateFactory::readStatesForOrder(std::weak_ptr<Order> order, unsigned long nextState)
{
	std::tuple<std::string, bool, unsigned int, OrderStateConstructorParameters> currentStateInfo;

	if(nextState == 0)		//called by user
		currentStateInfo = DatabaseConnection::getInstance().queryOrderStateByOrderId(order.lock()->id());
	else					//recursion call
		currentStateInfo = DatabaseConnection::getInstance().queryOrderStateByOrderIdAndNextState(order.lock()->id(), nextState);

	//has last state
	shared_ptr<OrderState> lastState;
	if(get<1>(currentStateInfo))
		lastState = readStatesForOrder(order, get<2>(currentStateInfo));

	//create state from different types
	shared_ptr<OrderState> current;
	if(get<0>(currentStateInfo) == "unreceived")
		order.lock()->m_unreceivedState = current = make_shared<OrderUnreceivedState>(order, get<3>(currentStateInfo).range);
	else if(get<0>(currentStateInfo) == "received")
	{
		//TODO
		std::shared_ptr<MerchantAccount> receiver;// = findReceiver();
		order.lock()->m_receivedState = current = make_shared<OrderReceivedState>(order, receiver, lastState);
	}
	else if(get<0>(currentStateInfo) == "startRepair")
		order.lock()->m_startRepairState = current = make_shared<OrderStartRepairState>(order, lastState);
	else if(get<0>(currentStateInfo) == "endRepair")
	{
		order.lock()->m_endRepairState = current = make_shared<OrderEndRepairState>(
				order, get<3>(currentStateInfo).transactionPrice, lastState);
		order.lock()->m_endRepairState->setEvaluate(get<3>(currentStateInfo).evaluate);
	}
	else if(get<0>(currentStateInfo) == "finished")
		order.lock()->m_finishedState = current = make_shared<OrderFinishedState>(order, lastState);

	if(nextState == 0)
		order.lock()->m_currentState = current;

	return current;
}
