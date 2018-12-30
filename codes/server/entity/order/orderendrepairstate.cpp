#include "orderendrepairstate.h"
#include "orderfinishedstate.h"
#include "order.h"

using std::chrono::system_clock;		using std::runtime_error;
using std::make_shared;

OrderEndRepairState::OrderEndRepairState(std::weak_ptr<Order> order, double transactionPrice, std::weak_ptr<OrderState> lastState)
		: m_order{order}, m_transaction{transactionPrice}, m_lastState{lastState}
{
	m_stateChangeDate = system_clock::now();
}

void OrderEndRepairState::receivedBy(std::weak_ptr<MerchantAccount> receiver)
{
	throw runtime_error("Order state not fit");
}

void OrderEndRepairState::startRepair()
{
	throw runtime_error("Order state not fit");
}

void OrderEndRepairState::endRepair(double transactionPrice)
{
	throw runtime_error("Order state not fit");
}

void OrderEndRepairState::orderFinished()
{
	m_order.lock()->m_endRepairState = shared_from_this();
	m_order.lock()->setState(make_shared<OrderFinishedState>(m_order, weak_from_this()));
}

OrderPriceRange OrderEndRepairState::priceRange() const
{
	return m_lastState.lock()->priceRange();
}

double OrderEndRepairState::transaction() const
{
	return m_transaction;
}

void OrderEndRepairState::setEvaluate(Evaluate &evaluate)
{
	m_evaluate = evaluate;
}

Evaluate OrderEndRepairState::evaluate() const
{
	return m_evaluate;
}

std::chrono::system_clock::time_point OrderEndRepairState::date() const
{
	return m_stateChangeDate;
}