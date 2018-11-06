#usr/bin/perl -w
use warnings;
use strict;

sub Youtwo() {
    my $se_1 = "  a   b   c   d\n";
    print "$se_1";
    my $se_2 =
      "1 \@---\@---\@---\@2  --- --- --- 3  --- --- --- 4 #---#---#---#";
    for ( my $i = 0 ; $i <= 45 ; $i += 15 ) {
        my $line = substr( $se_2, $i, 15 );
        print "$line", "\n";
        if ( $i <= 30 ) {
            print "  |   |   |   |\n";
        }
    }
    for ( my $num = 0 ; $num < 100 ; $num++ ) {
        print "Please choose position of your next step: ";
        my $position = <STDIN>;
        chomp $position;
        if ( $position =~ m/\s*q/ ) { Gamechoose(); }
        my @array = split( '', $position );
        my $pos_1 = $array[0];
        my $pos_2 = $array[1];
        my $pos_3 = $array[2];
        my $pos_4 = $array[3];
        my $pos_5 = '';
        my $pos_6 = '';

        if ( $pos_1 == 1 ) {
            if    ( $pos_2 eq 'a' ) { $pos_5 = 2; }
            elsif ( $pos_2 eq 'b' ) { $pos_5 = 6; }
            elsif ( $pos_2 eq 'c' ) { $pos_5 = 10; }
            elsif ( $pos_2 eq 'd' ) { $pos_5 = 14; }
        }
        if ( $pos_1 == 2 ) {
            if    ( $pos_2 eq 'a' ) { $pos_5 = 17; }
            elsif ( $pos_2 eq 'b' ) { $pos_5 = 21; }
            elsif ( $pos_2 eq 'c' ) { $pos_5 = 25; }
            elsif ( $pos_2 eq 'd' ) { $pos_5 = 29; }
        }
        if ( $pos_1 == 3 ) {
            if    ( $pos_2 eq 'a' ) { $pos_5 = 32; }
            elsif ( $pos_2 eq 'b' ) { $pos_5 = 36; }
            elsif ( $pos_2 eq 'c' ) { $pos_5 = 40; }
            elsif ( $pos_2 eq 'd' ) { $pos_5 = 44; }
        }
        if ( $pos_1 == 4 ) {
            if    ( $pos_2 eq 'a' ) { $pos_5 = 47; }
            elsif ( $pos_2 eq 'b' ) { $pos_5 = 51; }
            elsif ( $pos_2 eq 'c' ) { $pos_5 = 55; }
            elsif ( $pos_2 eq 'd' ) { $pos_5 = 59; }
        }
        if ( $pos_3 == 1 ) {
            if    ( $pos_4 eq 'a' ) { $pos_6 = 2; }
            elsif ( $pos_4 eq 'b' ) { $pos_6 = 6; }
            elsif ( $pos_4 eq 'c' ) { $pos_6 = 10; }
            elsif ( $pos_4 eq 'd' ) { $pos_6 = 14; }
        }
        if ( $pos_3 == 2 ) {
            if    ( $pos_4 eq 'a' ) { $pos_6 = 17; }
            elsif ( $pos_4 eq 'b' ) { $pos_6 = 21; }
            elsif ( $pos_4 eq 'c' ) { $pos_6 = 25; }
            elsif ( $pos_4 eq 'd' ) { $pos_6 = 29; }
        }
        if ( $pos_3 == 3 ) {
            if    ( $pos_4 eq 'a' ) { $pos_6 = 32; }
            elsif ( $pos_4 eq 'b' ) { $pos_6 = 36; }
            elsif ( $pos_4 eq 'c' ) { $pos_6 = 40; }
            elsif ( $pos_4 eq 'd' ) { $pos_6 = 44; }
        }
        if ( $pos_3 == 4 ) {
            if    ( $pos_4 eq 'a' ) { $pos_6 = 47; }
            elsif ( $pos_4 eq 'b' ) { $pos_6 = 51; }
            elsif ( $pos_4 eq 'c' ) { $pos_6 = 55; }
            elsif ( $pos_4 eq 'd' ) { $pos_6 = 59; }
        }
        if ( $num % 2 == 0 ) {
            substr( $se_2, $pos_5, 1, '@' );
            substr( $se_2, $pos_6, 1, ' ' );
        }
        if ( $num % 2 == 1 ) {
            substr( $se_2, $pos_5, 1, "#" );
            substr( $se_2, $pos_6, 1, " " );
        }
        for ( my $number = 0 ; $number <= 59 ; $number++ ) {
            if ( $number % 15 <= 8 ) {
                if (    substr( $se_2, $number, 1 ) eq '@'
                    and substr( $se_2, $number + 4,  1 ) eq '@'
                    and substr( $se_2, $number + 8,  1 ) eq '#'
                    and substr( $se_2, $number + 12, 1 ) =~ m/[ ,-]*/ )
                {
                    substr( $se_2, $number + 8, 1, ' ' );
                }
                elsif ( substr( $se_2, $number, 1 ) eq '#'
                    and substr( $se_2, $number + 4,  1 ) eq '#'
                    and substr( $se_2, $number + 8,  1 ) eq '@'
                    and substr( $se_2, $number + 12, 1 ) =~ m/[ ,-]*/ )
                {
                    substr( $se_2, $number + 8, 1, ' ' );
                }
            }
            if ( $number % 15 >= 8 ) {
                if (    substr( $se_2, $number, 1 ) eq '@'
                    and substr( $se_2, $number - 4,  1 ) eq '@'
                    and substr( $se_2, $number - 8,  1 ) eq '#'
                    and substr( $se_2, $number - 12, 1 ) =~ m/[ ,-]*/ )
                {
                    substr( $se_2, $number - 8, 1, ' ' );
                }
                elsif ( substr( $se_2, $number, 1 ) eq '#'
                    and substr( $se_2, $number - 4,  1 ) eq '#'
                    and substr( $se_2, $number - 8,  1 ) eq '@'
                    and substr( $se_2, $number - 12, 1 ) =~ m/[ ,-]*/ )
                {
                    substr( $se_2, $number - 8, 1, ' ' );
                }
            }
            if ( $number % 60 <= 30 ) {
                if (    substr( $se_2, $number, 1 ) eq '@'
                    and substr( $se_2, $number + 15, 1 ) eq '@'
                    and substr( $se_2, $number + 30, 1 ) eq '#'
                    and substr( $se_2, $number + 45, 1 ) =~ m/[ ,-]*/ )
                {
                    substr( $se_2, $number + 30, 1, ' ' );
                }
                elsif ( substr( $se_2, $number, 1 ) eq '#'
                    and substr( $se_2, $number + 15, 1 ) eq '#'
                    and substr( $se_2, $number + 30, 1 ) eq '@'
                    and substr( $se_2, $number + 45, 1 ) =~ m/[ ,-]*/ )
                {
                    substr( $se_2, $number + 30, 1, ' ' );
                }
            }
            if ( $number % 60 > 30 ) {
                if (    substr( $se_2, $number, 1 ) eq '@'
                    and substr( $se_2, $number - 15, 1 ) eq '@'
                    and substr( $se_2, $number - 30, 1 ) eq '#'
                    and substr( $se_2, $number - 45, 1 ) =~ m/[ ,-]/ )
                {
                    substr( $se_2, $number - 30, 1, ' ' );
                }
                elsif ( substr( $se_2, $number, 1 ) eq '#'
                    and substr( $se_2, $number - 15, 1 ) eq '#'
                    and substr( $se_2, $number - 30, 1 ) eq '@'
                    and substr( $se_2, $number - 45, 1 ) =~ m/[ ,-]/ )
                {
                    substr( $se_2, $number - 30, 1, ' ' );
                }
            }
        }
        print "$se_1";
        for ( my $q = 0 ; $q <= 45 ; $q += 15 ) {
            my $line = substr( $se_2, $q, 15 );
            print "$line", "\n";
            if ( $q <= 30 ) {
                print "  |   |   |   |\n";
            }
        }
        my $amount_3 = 0;
        my $amount_4 = 0;
        for ( my $number_1 = 0 ; $number_1 < 60 ; $number_1++ ) {
            if ( substr( $se_2, $number_1, 1 ) eq "@" ) { $amount_3 += 1; }
            if ( substr( $se_2, $number_1, 1 ) eq "#" ) { $amount_4 += 1; }
        }
        if ( $amount_3 <= 1 ) { print "# win!\n"; exit; }
        if ( $amount_4 <= 1 ) { print "@ win!\n"; exit; }
    }
    exit;
}
1;
