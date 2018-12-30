#ifndef HAR_ENDREPAIRORDERSTATE_H
#define HAR_ENDREPAIRORDERSTATE_H

#include "orderstate.h"
#include "evaluate.h"

class Order;

class OrderEndRepairState : public OrderState, public std::enable_shared_from_this<OrderEndRepairState> {
public:
	OrderEndRepairState(std::weak_ptr<Order> order, double transactionPrice, std::weak_ptr<OrderState> lastState);

	void receivedBy(std::weak_ptr<MerchantAccount> receiver) override;
	void startRepair() override;
	void endRepair(double transactionPrice) override;
	void orderFinished() override;

	OrderPriceRange priceRange() const override;
	double transaction() const override;
	void setEvaluate(Evaluate &evaluate) override;
	Evaluate evaluate() const override;
	std::chrono::system_clock::time_point date() const override;

private:
	std::chrono::system_clock::time_point m_stateChangeDate;
	std::weak_ptr<Order> m_order;
	std::weak_ptr<OrderState> m_lastState;
	Evaluate m_evaluate;
	double m_transaction;
};

#endif //HAR_ENDREPAIRORDERSTATE_H
