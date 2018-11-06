#!usr/bin/perl -w
use strict;
use warnings;

sub Gomoku() {
    my $l = 0;
    my $q = 0;
    my $e = 0;
    print "  a b c d e f g h i j\n";
    my $sequence   = '----------';
    my $sequence_1 = '';
    for ( my $i = 0 ; $i <= 9 ; $i++ ) {
        $sequence_1 = $sequence_1 . $sequence;
    }
    for ( my $pos = 0 ; $pos <= 90 ; $pos += 10 ) {
        my $line    = substr( $sequence_1, $pos, 10 );
        my $se2     = "$l$line";
        my @array_2 = split( "", $se2 );
        print "@array_2", "\n";
        $l = $l + 1;
    }
    do {
        print "Please type the position your chess at: ";
        my $weidian = <STDIN>;
        chomp $weidian;
        if ( $weidian =~ m/\s*q/ ) { Gamechoose(); }
        my @array      = split( '', $weidian );
        my $a          = $array[0];
        my $b          = $array[1];
        my $c          = $array[2];
        my $d          = $array[3];
        my $position   = '';
        my $position_1 = '';

        if ( $a == 0 ) {
            if    ( $b eq 'a' ) { $position = 0; }
            elsif ( $b eq 'b' ) { $position = 1; }
            elsif ( $b eq 'c' ) { $position = 2; }
            elsif ( $b eq 'd' ) { $position = 3; }
            elsif ( $b eq 'e' ) { $position = 4; }
            elsif ( $b eq 'f' ) { $position = 5; }
            elsif ( $b eq 'g' ) { $position = 6; }
            elsif ( $b eq 'h' ) { $position = 7; }
            elsif ( $b eq 'i' ) { $position = 8; }
            elsif ( $b eq 'j' ) { $position = 9; }
        }
        if ( $a == 1 ) {
            if    ( $b eq 'a' ) { $position = 10; }
            elsif ( $b eq 'b' ) { $position = 11; }
            elsif ( $b eq 'c' ) { $position = 12; }
            elsif ( $b eq 'd' ) { $position = 13; }
            elsif ( $b eq 'e' ) { $position = 14; }
            elsif ( $b eq 'f' ) { $position = 15; }
            elsif ( $b eq 'g' ) { $position = 16; }
            elsif ( $b eq 'h' ) { $position = 17; }
            elsif ( $b eq 'i' ) { $position = 18; }
            elsif ( $b eq 'j' ) { $position = 19; }
        }
        if ( $a == 2 ) {
            if    ( $b eq 'a' ) { $position = 20; }
            elsif ( $b eq 'b' ) { $position = 21; }
            elsif ( $b eq 'c' ) { $position = 22; }
            elsif ( $b eq 'd' ) { $position = 23; }
            elsif ( $b eq 'e' ) { $position = 24; }
            elsif ( $b eq 'f' ) { $position = 25; }
            elsif ( $b eq 'g' ) { $position = 26; }
            elsif ( $b eq 'h' ) { $position = 27; }
            elsif ( $b eq 'i' ) { $position = 28; }
            elsif ( $b eq 'j' ) { $position = 29; }
        }
        if ( $a == 3 ) {
            if    ( $b eq 'a' ) { $position = 30; }
            elsif ( $b eq 'b' ) { $position = 31; }
            elsif ( $b eq 'c' ) { $position = 32; }
            elsif ( $b eq 'd' ) { $position = 33; }
            elsif ( $b eq 'e' ) { $position = 34; }
            elsif ( $b eq 'f' ) { $position = 35; }
            elsif ( $b eq 'g' ) { $position = 36; }
            elsif ( $b eq 'h' ) { $position = 37; }
            elsif ( $b eq 'i' ) { $position = 38; }
            elsif ( $b eq 'j' ) { $position = 39; }
        }
        if ( $a == 4 ) {
            if    ( $b eq 'a' ) { $position = 40; }
            elsif ( $b eq 'b' ) { $position = 41; }
            elsif ( $b eq 'c' ) { $position = 42; }
            elsif ( $b eq 'd' ) { $position = 43; }
            elsif ( $b eq 'e' ) { $position = 44; }
            elsif ( $b eq 'f' ) { $position = 45; }
            elsif ( $b eq 'g' ) { $position = 46; }
            elsif ( $b eq 'h' ) { $position = 47; }
            elsif ( $b eq 'i' ) { $position = 48; }
            elsif ( $b eq 'j' ) { $position = 49; }
        }
        if ( $a == 5 ) {
            if    ( $b eq 'a' ) { $position = 50; }
            elsif ( $b eq 'b' ) { $position = 51; }
            elsif ( $b eq 'c' ) { $position = 52; }
            elsif ( $b eq 'd' ) { $position = 53; }
            elsif ( $b eq 'e' ) { $position = 54; }
            elsif ( $b eq 'f' ) { $position = 55; }
            elsif ( $b eq 'g' ) { $position = 56; }
            elsif ( $b eq 'h' ) { $position = 57; }
            elsif ( $b eq 'i' ) { $position = 58; }
            elsif ( $b eq 'j' ) { $position = 59; }
        }
        if ( $a == 6 ) {
            if    ( $b eq 'a' ) { $position = 60; }
            elsif ( $b eq 'b' ) { $position = 61; }
            elsif ( $b eq 'c' ) { $position = 62; }
            elsif ( $b eq 'd' ) { $position = 63; }
            elsif ( $b eq 'e' ) { $position = 64; }
            elsif ( $b eq 'f' ) { $position = 65; }
            elsif ( $b eq 'g' ) { $position = 66; }
            elsif ( $b eq 'h' ) { $position = 67; }
            elsif ( $b eq 'i' ) { $position = 68; }
            elsif ( $b eq 'j' ) { $position = 69; }
        }
        if ( $a == 7 ) {
            if    ( $b eq 'a' ) { $position = 70; }
            elsif ( $b eq 'b' ) { $position = 71; }
            elsif ( $b eq 'c' ) { $position = 72; }
            elsif ( $b eq 'd' ) { $position = 73; }
            elsif ( $b eq 'e' ) { $position = 74; }
            elsif ( $b eq 'f' ) { $position = 75; }
            elsif ( $b eq 'g' ) { $position = 76; }
            elsif ( $b eq 'h' ) { $position = 77; }
            elsif ( $b eq 'i' ) { $position = 78; }
            elsif ( $b eq 'j' ) { $position = 79; }
        }
        if ( $a == 8 ) {
            if    ( $b eq 'a' ) { $position = 80; }
            elsif ( $b eq 'b' ) { $position = 81; }
            elsif ( $b eq 'c' ) { $position = 82; }
            elsif ( $b eq 'd' ) { $position = 83; }
            elsif ( $b eq 'e' ) { $position = 84; }
            elsif ( $b eq 'f' ) { $position = 85; }
            elsif ( $b eq 'g' ) { $position = 86; }
            elsif ( $b eq 'h' ) { $position = 87; }
            elsif ( $b eq 'i' ) { $position = 88; }
            elsif ( $b eq 'j' ) { $position = 89; }
        }
        if ( $a == 9 ) {
            if    ( $b eq 'a' ) { $position = 90; }
            elsif ( $b eq 'b' ) { $position = 91; }
            elsif ( $b eq 'c' ) { $position = 92; }
            elsif ( $b eq 'd' ) { $position = 93; }
            elsif ( $b eq 'e' ) { $position = 94; }
            elsif ( $b eq 'f' ) { $position = 95; }
            elsif ( $b eq 'g' ) { $position = 96; }
            elsif ( $b eq 'h' ) { $position = 97; }
            elsif ( $b eq 'i' ) { $position = 98; }
            elsif ( $b eq 'j' ) { $position = 99; }
        }
        if ( $c == 0 ) {
            if    ( $d eq 'a' ) { $position_1 = 0; }
            elsif ( $d eq 'b' ) { $position_1 = 1; }
            elsif ( $d eq 'c' ) { $position_1 = 2; }
            elsif ( $d eq 'd' ) { $position_1 = 3; }
            elsif ( $d eq 'e' ) { $position_1 = 4; }
            elsif ( $d eq 'f' ) { $position_1 = 5; }
            elsif ( $d eq 'g' ) { $position_1 = 6; }
            elsif ( $d eq 'h' ) { $position_1 = 7; }
            elsif ( $d eq 'i' ) { $position_1 = 8; }
            elsif ( $d eq 'j' ) { $position_1 = 9; }
        }
        if ( $c == 1 ) {
            if    ( $d eq 'a' ) { $position_1 = 10; }
            elsif ( $d eq 'b' ) { $position_1 = 11; }
            elsif ( $d eq 'c' ) { $position_1 = 12; }
            elsif ( $d eq 'd' ) { $position_1 = 13; }
            elsif ( $d eq 'e' ) { $position_1 = 14; }
            elsif ( $d eq 'f' ) { $position_1 = 15; }
            elsif ( $d eq 'g' ) { $position_1 = 16; }
            elsif ( $d eq 'h' ) { $position_1 = 17; }
            elsif ( $d eq 'i' ) { $position_1 = 18; }
            elsif ( $d eq 'j' ) { $position_1 = 19; }
        }
        if ( $c == 2 ) {
            if    ( $d eq 'a' ) { $position_1 = 20; }
            elsif ( $d eq 'b' ) { $position_1 = 21; }
            elsif ( $d eq 'c' ) { $position_1 = 22; }
            elsif ( $d eq 'd' ) { $position_1 = 23; }
            elsif ( $d eq 'e' ) { $position_1 = 24; }
            elsif ( $d eq 'f' ) { $position_1 = 25; }
            elsif ( $d eq 'g' ) { $position_1 = 26; }
            elsif ( $d eq 'h' ) { $position_1 = 27; }
            elsif ( $d eq 'i' ) { $position_1 = 28; }
            elsif ( $d eq 'j' ) { $position_1 = 29; }
        }
        if ( $c == 3 ) {
            if    ( $d eq 'a' ) { $position_1 = 3; }
            elsif ( $d eq 'b' ) { $position_1 = 31; }
            elsif ( $d eq 'c' ) { $position_1 = 32; }
            elsif ( $d eq 'd' ) { $position_1 = 33; }
            elsif ( $d eq 'e' ) { $position_1 = 34; }
            elsif ( $d eq 'f' ) { $position_1 = 35; }
            elsif ( $d eq 'g' ) { $position_1 = 36; }
            elsif ( $d eq 'h' ) { $position_1 = 37; }
            elsif ( $d eq 'i' ) { $position_1 = 38; }
            elsif ( $d eq 'j' ) { $position_1 = 39; }
        }
        if ( $c == 4 ) {
            if    ( $d eq 'a' ) { $position_1 = 40; }
            elsif ( $d eq 'b' ) { $position_1 = 41; }
            elsif ( $d eq 'c' ) { $position_1 = 42; }
            elsif ( $d eq 'd' ) { $position_1 = 43; }
            elsif ( $d eq 'e' ) { $position_1 = 44; }
            elsif ( $d eq 'f' ) { $position_1 = 45; }
            elsif ( $d eq 'g' ) { $position_1 = 46; }
            elsif ( $d eq 'h' ) { $position_1 = 47; }
            elsif ( $d eq 'i' ) { $position_1 = 48; }
            elsif ( $d eq 'j' ) { $position_1 = 49; }
        }
        if ( $c == 5 ) {
            if    ( $d eq 'a' ) { $position_1 = 50; }
            elsif ( $d eq 'b' ) { $position_1 = 51; }
            elsif ( $d eq 'c' ) { $position_1 = 52; }
            elsif ( $d eq 'd' ) { $position_1 = 53; }
            elsif ( $d eq 'e' ) { $position_1 = 54; }
            elsif ( $d eq 'f' ) { $position_1 = 55; }
            elsif ( $d eq 'g' ) { $position_1 = 56; }
            elsif ( $d eq 'h' ) { $position_1 = 57; }
            elsif ( $d eq 'i' ) { $position_1 = 58; }
            elsif ( $d eq 'j' ) { $position_1 = 59; }
        }
        if ( $c == 6 ) {
            if    ( $d eq 'a' ) { $position_1 = 60; }
            elsif ( $d eq 'b' ) { $position_1 = 61; }
            elsif ( $d eq 'c' ) { $position_1 = 62; }
            elsif ( $d eq 'd' ) { $position_1 = 63; }
            elsif ( $d eq 'e' ) { $position_1 = 64; }
            elsif ( $d eq 'f' ) { $position_1 = 65; }
            elsif ( $d eq 'g' ) { $position_1 = 66; }
            elsif ( $d eq 'h' ) { $position_1 = 67; }
            elsif ( $d eq 'i' ) { $position_1 = 68; }
            elsif ( $d eq 'j' ) { $position_1 = 69; }
        }
        if ( $c == 7 ) {
            if    ( $d eq 'a' ) { $position_1 = 70; }
            elsif ( $d eq 'b' ) { $position_1 = 71; }
            elsif ( $d eq 'c' ) { $position_1 = 72; }
            elsif ( $d eq 'd' ) { $position_1 = 73; }
            elsif ( $d eq 'e' ) { $position_1 = 74; }
            elsif ( $d eq 'f' ) { $position_1 = 75; }
            elsif ( $d eq 'g' ) { $position_1 = 76; }
            elsif ( $d eq 'h' ) { $position_1 = 77; }
            elsif ( $d eq 'i' ) { $position_1 = 78; }
            elsif ( $d eq 'j' ) { $position_1 = 79; }
        }
        if ( $c == 8 ) {
            if    ( $d eq 'a' ) { $position_1 = 80; }
            elsif ( $d eq 'b' ) { $position_1 = 81; }
            elsif ( $d eq 'c' ) { $position_1 = 82; }
            elsif ( $d eq 'd' ) { $position_1 = 83; }
            elsif ( $d eq 'e' ) { $position_1 = 84; }
            elsif ( $d eq 'f' ) { $position_1 = 85; }
            elsif ( $d eq 'g' ) { $position_1 = 86; }
            elsif ( $d eq 'h' ) { $position_1 = 87; }
            elsif ( $d eq 'i' ) { $position_1 = 88; }
            elsif ( $d eq 'j' ) { $position_1 = 89; }
        }
        if ( $c == 9 ) {
            if    ( $d eq 'a' ) { $position_1 = 90; }
            elsif ( $d eq 'b' ) { $position_1 = 91; }
            elsif ( $d eq 'c' ) { $position_1 = 92; }
            elsif ( $d eq 'd' ) { $position_1 = 93; }
            elsif ( $d eq 'e' ) { $position_1 = 94; }
            elsif ( $d eq 'f' ) { $position_1 = 95; }
            elsif ( $d eq 'g' ) { $position_1 = 96; }
            elsif ( $d eq 'h' ) { $position_1 = 97; }
            elsif ( $d eq 'i' ) { $position_1 = 98; }
            elsif ( $d eq 'j' ) { $position_1 = 99; }
        }
        substr( $sequence_1, $position,   1, '@' );
        substr( $sequence_1, $position_1, 1, '*' );
        $e = $e + 1;
        print "  a b c d e f g h i j\n";
        for ( my $pos = 0 ; $pos <= 90 ; $pos += 10 ) {
            my $line = substr( $sequence_1, $pos, 10 );
            my $r = $q % 10;
            print "$r" . " ";
            my @array_1 = split( "", $line );
            print "@array_1", "\n";
            $q += 1;
        }
        for ( my $numb = 0 ; $numb <= 99 ; $numb++ ) {
            if ( $numb <= 59 ) {
                my $wo_1 = substr( $sequence_1, $numb,      1 );
                my $wo_2 = substr( $sequence_1, $numb + 10, 1 );
                my $wo_3 = substr( $sequence_1, $numb + 20, 1 );
                my $wo_4 = substr( $sequence_1, $numb + 30, 1 );
                my $wo_5 = substr( $sequence_1, $numb + 40, 1 );
                if (    $wo_1 eq '@'
                    and $wo_2 eq '@'
                    and $wo_3 eq '@'
                    and $wo_4 eq '@'
                    and $wo_5 eq '@' )
                {
                    print "      @  win!\n";
                    exit;
                }
                if (    $wo_1 eq '*'
                    and $wo_2 eq '*'
                    and $wo_3 eq '*'
                    and $wo_4 eq '*'
                    and $wo_5 eq '*' )
                {
                    print "      * win!\n";
                    exit;
                }
            }
            if ( $numb % 10 <= 5 ) {
                my $wo_1 = substr( $sequence_1, $numb,     1 );
                my $wo_2 = substr( $sequence_1, $numb + 1, 1 );
                my $wo_3 = substr( $sequence_1, $numb + 2, 1 );
                my $wo_4 = substr( $sequence_1, $numb + 3, 1 );
                my $wo_5 = substr( $sequence_1, $numb + 4, 1 );
                if (    $wo_1 eq '@'
                    and $wo_2 eq '@'
                    and $wo_3 eq '@'
                    and $wo_4 eq '@'
                    and $wo_5 eq '@' )
                {
                    print "      @ win!\n";
                    exit;
                }
                if (    $wo_1 eq '*'
                    and $wo_2 eq '*'
                    and $wo_3 eq '*'
                    and $wo_4 eq '*'
                    and $wo_5 eq '*' )
                {
                    print "      * win!\n";
                    exit;
                }
            }
            if ( $numb % 10 <= 5 and $numb <= 55 ) {
                my $wo_1 = substr( $sequence_1, $numb,      1 );
                my $wo_2 = substr( $sequence_1, $numb + 11, 1 );
                my $wo_3 = substr( $sequence_1, $numb + 22, 1 );
                my $wo_4 = substr( $sequence_1, $numb + 33, 1 );
                my $wo_5 = substr( $sequence_1, $numb + 44, 1 );
                if (    $wo_1 eq '@'
                    and $wo_2 eq '@'
                    and $wo_3 eq '@'
                    and $wo_4 eq '@'
                    and $wo_5 eq '@' )
                {
                    print "      @ win!\n";
                    exit;
                }
                if (    $wo_1 eq '*'
                    and $wo_2 eq '*'
                    and $wo_3 eq '*'
                    and $wo_4 eq '*'
                    and $wo_5 eq '*' )
                {
                    print "      * win!\n";
                    exit;
                }
            }
            if ( $numb % 10 >= 4 and $numb <= 59 ) {
                my $wo_1 = substr( $sequence_1, $numb,      1 );
                my $wo_2 = substr( $sequence_1, $numb + 9,  1 );
                my $wo_3 = substr( $sequence_1, $numb + 18, 1 );
                my $wo_4 = substr( $sequence_1, $numb + 27, 1 );
                my $wo_5 = substr( $sequence_1, $numb + 36, 1 );
                if (    $wo_1 eq '@'
                    and $wo_2 eq '@'
                    and $wo_3 eq '@'
                    and $wo_4 eq '@'
                    and $wo_5 eq '@' )
                {
                    print "      @ win!\n";
                    exit;
                }
                if (    $wo_1 eq '*'
                    and $wo_2 eq '*'
                    and $wo_3 eq '*'
                    and $wo_4 eq '*'
                    and $wo_5 eq '*' )
                {
                    print "      * win!\n";
                    exit;
                }
            }
        }
    } until ( $e == 100 );
    exit;
}
1;
