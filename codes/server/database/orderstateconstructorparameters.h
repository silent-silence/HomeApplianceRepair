#ifndef HAR_ORDERSTATECONSTRUCTORPARAMETERS_H
#define HAR_ORDERSTATECONSTRUCTORPARAMETERS_H

#include "../entity/order/orderpricerange.h"
#include "../entity/order/evaluate.h"
#include <chrono>

struct OrderStateConstructorParameters {
	OrderStateConstructorParameters() = default;

	OrderPriceRange range;
	unsigned long receiverId;
	double transactionPrice;
	Evaluate evaluate;
	std::chrono::system_clock::time_point date;
};

#endif //HAR_ORDERSTATECONSTRUCTORPARAMETERS_H
