#include <iostream>
#include "networkserver.h"
#include "datashunt.h"
#include <time.h>

using std::cout;
using std::endl;
using std::string;
using std::make_shared;
using std::shared_ptr;

int main()
{
    shared_ptr<NetworkServer>a(new NetworkServer());
    a->start();
    return 0;
}
