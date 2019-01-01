#include "databaseconnection.h"
#include "queryresult.h"
#include "../entity/addressinformation.h"
#include "orderstateconstructorparameters.h"
#include <stdexcept>
#include <string>
#include <sstream>
#include <chrono>

using std::string;			using std::runtime_error;
using std::tuple;			using std::istringstream;
using std::ostringstream;

DatabaseConnection DatabaseConnection::m_instance;
MYSQL * DatabaseConnection::m_mysqlConnection;

DatabaseConnection::DatabaseConnection()
{
	m_mysqlConnection = mysql_init(NULL);
	if (!mysql_real_connect(m_mysqlConnection, "118.24.113.76",
							"HAR", "HomeApplianceRepair", "HAR", 3306, "/run/mysqld/mysqld.sock", 0))
		errorHappen("DatabaseConnection connection error, ");
}

DatabaseConnection::~DatabaseConnection()
{
	mysql_close(m_mysqlConnection);
}

DatabaseConnection &DatabaseConnection::getInstance()
{
	return m_instance;
}

/*void DatabaseConnection::test()
{
	string query{"select * from HAROrder"};
	if(mysql_real_query(m_mysqlConnection, query.data(), query.length()))
	{
		string error{"Test error, "};
		error += mysql_error(m_mysqlConnection);
		throw runtime_error(error);
	}
	MYSQL_RES *res = mysql_store_result(m_mysqlConnection);
	MYSQL_ROW row;
	unsigned rlen = mysql_num_fields(res);
	while((row = mysql_fetch_row(res)))
	{
		for (unsigned i = 0; i < rlen; ++i)
			cout << row[i] << ' ';
		cout << "\n";
	}

	mysql_free_result(res);
}*/

void DatabaseConnection::errorHappen(std::string err)
{
	err += mysql_error(m_mysqlConnection);
	throw runtime_error(err);
}

std::tuple<AddressInformation, std::string, unsigned long>
	DatabaseConnection::queryOrderById(unsigned long orderId)
{
	string query{"select * from HAROrder"};
	if(mysql_real_query(m_mysqlConnection, query.data(), query.length()))
		errorHappen("Query order by id");
	QueryResult result = mysql_store_result(m_mysqlConnection);
	auto res = result.fetch_a_row();

	if(res.empty())
		errorHappen("Query order by id result error");

	unsigned long id = toUnsignedLong(res[0]);
	string detail = res[1];
	return tuple<AddressInformation, std::string, unsigned long>{AddressInformation(), detail, id};
}

std::tuple<std::string, bool, unsigned int, OrderStateConstructorParameters>
		DatabaseConnection::queryOrderStateByOrderId(unsigned long orderId)
{
	ostringstream ostr;
	ostr << "select * from OrderState where orderId='" << orderId << "'";
	string query = ostr.str();
	if(mysql_real_query(m_mysqlConnection, query.data(), query.length()))
		errorHappen("Query order state by id");

	QueryResult result = mysql_store_result(m_mysqlConnection);
	auto res = result.fetch_a_row();

	if(res.empty())
		errorHappen("Query order state by id result error");

	OrderStateConstructorParameters parameters;
	double priceLow = toDouble(res[3]);
	double priceHigh = toDouble(res[4]);
	parameters.range = OrderPriceRange(priceLow, priceHigh);

	//TODO
	std::chrono::system_clock::time_point date;// = toUnsignedLong(res[0]);
	parameters.date = date;

	double transaction = toDouble(res[2]);
	parameters.transactionPrice = transaction;

	string type = res[5];
	unsigned long stateId = toUnsignedLong(res[6]);
	bool hasLastState = false;

	return tuple<string, bool, unsigned int, OrderStateConstructorParameters>(
			type, hasLastState, stateId, parameters);
}

std::tuple<std::string, bool, unsigned int, OrderStateConstructorParameters>
DatabaseConnection::queryOrderStateByOrderIdAndNextState(unsigned long orderId, unsigned nextState)
{
	ostringstream ostr;
	ostr << "select * from OrderState where orderId='" << orderId << "' and stateId='" << nextState << "'";
	string query = ostr.str();
	if(mysql_real_query(m_mysqlConnection, query.data(), query.length()))
		errorHappen("Query order state by id");

	QueryResult result = mysql_store_result(m_mysqlConnection);
	auto res = result.fetch_a_row();

	if(res.empty())
		errorHappen("Query order state by id result error");

	OrderStateConstructorParameters parameters;
	double priceLow = toDouble(res[3]);
	double priceHigh = toDouble(res[4]);
	parameters.range = OrderPriceRange(priceLow, priceHigh);

	//TODO
	std::chrono::system_clock::time_point date;// = toUnsignedLong(res[0]);
	parameters.date = date;

	double transaction = toDouble(res[2]);
	parameters.transactionPrice = transaction;

	string type = res[5];
	unsigned long stateId = toUnsignedLong(res[6]);
	bool hasLastState = false;

	return tuple<string, bool, unsigned int, OrderStateConstructorParameters>(
			type, hasLastState, stateId, parameters);
}

unsigned long DatabaseConnection::toUnsignedLong(std::string str)
{
	istringstream is(str);
	unsigned long ret;
	is >> ret;
	return ret;
}

double DatabaseConnection::toDouble(std::string str)
{
	istringstream is(str);
	double ret;
	is >> ret;
	return ret;
}
