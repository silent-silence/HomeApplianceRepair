#ifndef USER_H
#define USER_H

#include <string>

typedef int StateFlag;

class User
{
public:
    User();
    unsigned long id() const;
    void setId(unsigned long id);

    std::string name() const;
    void setName(const std::string &name);

    std::string passwd() const;
    void setPasswd(const std::string &passwd);

    std::string email() const;
    void setEmail(const std::string &email);

    StateFlag state() const;
    void setState(const StateFlag &state);

private:
    unsigned long int m_id;
    std::string m_name;
    std::string m_passwd;
    std::string m_email;
    StateFlag m_state;
};

#endif // USER_H
