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
    database/orderstatefactory.cpp

HEADERS += \
    network/networkserver.h \
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
    database/orderstatefactory.h\
    database/databaseconnection.h \
    database/orderstateconstructorparameters.h \
    database/queryresult.h
