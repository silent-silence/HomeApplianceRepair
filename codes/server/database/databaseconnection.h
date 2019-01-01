#ifndef HAR_DATABASE_H
#define HAR_DATABASE_H

#include <mariadb/mysql.h>
#include <tuple>

class AddressInformation;
class OrderStateConstructorParameters;

class DatabaseConnection {
public:
	static DatabaseConnection &getInstance();

	//void test();
	std::tuple<AddressInformation, std::string, unsigned long> queryOrderById(unsigned long orderId);

	/* in std::tuple<std::string, bool>
	 * 0 std::string for order type
	 * 1 bool for whether the order state has a last state
	 * 2 unsigned int for order state id
	 */
	std::tuple<std::string, bool, unsigned int, OrderStateConstructorParameters>
		queryOrderStateByOrderId(unsigned long orderId);
	std::tuple<std::string, bool, unsigned int, OrderStateConstructorParameters>
		queryOrderStateByOrderIdAndNextState(unsigned long orderId, unsigned nextState);

private:
	DatabaseConnection();
	~DatabaseConnection();

	//throw exception
	void errorHappen(std::string err);

	unsigned long toUnsignedLong(std::string str);
	double toDouble(std::string str);

	static DatabaseConnection m_instance;
	static MYSQL *m_mysqlConnection;
};

#endif //HAR_DATABASE_H
