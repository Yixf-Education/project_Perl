#!usr/bin/perl -w
use strict;
use warnings;
use GAME;
use PLAY;
use THIRD;
Gamechoose();

sub Gamechoose {
    print "                        welcome to the world of games!\n";
    print "Let\'s play together: \n";
    print "                           1 =======>Sudoku\n";
    print "                           2 =======>Gomoku\n";
    print "                           3 =======>You two,you win\n";
    print "You can choose a game by typing a number like 1 2 or 3\n";
    print "Now type your number: ";
    my $number = <STDIN>;
    chomp $number;

    if ( $number == 1 ) {
        print "Sudoku is comming!\n";
        Sudoku_1();
        jieguo_1();
    }
    if ( $number == 2 ) {
        print "Gomoku is comming!\n";
        Gomoku();
    }
    if ( $number == 3 ) {
        print "You two,you win!\n";
        Youtwo();
    }
}
exit;

