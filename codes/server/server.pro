TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

LIBS += -lboost_system \
        -lpthread \
        -L/usr/local/mariadb/mariadb-connector-c/lib/mariadb -lmariadb

INCLUDEPATH += /usr/local/mariadb/mariadb-connector-c/include

SOURCES += \
        main.cpp \
    network/datashunt.cpp \
    network/networkconnection.cpp \
    network/networkserver.cpp \
    entity/user/addressinformation.cpp \
    entity/user/customeraccount.cpp \
    entity/user/merchantaccount.cpp \
    entity/user/merchantservertype.cpp \
    entity/user/user.cpp \
    entity/order/evaluate.cpp \
    entity/order/order.cpp \
    entity/order/orderendrepairstate.cpp \
    entity/order/orderfinishedstate.cpp \
    entity/order/orderpricerange.cpp \
    entity/order/orderreceivedstate.cpp \
    entity/order/orderstartrepairstate.cpp \
    entity/order/orderunreceivedstate.cpp \
    database/databaseconnection.cpp \
    database/orderendrepairstatefactory.cpp \
    database/orderfactory.cpp \
    database/orderfinishedstatefactory.cpp \
    database/orderreceivedstatefactory.cpp \
    database/orderstartrepairstatefactory.cpp \
    database/orderunreceivedstatefactory.cpp \
    database/queryresult.cpp \
    control/order/createorder.cpp \
    control/order/ordermanagesystem.cpp \
    control/order/trackorder.cpp \
    control/user/accountonlinemanager.cpp \
    control/user/accountregistermanager.cpp \
    control/user/register.cpp \
    control/user/usermanagesystem.cpp

HEADERS += \
    network/datashunt.h \
    network/networkconnection.h \
    network/networkserver.h \
    entity/user/addressinformation.h \
    entity/user/customeraccount.h \
    entity/user/merchantaccount.h \
    entity/user/merchantservertype.h \
    entity/user/user.h \
    entity/order/evaluate.h \
    entity/order/order.h \
    entity/order/orderendrepairstate.h \
    entity/order/orderfinishedstate.h \
    entity/order/orderpricerange.h \
    entity/order/orderreceivedstate.h \
    entity/order/orderstartrepairstate.h \
    entity/order/orderstate.h \
    entity/order/orderunreceivedstate.h \
    database/databaseconnection.h \
    database/orderendrepairstatefactory.h \
    database/orderfactory.h \
    database/orderfinishedstatefactory.h \
    database/orderreceivedstatefactory.h \
    database/orderstartrepairstatefactory.h \
    database/orderstateabstractfactory.h \
    database/orderstateparameters.h \
    database/orderunreceivedstatefactory.h \
    database/queryresult.h \
    database/userfactory.hpp \
    control/order/createorder.h \
    control/order/ordermanagesystem.h \
    control/order/trackorder.h \
    control/user/accountonlinemanager.h \
    control/user/accountregistermanager.h \
    control/user/register.h \
    control/user/usermanagesystem.h
