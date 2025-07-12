#include <algorithm>
#include <functional>
#include <iostream>

int main()
{
    // 原始代码
    auto add       = [](int a, int b) -> int { return a + b; };
    int  sum       = add(3, 5);
    auto print_sum = [sum]() -> void { std::cout << "3 + 5 = " << sum << std::endl; };
    print_sum();

    // 正确的写法 - 使用auto
    auto add1 = [](int a, int b) -> int { return a + b; };
    std::cout << "使用auto声明: add1(3, 5) = " << add1(3, 5) << std::endl;

    // 错误的写法 - 使用int
    // int add2 = [](int a, int b) -> int { return a + b; };  // 这会报错！
    std::cout << "int类型无法直接接收lambda表达式，因为lambda有自己的类型！" << std::endl;

    // 正确的写法 - 使用std::function
    std::function<int(int, int)> add3 = [](int a, int b) -> int { return a + b; };
    std::cout << "使用std::function声明: add3(3, 5) = " << add3(3, 5) << std::endl;

    return 0;
}
