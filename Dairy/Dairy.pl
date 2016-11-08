#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
print
"Nice to meet you, I'm Mr.notebook.\nI can help remember everythings what you want to save, and It's our secrets.\nyou can entry quit to exit.\nAre you ready?( Entry y to continue or q to quit)\n";
my $answer_0 = <STDIN>;
chomp $answer_0;
goon_answer0($answer_0);

sub goon_answer0 {
    my ($answer_0) = @_;
    if ( $answer_0 eq "y" ) {
        Check_set_user($answer_0);
    }
    else {
        print "Having a good time, see you.\n";
        exit;
    }
}

sub Check_set_user {
    print " Please Enter your name \n";
    my $Username_check = <STDIN>;
    chomp $Username_check;
    if ( open( DAIRY, $Username_check ) ) {
        my (@dairy) = <DAIRY>;
        my ($dairy) = join( '', @dairy );
        $dairy =~ s/\s//g;
        Check_password( $dairy, $Username_check );
    }
    else {
        print
"User: $Username_check is not exist, enter r to try again or enter c to creat a new user(enter others to quit):\n";
        my $Username_check_1 = <STDIN>;
        chomp $Username_check_1;
        if ( $Username_check_1 =~ /c/ ) {
            Creat_user($Username_check_1);
        }
        elsif ( $Username_check_1 =~ /r/ ) {
            Check_set_user($Username_check_1);
        }
        else {
            exit;
        }
    }
}

sub Creat_user {
    print "What should I call you ?\n";
    my $Username_check = <STDIN>;
    chomp $Username_check;
    print "Your Username = $Username_check  (Please remember your ID)\n";
    srand( time | $$ );
    my $i = $$;
    print "Your ID = $i \n\n";
    passwd_twice($Username_check);
}

sub passwd_twice {
    my ( $Username_check, $i ) = @_;
    system "stty -echo";
    print
"Entry your password(Including numbers and letters) or enter q to quit:\n";
    my $password1 = <STDIN>;
    chomp $password1;
    print "Please Enter again:\n";
    my $password = <STDIN>;
    chomp $password;
    system "stty echo";

    if ( $password1 eq $password ) {
        print "Your password is :$password please remember it!\n\n";
        my $salt = 'ab';
        $password = crypt( $password1, $salt );
    }
    else {
        print "Inconsistent input, enter r to try again or others to quit.\n";
        my $answer = <STDIN>;
        chomp $answer;
        if ( $answer eq 'r' ) {
            passwd_twice($answer);
        }
        else {
            exit;
        }
    }
    my $name = $Username_check;
    my $date = strftime( "%Y-%m-%d", localtime() );
    more_Date($date);
    print "\n";

    print
"please choose the weather today:\nA.Sunny.  B.Rainy.  C.Cloudy. D.Snowy. E.Foggy. F.Enter others\n";
    my $weather = <STDIN>;
    chomp $weather;
    if ( $weather =~ /A|a/ ) {
        $weather = 'Sunny';
        print "The sunshine must be comfortable, What's your feeling today?\n";
    }
    elsif ( $weather =~ /B|b/ ) {
        $weather = 'Rainy';
    }
    elsif ( $weather =~ /C|c/ ) {
        $weather = 'Cloudy';
    }
    elsif ( $weather =~ /D|d/ ) {
        $weather = 'Snowy';
    }
    elsif ( $weather =~ /E|e/ ) {
        $weather = 'Foggy';
    }
    elsif ( $weather =~ /F|f/ ) {
        $weather = <STDIN>;
        chomp $weather;
    }
    else {
        exit;
    }
    print "\n";

    print
"How do you fell today?\nA.Happy.  B.Depressed.  C.Exciting.  D.Angry. E.Enter others\n";
    my $mood = <STDIN>;
    chomp $mood;
    if ( $mood =~ /A|a/ ) {
        $mood = 'Happy';
        print "Darling, tell me What makes you so happy today.\n";
    }
    elsif ( $mood =~ /B|b/ ) {
        $mood = 'Depressed';
        print
"I am so sorry, I will accompany you, you will feel better if you tell me that.Before that, let me tell you a joke.\n";
        print
"Can you tell me what fish net is made, Ann? Teacher asked.A lot of little holes tied together with strings. replied the little girl.\n";
        print "Are you feeling better?\n";
        my $answer = <STDIN>;
        if ( $answer eq "y\n" ) {
            print "Now, tell me what makes you unhappy.\n";
        }
        else {
            print "Let me tell you another joke.\n\n ";
            print
"An instructor in chemical warfare asked soldiers in his class:\nAnyone knows the formula for water?\n Sure. That's easy, said one man.\nWhat is it? H, I, J, K, L, M, N, O.\nWhat, what? reasked the instructor.\nH to O, explained the chemistry expert.\n";
            print "Now, tell me what made you unhappy.\n\n";
        }
    }
    elsif ( $mood =~ /C|c/ ) {
        $mood = 'Exciting';
        print "I can not want to know what happened today!\n";
    }
    elsif ( $mood =~ /D|d/ ) {
        $mood = 'Angry';
        print "Take it easy, It's easy to have wrinkles if you are angry.\n";
    }
    elsif ( $mood =~ /E|e/ ) {
        $mood = <STDIN>;
        chomp $mood;
    }
    else {
        exit;
    }
    print "\n";

    print
"what did you do today, what you want to remember and what you want to do tomorrow :\n";
    my $Content = <STDIN>;
    print
"***Name=$name***\n***password=$password***\n***Date=$date***\n***Weather=$weather***\n***Mood=$mood***\n***dairy:\n $Content";
    my $outputfile = $name;
    unless ( open( DAIRY, ">>$outputfile" ) ) {

        print "Cannot open file \"$outputfile\"to write to!!\n\n";
        exit;
    }
    print DAIRY
"***Name=$name***\n***password=$password***\n***Date=$date***\n***Weather=$weather***\n***Mood=$mood***\n***dairy:\n $Content\n";
    close(DAIRY);
    exit;
}

sub Check_password {
    my ( $dairy, $Username_check ) = @_;

    print "Please entry your password: \n";
    system "stty -echo";
    my $password = <STDIN>;
    chomp $password;
    system "stty echo";
    my $salt = 'ab';
    my $password = crypt( $password, $salt );
    if ( $dairy =~ /$password/ ) {
        print "login successfully. $Username_check Welcome back!\n\n";
        dairy_Write_2($Username_check);
    }
    else {
        print "password is wrong, enter r to try again or others to quit:\n\n";
        my $answer = <STDIN>;
        chomp $answer;
        if ( $answer =~ /r/ ) {
            Check_password($answer);
        }
        else {
            exit;
        }
    }

}

sub dairy_Write_2 {
    my ( $Username_check, $dairy ) = @_;
    my $name = $Username_check;
    my $date = strftime( "%Y-%m-%d", localtime() );
    more_Date($date);
    print "\n";

    print
"please choose the weather today:\nA.Sunny.  B.Rainy.  C.Cloudy. D.Snowy. E.Foggy. F.Enter others\n";
    my $weather = <STDIN>;
    chomp $weather;
    if ( $weather =~ /A|a/ ) {
        $weather = 'Sunny';
        print "The sunshine must be comfortable, What's your feeling today?\n";
    }
    elsif ( $weather =~ /B|b/ ) {
        $weather = 'Rainy';
    }
    elsif ( $weather =~ /C|c/ ) {
        $weather = 'Cloudy';
    }
    elsif ( $weather =~ /D|d/ ) {
        $weather = 'Snowy';
    }
    elsif ( $weather =~ /E|e/ ) {
        $weather = 'Foggy';
    }
    elsif ( $weather =~ /F|f/ ) {
        $weather = <STDIN>;
        chomp $weather;
    }
    else {
        exit;
    }
    print "\n";

    print
"How do you fell today?\nA.Happy.  B.Depressed.  C.Exciting.  D.Angry. E.Enter others\n";
    my $mood = <STDIN>;
    chomp $mood;
    if ( $mood =~ /A|a/ ) {
        $mood = 'Happy';
        print "Darling, tell me What makes you so happy today.\n";
    }
    elsif ( $mood =~ /B|b/ ) {
        $mood = 'Depressed';
        print
"I am so sorry, I will accompany you, you will feel better if you tell me that.Before that, let me tell you a joke.\n";
        print
"Can you tell me what fish net is made, Ann? Teacher asked.A lot of little holes tied together with strings. replied the little girl.\n";
        print "Are you feeling better?(yes or no)\n";
        my $answer = <STDIN>;
        chomp $answer;
        if ( $answer =~ /yes/ ) {
            print "Now, tell me what makes you unhappy.\n";
        }
        else {
            print "Let me tell you another joke.\n\n ";
            print
"An instructor in chemical warfare asked soldiers in his class:\nAnyone knows the formula for water?\n Sure. That's easy, said one man.\nWhat is it? H, I, J, K, L, M, N, O.\nWhat, what? reasked the instructor.\nH to O, explained the chemistry expert.\n";
            print "Now, tell me what made you unhappy.\n";
        }
    }
    elsif ( $mood =~ /C|c/ ) {
        $mood = 'Exciting';
        print "I can not want to know what happened today!\n";
    }
    elsif ( $mood =~ /D|d/ ) {
        $mood = 'Angry';
        print "Take it easy, It's easy to have wrinkles if you are angry.\n";
    }
    elsif ( $mood =~ /E|e/ ) {
        $mood = <STDIN>;
        chomp $mood;
    }
    else {
        exit;
    }
    print "\n";

    print
"what did you do today, what you want to remember and what you want to do tomorrow :\n";
    my $Content = <STDIN>;
    print
"***Name=$name***\n***Date=$date***\n***Weather=$weather***\n***Mood=$mood***\n***dairy:\n $Content";
    my $outputfile = $name;
    unless ( open( DAIRY, ">>$outputfile" ) ) {

        print "Cannot open file \"$outputfile\"to write to!!\n\n";
        exit;
    }
    print DAIRY
"***Name=$name***\n***Date=$date***\n***Weather=$weather***\n***Mood=$mood***\n***dairy:\n $Content\n";
    close(DAIRY);
    exit;
}

sub more_Date {
    my $date = @_;
    print "The date of today: $date, Is it a special day?\n entry y or n\n";
    my $ansewr_1 = <STDIN>;
    {
        if ( $ansewr_1 =~ /quit/ ) {
            exit;
        }
        elsif ( $ansewr_1 =~ /y/ ) {
            print "Why ?\n\n";
            my $answer_2 = <STDIN>;
            print "OK, Lets move on\n";
        }

        else {
            print "Lets move on \n ";
        }
    }
}

