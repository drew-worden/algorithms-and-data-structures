//Implementation of the Counting Sort Algorithm in C#
//by Drew Worden

using System;

class CountingSort
{
    public static void Sort(int[] arr)
    {
        if (arr == null || arr.Length <= 1)
            return;

        int max = arr[0];
        int min = arr[0];

        for (int i = 1; i < arr.Length; i++)
        {
            if (arr[i] > max)
                max = arr[i];
            if (arr[i] < min)
                min = arr[i];
        }

        int range = max - min + 1;
        int[] count = new int[range];

        for (int i = 0; i < arr.Length; i++)
            count[arr[i] - min]++;

        int index = 0;
        for (int i = 0; i < range; i++)
        {
            while (count[i] > 0)
            {
                arr[index] = i + min;
                index++;
                count[i]--;
            }
        }
    }

    static void Main()
    {
        int[] arr = { 4, 2, 2, 8, 3, 3, 1 };
        Console.WriteLine("Original array: " + string.Join(", ", arr));
        
        Sort(arr);
        
        Console.WriteLine("Sorted array: " + string.Join(", ", arr));
    }
}
