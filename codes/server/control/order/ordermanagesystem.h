#ifndef HAR_ORDERMANAGESYSTEM_H
#define HAR_ORDERMANAGESYSTEM_H


class OrderManageSystem {
public:
	void requestUploadOrder();
	void requestQueryOrder();
	void requestStartRepair();
	void requestEndRepair();
	void requestPayOrder();
	void chooseCreateOrder();
	void requestAcceptOrder();
	void confirmCreateOrder();
	void confirmSelectOrder();
};


#endif //HAR_ORDERMANAGESYSTEM_H
