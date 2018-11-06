#!usr/bin/perl -w
use strict;
use warnings;

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
    }
    if ( $number == 3 ) {
        print "You two,you win!\n";
    }
}

sub Sudoku_1 {
    my $correct_1 = 8765331476824638539287466713498528617964894713265165497;
    my $easySudoku =
'  a b c d e f g h i 1|9| | | |2| |4| |1|2| | |5| |9| | |9| |3| |4| |1| | | |9|7|4|5| | | | |1| | | |5| | | | | | | | |2|6|4| | |5|7| |3| |9|7| |5|3| | |2|1|8| |8| | | | | | | | | |9| | |2|8| | | | |3|';
    for ( my $pos = 0 ; $pos < length($easySudoku) ; $pos += 20 ) {
        my $line = substr( $easySudoku, $pos, 20 );
        my @array = split( '', $line );
        print "@array", "\n";
        print "   --- --- --- --- --- --- --- --- ---\n";
    }
    jieguo_1();
}

sub jieguo_1 {
    print
"Please type your answers according to the order [1..9][a..i]!or type q to quit\n";
    my $answer = <STDIN>;
    chomp $answer;
    while ( $answer =~ /^\s*q/ ) { Gamechoose(); }
    while ( $answer != 8765331476824638539287466713498528617964894713265165497 )
    {
        print "Sorry,your answer isn't correct.Please try again!\n";
        jieguo_1();
    }
    while ( $answer == 8765331476824638539287466713498528617964894713265165497 )
    {
        print "Congratulations!\n";
        print "Do you want to play next class?Y/N\n";
        my $response = <STDIN>;
        if ( $response =~ /Y/i ) { Sudoku_2(); }
        if ( $response =~ /N/i ) { Gamechoose(); }
    }
}

sub Sudoku_2 {
    print "You are smart,you can  challenge yourself now.Come on!\n";
    my $correct_2 = 265984319576846357943612857845321529465812442197567382159;
    my $middleSudoku =
'  a b c d e f g h i 1| | |7| | | | | | |2|3| | | |4|1| |2| |3|8|1| |2| | | |9| |4| | | | | | |7| | |5|6| | | | |9| |1| |6| | | |3|8|7| | | |7| | |9| |3|6| |7| |8| | | | | | |8| |3|9| | |6| | |4| | | |';
    for ( my $pos = 0 ; $pos < length($middleSudoku) ; $pos += 20 ) {
        my $line1 = substr( $middleSudoku, $pos, 20 );
        my @array1 = split( '', $line1 );
        print "@array1", "\n";
        print "   --- --- --- --- --- --- --- --- ---\n";
    }
    jieguo_2();
}

sub jieguo_2 {
    print
"Please type your answers according to the order [1..9][a..i]!or type q to quit\n";
    my $answer = <STDIN>;
    chomp $answer;
    while ( $answer =~ /^\s*q/ ) { Gamechoose(); }
    while (
        $answer != 265984319576846357943612857845321529465812442197567382159 )
    {
        print "Sorry,your answer isn't correct.Please try again!\n";
        jieguo_2();
    }
    while (
        $answer == 265984319576846357943612857845321529465812442197567382159 )
    {
        print "Congratulations!\n";
        print "Do you want to play next class?Y/N\n";
        my $response = <STDIN>;
        if ( $response =~ /Y/i ) { Sudoku_3(); }
        if ( $response =~ /N/i ) { Gamechoose(); }
    }
}

sub Sudoku_3 {
    print
      "Excellent!You are so great,but this the most difficult one,it's boss\n";
    my $correct_3 = 26759819534784326597264381584125968274316841982743564219;
    my $lastSudoku =
'  a b c d e f g h i 1| | | | | | |4|3| |2| | | |1| |6|2| | |3| |8|1| | | | | | |4|7| | |9| | | | | |5| |3| |7|5| |9|6| |6| |1| | | | | | |3|7| |7|5| | |9|2| | |8| | | | | | | | | |9|6| | |8|3|5| |7| |';
    for ( my $pos2 = 0 ; $pos2 < length($lastSudoku) ; $pos2 += 20 ) {
        my $line2 = substr( $lastSudoku, $pos2, 20 );
        my @array2 = split( '', $line2 );
        print "@array2", "\n";
        print "   --- --- --- --- --- --- --- --- ---\n";
    }
    jieguo_3();
}

sub jieguo_3 {
    print
"Please type your answers according to the order [1..9][a..i]!or type q to quit\n";
    my $answer = <STDIN>;
    chomp $answer;
    while ( $answer =~ /^\s*q/ ) { Gamechoose(); }
    while (
        $answer != 26759819534784326597264381584125968274316841982743564219 )
    {
        print "Sorry,your answer isn't correct.Please try again!\n";
        jieguo_3();
    }
    while (
        $answer == 26759819534784326597264381584125968274316841982743564219 )
    {
        print "Congratulations!You are the smartest boy!\n";
        print "Play again or another game?Again/Another\n";
        my $response = <STDIN>;
        if ( $response =~ /Again/i )   { Sudoku_1(); }
        if ( $response =~ /Another/i ) { Gamechoose(); }
    }
}
1;

