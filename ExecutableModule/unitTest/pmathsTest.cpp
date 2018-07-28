#include "../../ExecutableModule/unitTest/include/pmaths.h"

#include <limits.h>

#include "../../ExecutableModule/unitTest/gtest/gtest.h"
namespace
{
 TEST(Addition, CanAddTwoNumbers)
  {
  EXPECT_TRUE(2+2 == 4);
  }
}
