#include <iostream>
#include <memory>
#include "entity/order/order.h"
#include "entity/addressinformation.h"
#include "entity/merchantaccount.h"
#include "entity/order/evaluate.h"
#include "database/orderfactory.h"

using std::shared_ptr;			using std::make_shared;
using std::cout;

int main()
{
	OrderFactory factory;
	//shared_ptr<Order> o = factory.createOrder(AddressInformation(), "detail", 123456789, OrderPriceRange(12, 54));
	shared_ptr<Order> o = factory.readOrder(1234);

	/*o->receivedBy(make_shared<MerchantAccount>());
	o->startRepair();
	o->endRepair(43);
	Evaluate eva;
	o->setEvaluate(eva);
	o->orderFinished();*/

	cout << o->priceRange().priceLow() << " " << o->priceRange().priceHigh() << '\n';
	cout << o->transaction() << '\n';
	Evaluate eva = o->evaluate();

	return 0;
}