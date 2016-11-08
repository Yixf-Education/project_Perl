#!/uer/bin/perl

use warnings;
use strict;

print "This is a kind of game testing your IQ and EQ.\n";
print
"The part1 is the Big_Bang_Puzzle to review the learning importance which isn't scoring. The part2 is called Guess Number where you will get 5 score if you are right. The part3 is called Secret Search, there are 5 questions in total, you will get one score if you are right any one question. The total score in both part2 and part3 greater 5 score you will get a mysterious suprise! Are you ready now???    OK, Let's begin!!!!\n\n";
big_bang_puzzle();
my $score2 = randomnum( 1, 100 );
print "In this part,your score is :$score2\n\n";

my $score3 = secret_research();
print "In this part,your score is :$score3\n\n";

my @score;
my $total;
push( @score, $score2 );
push( @score, $score3 );
foreach (@score) {
    $total += $_;
}
print "After the 2 parts,your score is :$total\n\n";
if ( $total < 5 ) {
    my $punish = truth_or_dare();
    print
"-------------------------------------------------------------------------\n\n";
    print "$punish\n\n";
    print
"-------------------------------------------------------------------------\n\n";
}
else {
    print
"^-^ Congratulations!! You can get the amazing award from monitor by your intelligence.Now you can bring the award: QiuKu. Get move on! move! move! move!!!\n";
}
my @list = open_file('list');
print "@list\n\n";
exit;

#subroutine2:random number.
sub randomnum {
    my @kuang2 = open_file('kuang2');
    print @kuang2;
    my ( $mininum, $maxinum ) = @_;
    my $randnum = int( rand( $maxinum - $mininum + 1 ) ) + $mininum;
    for ( my $i = 0 ; $i < 6 ; ++$i ) {
        print
"please guess a number from $mininum to $maxinum( you have 6 chances):";
        my $number = <STDIN>;
        chomp $number;
        if ( $number < $randnum ) {
            print "\nrandnum is larger than $number. try again!\n\n";
        }
        elsif ( $number > $randnum ) {
            print "\nrandnum is smaller than $number. try again!\n\n";
        }
        else {
            print "Congraduatin! You're excellent!\n\n";
            my $score = 5;
            return $score;
            exit;
        }
    }
    print "The random number is : $randnum .What a pity! Game over!\n";
    my $score = 0;
    return $score;
}

#subroutine3:secret research
sub secret_research {
    my @kuang3 = open_file('kuang3');
    print @kuang3;
    my @filenames = (
        'q1.pl',  'q2.pl',  'q3.pl',  'q4.pl',  'q5.pl',  'q6.pl',
        'q7.pl',  'q8.pl',  'q9.pl',  'q10.pl', 'q11.pl', 'q12.pl',
        'q13.pl', 'q14.pl', 'q15.pl', 'q16.pl', 'q17.pl', 'q18.pl',
        'q19.pl', 'q20.pl', 'q21.pl', 'q22.pl', 'q23.pl', 'q24.pl',
        'q25.pl', 'q26.pl', 'q27.pl', 'q28.pl'
    );
    my $score = 0;
    for ( my $i = 0 ; $i < 5 ; $i++ ) {
        my $position = rand_file(@filenames);
        my $filename = $filenames[$position];
        my @file     = open_file($filename);
        my $answer   = answers($filename);
        print @file;
        splice( @filenames, $position, 1 );
        chomp( my $ans = <STDIN> );
        if ( $ans =~ /$answer/ ) {
            print "You are right!\n";
            $score++;
        }
        else {
            print "You are wrong!\n";
        }
        print "Your present score is : $score\n";
    }
    return $score;
}

#subroutine3.1:choose a rand number
sub rand_file {
    my @filename = @_;
    return int rand @filename;
}

#subroutine3.2:open the file
sub open_file {
    my ($filename) = @_;
    unless ( open( FILENAME, $filename ) ) {
        print "Could not open the file!\n";
        exit;
    }
    my @file = <FILENAME>;
    close FILENAME;
    return @file;
}

#subroutine3.3:find the right answer
sub answers {
    my %ans = (
        'q1.pl'  => '[Cc]',
        'q1.pl'  => '[Cc]',
        'q2.pl'  => '[Bb]',
        'q3.pl'  => '[Cc]',
        'q4.pl'  => '[Aa]',
        'q5.pl'  => '[Bb]',
        'q6.pl'  => '[Bb]',
        'q7.pl'  => '[Cc]',
        'q8.pl'  => '[Cc]',
        'q9.pl'  => '[Aa]',
        'q10.pl' => '[Cc]',
        'q11.pl' => '[Dd]',
        'q12.pl' => '[Cc]',
        'q13.pl' => '[Cc]',
        'q14.pl' => '[Bb]',
        'q15.pl' => '[Cc]',
        'q16.pl' => '[Cc]',
        'q17.pl' => '[Cc]',
        'q18.pl' => '[Aa]',
        'q19.pl' => '[Bb]',
        'q20.pl' => '[Cc]',
        'q21.pl' => '[Dd]',
        'q22.pl' => '[bB]',
        'q23.pl' => '[aA]',
        'q24.pl' => '[cC]',
        'q25.pl' => '[Aa]',
        'q26.pl' => '[cC]',
        'q27.pl' => '[dD]',
        'q28.pl' => '[Aa]',
    );
    my ($filename) = @_;
    return $ans{"$filename"};
}

#subroutine4:truth or dare
sub truth_or_dare {
    my @kuang4 = open_file('kuang4');
    print @kuang4;
    print "please input your chose(truth or dare):\n";
    chomp( my $chose = <STDIN> );
    my @truth = (
        'Your first love age',
        'Do you like sleeping barely?',
        'Who would you remember bofore your sleep?',
        'What will you do when you are sad?',
        'which thing make you feel embarrassed?',
        'When will you get married?'
    );
    my @dare = (
        'Sing a love song with an opposite sex here',
        'make three sexy actions',
        'express your heart to an opposite sex 3 min',
        'kiss the wall 10s',
        'imitate NaoBaiJin advertisement singing and dancing',
        'dancing JiangNan Style'
    );
    srand( time | $$ );
    if ( $chose =~ /^t/i ) {
        return $truth[ rand @truth ];
    }
    if ( $chose =~ /^d/i ) {
        return $dare[ rand @dare ];
    }
}

#subroutine1:just for fun
sub big_bang_puzzle {
    my @kuang1 = open_file('kuang1');
    print @kuang1;
    my $input;
    my $q;
    do {
        print "please choose a number from 1 to 10: ";
        my $number = <STDIN>;
        if ( $number == 1 ) {
            print
"\n1.How to use the Regular Expression to express the global replacement?\nA./f/d/g B.s/f/d/g C.s/f/d/ D.///";
            print "\n\nplease choose the right answer from A, B, C, D: ";
            do {
                $input = <STDIN>;
                chomp($input);
                if ( !( $input =~ /B/i ) ) {
                    print "\nwrong! please continue to guess:\n";
                }
            } until ( $input =~ /B/i );

            print "Congratulations! You are right!\n";
        }
        elsif ( $number == 2 ) {
            print
"\n2.Which is the wrong expression to show the way to contact two character strings:\nA.\$DNA3 = \$DNA1 . \$DNA2 \nB.\$DNA3 = join( \"\",(\$DNA1, \$DNA2) ) \nC.\$DNA3 = \"\$DNA1\$DNA2\"\nD.\$DNA3 = \$DNA1 , \$DNA2";
            print "\n\nplease choose the right answer from A, B, C, D: ";
            do {
                $input = <STDIN>;
                chomp($input);
                if ( !( $input =~ /D/i ) ) {
                    print "\nwrong! please continue to guess:\n";
                }
            } until ( $input =~ /D/i );

            print "Congratulations! You are right!\n";
        }
        elsif ( $number == 3 ) {
            print
"\n3.Which isn't the special structure of bacteria:\nA.sugar B.capsule C.flagellum D.nuclear zone";
            print "\n\nplease choose the right answer from A, B, C, D: ";
            do {
                $input = <STDIN>;
                chomp($input);
                if ( !( $input =~ /D/i ) ) {
                    print "\nwrong! please continue to guess:\n";
                }
            } until ( $input =~ /D/i );

            print "Congratulations! You are right!\n";
        }
        elsif ( $number == 4 ) {
            print
"\n4.Which way of transporation did't need bearer protein:\nA.simple diffusion B.facilitated diffusion C.active transport D.group translocation";
            print "\n\nplease choose the right answer from A, B, C, D: ";
            do {
                $input = <STDIN>;
                chomp($input);
                if ( !( $input =~ /A/i ) ) {
                    print "\nwrong! please continue to guess:\n";
                }
            } until ( $input =~ /A/i );

            print "Congratulations! You are right!\n";
        }
        elsif ( $number == 5 ) {
            print
"\n5.Which website can you check the protein of physicochemical property:\nA.NCBI B.UCSC C.Expasy D.Pubmed";
            print "\n\nplease choose the right answer from A, B, C, D: ";
            do {
                $input = <STDIN>;
                chomp($input);
                if ( !( $input =~ /C/i ) ) {
                    print "\nwrong! please continue to guess:\n";
                }
            } until ( $input =~ /C/i );

            print "Congratulations! You are right!\n";
        }

        elsif ( $number == 6 ) {
            print
"\n6.Which time quantum you should make higher tempreture in the process of fermentation:\nA.earlier stage B.medium term C.later stage D.the above opions are all wrong";
            print "\n\nplease choose the right answer from A, B, C, D: ";
            do {
                $input = <STDIN>;
                chomp($input);
                if ( !( $input =~ /A/i ) ) {
                    print "\nwrong! please continue to guess:\n";
                }
            } until ( $input =~ /A/i );

            print "Congratulations! You are right!\n";
        }
        elsif ( $number == 7 ) {
            print
"\n7.Which isn't the reason of the changing to the PH in the process of fermentation:\nA.matrix metabolism B.the formation of products C.cell autolysis D.metabolite dissociation";
            print "\n\nplease choose the right answer from A, B, C, D: ";
            do {
                $input = <STDIN>;
                chomp($input);
                if ( !( $input =~ /D/i ) ) {
                    print "\nwrong! please continue to guess:\n";
                }
            } until ( $input =~ /D/i );

            print "Congratulations! You are right!\n";
        }
        elsif ( $number == 8 ) {
            print
"\n8.Which is the smallest prokaryocyte:\nA.bacteria B.viroid C.mycoplasma D.virus";
            print "\n\nplease choose the right answer from A, B, C, D: ";
            do {
                $input = <STDIN>;
                chomp($input);
                if ( !( $input =~ /C/i ) ) {
                    print "\nwrong! please continue to guess:\n";
                }
            } until ( $input =~ /C/i );

            print "Congratulations! You are right!\n";
        }
        elsif ( $number == 9 ) {
            print
"\n9.Which is accociated with the plasmodesma of the plant:\nA.Golgi apparatus B.plamalemma C.nuleus D.endoplasmic reticulum";
            print "\n\nplease choose the right answer from A, B, C, D: ";
            do {
                $input = <STDIN>;
                chomp($input);
                if ( !( $input =~ /D/i ) ) {
                    print "\nwrong! please continue to guess:\n";
                }
            } until ( $input =~ /D/i );

            print "Congratulations! You are right!\n";
        }
        elsif ( $number == 10 ) {
            print
"\n10.which doesn't include nucleic acid:\nA.animal B.plant C.SARS D.prion virus";
            print "\n\nplease choose the right answer from A, B, C, D: ";
            do {
                $input = <STDIN>;
                chomp($input);
                if ( !( $input =~ /D/i ) ) {
                    print "\nwrong! please continue to guess:\n";
                }
            } until ( $input =~ /D/i );

            print "Congratulations! You are right!\n";
        }
        else { print "The number you input is wrong!" }
        print "\nType \"q\" to quit, or press enter to continue: ";
        $q = <STDIN>;
    } until ( $q =~ /^s*q/i );
}
