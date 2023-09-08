#Implementation of the Merge Sort Algorithm in Perl
#by Drew Worden

sub merge_sort {
    my @array = @_;

    if (@array <= 1) {
        return @array;
    }

    my $mid = int(@array / 2);
    my @left_half = merge_sort(@array[0..($mid - 1)]);
    my @right_half = merge_sort(@array[$mid..$#array]);

    return merge(\@left_half, \@right_half);
}

sub merge {
    my ($left_ref, $right_ref) = @_;
    my @merged;
    
    while (@$left_ref && @$right_ref) {
        if ($left_ref->[0] <= $right_ref->[0]) {
            push @merged, shift @$left_ref;
        } else {
            push @merged, shift @$right_ref;
        }
    }

    push @merged, @$left_ref;
    push @merged, @$right_ref;

    return @merged;
}

my @array = (38, 27, 43, 3, 9, 82, 10);
my @sorted_array = merge_sort(@array);
print "Original array: @array\n";
print "Sorted array: @sorted_array\n";
