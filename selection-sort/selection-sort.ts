//Implementation of the Selection Sort Algorithm in TypeScript
//by Drew Worden

function selectionSort(arr: number[]): number[] {
	const n = arr.length

	for (let i = 0; i < n - 1; i++) {
		let minIndex = i

		for (let j = i + 1; j < n; j++) {
			if (arr[j] < arr[minIndex]) {
				minIndex = j
			}
		}

		if (minIndex !== i) {
			;[arr[i], arr[minIndex]] = [arr[minIndex], arr[i]]
		}
	}

	return arr
}

const arr = [64, 25, 12, 22, 11]
console.log("Original array:", arr)
const sortedArr = selectionSort(arr)
console.log("Sorted array:", sortedArr)
