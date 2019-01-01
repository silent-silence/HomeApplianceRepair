cmake_minimum_required(VERSION 3.13)
project(HAR)

set(CMAKE_CXX_STANDARD 17)
include_directories(/usr/local/mariadb/mariadb-connector-c/include)
link_directories(/usr/local/mariadb/mariadb-connector-c/lib/mariadb)

add_executable(HAR main.cpp entity/order/order.cpp entity/order/order.h entity/order/orderstate.h entity/order/orderunreceivedstate.cpp entity/order/orderunreceivedstate.h entity/order/orderreceivedstate.cpp entity/order/orderreceivedstate.h entity/order/orderstartrepairstate.cpp entity/order/orderstartrepairstate.h entity/order/orderendrepairstate.cpp entity/order/orderendrepairstate.h entity/order/evaluate.cpp entity/order/evaluate.h control/usermanagesystem.cpp control/usermanagesystem.h control/accountonlinemanager.cpp control/accountonlinemanager.h control/register.cpp control/register.h control/ordermanagesystem.cpp control/ordermanagesystem.h control/createorder.cpp control/createorder.h control/trackorder.cpp control/trackorder.h entity/order/orderpricerange.cpp entity/order/orderpricerange.h entity/order/orderfinishedstate.cpp entity/order/orderfinishedstate.h entity/addressinformation.cpp entity/addressinformation.h entity/customeraccount.cpp entity/customeraccount.h entity/merchantaccount.cpp entity/merchantaccount.h entity/merchantservertype.cpp entity/merchantservertype.h entity/user.cpp entity/user.h database/databaseconnection.cpp database/databaseconnection.h database/queryresult.cpp database/queryresult.h database/orderfactory.cpp database/orderfactory.h database/orderstatefactory.cpp database/orderstatefactory.h database/orderstateconstructorparameters.h)

target_link_libraries(HAR -lmariadb)