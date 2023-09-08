//Implementation of the Bubble Sort Algorithm in C
//by Drew Worden

#include <stdio.h>

void bubbleSort(int arr[], int n)
{
	int temp;
	int swapped;

	for (int i = 0; i < n - 1; i++)
	{
		swapped = 0;

		for (int j = 0; j < n - 1 - i; j++)
		{
			if (arr[j] > arr[j + 1])
			{
				temp = arr[j];
				arr[j] = arr[j + 1];
				arr[j + 1] = temp;
				swapped = 1;
			}
		}

		if (swapped == 0)
		{
			break;
		}
	}
}

int main()
{
	int arr[] = {64, 34, 25, 12, 22, 11, 90};
	int n = sizeof(arr) / sizeof(arr[0]);

	printf("Original array: ");
	for (int i = 0; i < n; i++)
	{
		printf("%d ", arr[i]);
	}
	printf("\n");

	bubbleSort(arr, n);

	printf("Sorted array: ");
	for (int i = 0; i < n; i++)
	{
		printf("%d ", arr[i]);
	}
	printf("\n");

	return 0;
}
