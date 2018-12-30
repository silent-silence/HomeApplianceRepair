#ifndef HAR_USERMANAGESYSTEM_H
#define HAR_USERMANAGESYSTEM_H


class UserManageSystem {
public:
	void onlineState();
	void requestLogout();
	void requestChangeAccount();
	void requestLogin();
	void confirmState();
	void requestRegister();
	void confirmCheckAccount();
	void confirmRegister();

private:
};


#endif //HAR_USERMANAGESYSTEM_H
