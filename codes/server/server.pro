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
    network/networkserver.cpp \
    network/networkconnection.cpp \
    entity/addressinformation.cpp \
    entity/customeraccount.cpp \
    entity/merchantaccount.cpp \
    entity/merchantservertype.cpp \
    entity/user.cpp \
    entity/order/evaluate.cpp \
    entity/order/orderstartrepairstate.cpp \
    entity/order/order.cpp \
    entity/order/orderpricerange.cpp \
    entity/order/orderendrepairstate.cpp \
    entity/order/orderunreceivedstate.cpp \
    entity/order/orderreceivedstate.cpp \
    entity/order/orderfinishedstate.cpp \
    database/databaseconnection.cpp \
    database/queryresult.cpp \
    database/orderfactory.cpp \
    database/orderstartrepairstatefactory.cpp \
    database/orderendrepairstatefactory.cpp \
    database/orderunreceivedstatefactory.cpp \
    database/orderfinishedstatefactory.cpp \
    database/orderreceivedstatefactory.cpp \
    control/createorder.cpp \
    control/register.cpp \
    control/usermanagesystem.cpp \
    control/accountonlinemanager.cpp \
    control/ordermanagesystem.cpp \
    control/trackorder.cpp

HEADERS += \
    network/networkserver.h \
    network/networkconnection.h \
    entity/addressinformation.h \
    entity/customeraccount.h \
    entity/merchantaccount.h \
    entity/merchantservertype.h \
    entity/user.h \
    entity/order/orderfinishedstate.h \
    entity/order/evaluate.h \
    entity/order/order.h \
    entity/order/orderstartrepairstate.h \
    entity/order/orderstate.h \
    entity/order/orderpricerange.h \
    entity/order/orderendrepairstate.h \
    entity/order/orderunreceivedstate.h \
    entity/order/orderreceivedstate.h \
    database/orderfactory.h \
    database/databaseconnection.h \
    database/queryresult.h \
    database/orderstartrepairstatefactory.h \
    database/orderstateabstractfactory.h \
    database/orderendrepairstatefactory.h \
    database/orderstateparameters.h \
    database/orderunreceivedstatefactory.h \
    database/orderfinishedstatefactory.h \
    database/userfactory.hpp \
    database/orderreceivedstatefactory.h \
    control/accountonlinemanager.h \
    control/ordermanagesystem.h \
    control/trackorder.h \
    control/createorder.h \
    control/register.h \
    control/usermanagesystem.h

