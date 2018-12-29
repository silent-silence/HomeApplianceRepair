#ifndef MERCHANTACCOUNT_H
#define MERCHANTACCOUNT_H

#include "user.h"
#include <memory>

class AddressInformation;
class MerchantServerType;

class MerchantAccount : public User
{
public:
    MerchantAccount();
private:
    std::shared_ptr<AddressInformation> m_address;
    std::shared_ptr<MerchantServerType> m_serverType;

};

#endif // MERCHANTACCOUNT_H
