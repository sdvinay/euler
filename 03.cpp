#include <iostream>

long LargestPrimeFactor(long long n)
{
	long long start = 2;
	while (n > start*2)
	{
		if (n%start == 0)
			n = n/start;
		else
			start++;
	}
	return n;
}


int main (int argc, char ** argv)
{
	long long n = strtoll(argv[1], NULL, 10);
	std::cout << n << std::endl;
	std::cout << LargestPrimeFactor(n) << std::endl;
}

