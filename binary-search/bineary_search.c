//Implementation of the Binary Search Algorithm in C
//by Drew Worden

#include <stdio.h>

int main()
{
	int unsorted[] = {9,5,13,3,8,7,2,12,6,10,4,11,1};
  
  	int sorted[] =   {1,2,3,4,5,6,7,8,9,10,11,12,13};
  
  	int index = binary_search(sorted, 12, 0, 12);
  	
  	return 0;
}

int binary_search(int a[], int e, int l, int r)
{
  int mid = l + (r - l) / 2;
  
  if (l > r) return -1;
  if (a[mid] == e)
    return mid;
  else if (a[mid] > e)
    return binary_search(a, e, l, mid - 1);
  else
    return binary_search(a, e, mid + 1, r);
}