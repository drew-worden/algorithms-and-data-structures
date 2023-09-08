<!--Implementation of the Bucket Sort Algorithm in PHP-->
<!--by Drew Worden-->

<?php

function bucketSort($arr)
{
    if (empty($arr)) {
        return $arr;
    }

    $minValue = min($arr);
    $maxValue = max($arr);

    $range = $maxValue - $minValue;

    $bucketCount = count($arr);
    $buckets = array_fill(0, $bucketCount, []);

    foreach ($arr as $element) {
        $index = floor(($element - $minValue) / ($range / ($bucketCount - 1)));
        array_push($buckets[$index], $element);
    }

    foreach ($buckets as &$bucket) {
        sort($bucket);
    }

    $sortedArray = [];
    foreach ($buckets as $bucket) {
        $sortedArray = array_merge($sortedArray, $bucket);
    }

    return $sortedArray;
}

$arr = [12, 11, 13, 5, 6, 7];
echo "Original array: " . implode(", ", $arr) . "\n";
$sortedArray = bucketSort($arr);
echo "Sorted array: " . implode(", ", $sortedArray) . "\n";
