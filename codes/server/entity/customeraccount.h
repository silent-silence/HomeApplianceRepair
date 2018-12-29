#ifndef CUSTOMERACCOUNT_H
#define CUSTOMERACCOUNT_H

#include "user.h"
#include <list>
#include <memory>

class AddressInformation;

class CustomerAccount : public User
{
public:
    CustomerAccount();
private:
    std::list<std::shared_ptr<AddressInformation>> m_address;
};

#endif // CUSTOMERACCOUNT_H
