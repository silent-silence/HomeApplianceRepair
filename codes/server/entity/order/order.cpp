#include "order.h"
#include "orderunreceivedstate.h"
#include <stdexcept>

using std::make_shared;				using std::runtime_error;

Order::Order(AddressInformation address, std::string detail, unsigned long int id)
	: m_address{address}, m_detail{detail}, m_id{id}
{}

void Order::loadStates(std::shared_ptr<OrderState> current, std::shared_ptr<OrderState> unreceived,
					   std::shared_ptr<OrderState> received, std::shared_ptr<OrderState> startRepair,
					   std::shared_ptr<OrderState> endRepair, std::shared_ptr<OrderState> finished)
{
	m_currentState = std::move(current);
	m_unreceivedState = std::move(unreceived);
	m_receivedState = std::move(received);
	m_startRepairState = std::move(startRepair);
	m_endRepairState = std::move(endRepair);
	m_finishedState = std::move(finished);
}

void Order::publishTheOrder(OrderPriceRange range)
{
	if(m_unreceivedState)
		throw runtime_error("Can not publish an order twice");
	m_currentState = make_shared<OrderUnreceivedState>(shared_from_this(), range);
}

void Order::receivedBy(std::weak_ptr<MerchantAccount> receiver)
{
	m_currentState->receivedBy(receiver);
}

void Order::startRepair()
{
	m_currentState->startRepair();
}

void Order::endRepair(double transactionPrice)
{
	m_currentState->endRepair(transactionPrice);
}

void Order::orderFinished()
{
	m_currentState->orderFinished();
}

OrderPriceRange Order::priceRange()
{
	return m_currentState->priceRange();
}

double Order::transaction()
{
	return m_currentState->transaction();
}

void Order::setEvaluate(Evaluate &evaluate)
{
	m_currentState->setEvaluate(evaluate);
}

Evaluate Order::evaluate()
{
	return m_currentState->evaluate();
}

std::chrono::system_clock::time_point Order::createDate()
{
	if(!m_unreceivedState)
		throw runtime_error("The order not passing unreceived state");
	return m_unreceivedState->date();
}

std::chrono::system_clock::time_point Order::receiveDate()
{
	if(!m_receivedState)
		throw runtime_error("The order not passing received state");
	return m_receivedState->date();
}

std::chrono::system_clock::time_point Order::startRepairDate()
{
	if(!m_startRepairState)
		throw runtime_error("The order not passing start repair state");
	return m_startRepairState->date();
}

std::chrono::system_clock::time_point Order::endRepairDate()
{
	if(!m_endRepairState)
		throw runtime_error("The order not passing end repair state");
	return m_endRepairState->date();
}

void Order::setState(std::shared_ptr<OrderState> state)
{
	m_currentState = state;
}