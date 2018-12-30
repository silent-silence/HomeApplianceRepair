#include <iostream>
#include <memory>
#include "entity/order/order.h"
#include "entity/addressinformation.h"
#include "entity/merchantaccount.h"
#include "entity/order/evaluate.h"

using std::shared_ptr;			using std::make_shared;
using std::cout;

int main()
{
	shared_ptr<Order> o = make_shared<Order>(AddressInformation(), "detail", 123456789);

	o->publishTheOrder(OrderPriceRange(1, 5));
	o->receivedBy(make_shared<MerchantAccount>());
	o->startRepair();
	o->endRepair(43);
	Evaluate eva;
	o->setEvaluate(eva);
	o->orderFinished();

	cout << o->priceRange().priceLow() << " " << o->priceRange().priceHigh() << '\n';
	cout << o->transaction() << '\n';
	eva = o->evaluate();

	return 0;
}