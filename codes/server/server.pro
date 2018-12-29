TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

LIBS += -lboost_system \
        -lpthread

SOURCES += \
        main.cpp \
    network/networkserver.cpp \
    entity/addressinformation.cpp \
    entity/customeraccount.cpp \
    entity/merchantaccount.cpp \
    entity/merchantservertype.cpp \
    entity/user.cpp

HEADERS += \
    network/networkserver.h \
    entity/addressinformation.h \
    entity/customeraccount.h \
    entity/merchantaccount.h \
    entity/merchantservertype.h \
    entity/user.h
