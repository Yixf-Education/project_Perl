#make_a_computer()子程序负责电脑配件的选择输出和价格统计，由李发金负责编写，其他成员负责纠正和调试。
sub make_a_computer {
    my ($file_name) = @_;
    open_file("main_screen");
    print
"please enter your choise(enter 0 to quit or enter 6 to get your choice):";
    $file_name = <STDIN>;
    chomp($file_name);
    print "\n";
    if ( $file_name eq '1' ) {
        choose_CPU();
    }
    elsif ( $file_name eq '2' ) {
        choose_hard_disk();
    }
    elsif ( $file_name eq '3' ) {
        choose_RAM();
    }
    elsif ( $file_name eq '4' ) {
        choose_VGA();
    }
    elsif ( $file_name eq '5' ) {
        choose_main_board();
    }
    elsif ( $file_name eq '6' ) {
        print "Here is your choise of the computer:\n\n";
        computer_element();
        print "\n\n";
        print "Here is the price of your computer:\n\n";
        computer_price();
        print "\n\n";
    }
    elsif ( $file_name eq '0' ) {
        exit;
    }

    #递归调用子程序make_a_computer() 可以实现连续性的交互。
    else { make_a_computer(); }
}

#open_file()子程序由刘晓宇编写，功能就是打开任意文件，并返回文件内容。

sub open_file {
    my ($file_name) = @_;
    open( FILE_NAME, $file_name ) or die "cannot open this file\n";
    my @filename = <FILE_NAME>;
    print @filename, "\n";
    close FILE_NAME;
    return @filename;
}

#choose_main_board()子程序由彭永林编写，功能是根据用户的需求提供各种型号的主板
#和价格，并提示用户进行主板的选择。

sub choose_main_board {

    #system "clear" 命令负责清屏，由孙少省搜索和提供。
    system "clear";
    my %main_board = (
        '1' => 'AMD A68H,399',
        '2' => 'AMD A88X,799',
        '3' => 'AMD 990FX,1499',
        '4' => 'Intel B85,849',
        '5' => 'Intel H61,499',
        '6' => 'Intel Z97,1099',
        '7' => 'Intel Z170,1499',
    );
    open_file("mainboard");
    print "enter your choice:\n";
    my $stain = <STDIN>;
    chomp $stain;
    if ( exists $main_board{$stain} ) {
        print "$main_board{$stain}\n";
    }
    else {
        print "error! choose again.\n";
    }
    my @value = split( ',', $main_board{$stain} );
    $computer_element{'mainboard'} = $value[0];
    push( @price, $value[1] );
    make_a_computer();
}

#由孙少省负责编写完成，功能是实现硬盘的选择和价格的返回。
sub choose_hard_disk {
    system "clear";
    print "\n
1.Seagate Barracuda 1TB 7200r 290yuan\n
2.Seagate Desktop   1TB 7200r 8GB  430yuan\n
3.GALAXY Captionpro 120GB+Seagate Barracuda 1TB 7200r 569yuan\n
4.GALAXY Admiral 256GB+Seagate Barracuda 2TB 7200r 828yuan\n
Please choose your favourate hard disk:\n";
    my $choose = <STDIN>;
    chomp $choose;
    if ( $choose eq '1' ) {
        print "You choose the hard disk:\n
Seagate Barracuda 1TB 7200r 290yuan\n\n";
        push( @price, '290' );
        $computer_element{'hard_disk'} = 'Seagate Barracuda 1TB 7200r 290yuan';

        #put price of hard disk in @price
    }
    elsif ( $choose eq '2' ) {
        print "You choose the hard disk:\n
Seagate Desktop 1TB 7200r 8GB 430yuan\n\n";
        push( @price, '430' );
        $computer_element{'hard_disk'} =
          'Seagate Desktop   1TB 7200r 8GB  430yuan';
    }
    elsif ( $choose eq '3' ) {
        print "You choose the hard disk:\n
GALAXY Captionpro 120GB+Seagate 1TB 7200r 569yuan\n\n";
        push( @price, '569' );
        $computer_element{'hard_disk'} =
          'GALAXY Captionpro 120GB+Seagate Barracuda 1TB 7200r 569yuan';
    }
    elsif ( $choose eq '4' ) {
        print "You choose the hard disk:\n
GALAXY Admiral 256GB+Seagate Barracuda 2TB 7200r 828yuan\n\n";
        push( @price, '828' );
        $computer_element{'hard_disk'} =
          'GALAXY Admiral 256GB+Seagate Barracuda 2TB 7200r 828yuan';
    }
    else {
        print "you didn't choose hard disk\n\n";
    }
    make_a_computer();
}

#由孙少省负责完成，功能是对所选电脑配件的价格进行加和。
sub computer_price {
    my ($tet) = 0;
    for ( my $i = 0 ; $i < scalar(@price) ; $i++ ) {

        #make every factor of @price be added up
        $tet = $tet + $price[$i];
    }
    print "$tet yuan\n";
}

#由李发金完成，负责输出用户所选配件。
sub computer_element() {
    my ($element) = @_;
    foreach $element ( keys %computer_element ) {
        print "$element" . "----" . "$computer_element{$element}" . "\n";
    }
}

#由彭永林负责编写完成，功能是实现内存的选择。
sub choose_RAM {
    system "clear";
    my %ram = (
        '1' => 'Kingston DDR3-1600 4GB  160',
        '2' => 'GALAX DDR3-1600 8GB  269',
        '3' => 'Corsair DDR4-2400 8GB  469',
        '4' => 'Kingston_Beast DDR3-2400 16GB  749',
    );
    open_file('ram');
    print "enter your chioce:\n";
    my $stain = <STDIN>;
    chomp $stain;
    if ( exists $ram{$stain} ) {
        print $ram{$stain}, "\n";
    }
    else {
        print "error! choose again.\n";
    }
    my @value = split( '  ', $ram{$stain} );
    $computer_element{'RAM'} = $value[0];
    push( @price, $value[1] );
    make_a_computer();
}

#由赵天晨负责编写，实现CPU的选择
sub choose_CPU {
    system "clear";
    my @Cpu = open_file('1.1');
    print "please enter your choice:\n";
    my $C = <STDIN>;
    chomp $C;

    my @ycho = '';
    if ( $C eq '1' ) {
        @ycho = split( /\t/, $Cpu[3] );
    }
    elsif ( $C eq '2' ) {
        @ycho = split( /\t/, $Cpu[4] );
    }
    elsif ( $C eq '3' ) {
        @ycho = split( /\t/, $Cpu[5] );
    }
    elsif ( $C eq '4' ) {
        @ycho = split( /\t/, $Cpu[6] );
    }
    elsif ( $C eq '5' ) {
        @ycho = split( /\t/, $Cpu[7] );
    }
    elsif ( $C eq '6' ) {
        @ycho = split( /\t/, $Cpu[8] );
    }
    else { @ycho = split( /\t/, $Cpu[9] ); }
    my @Price = split( / /, $ycho[2] );
    push( @price, $Price[0] );
    $computer_element{'cpu'} = $ycho[0];
    make_a_computer();
}

#由赵天晨编写实现显卡的选择
sub choose_VGA {
    system "clear";
    my @Vga = open_file('2.1.txt');
    print "please enter your choice:\n";
    my $V = <STDIN>;
    chomp $V;
    my @ycho = '';
    if ( $V eq '1' ) {
        @ycho = split( /\t/, $Vga[3] );
    }
    elsif ( $V eq '2' ) {
        @ycho = split( /\t/, $Vga[4] );
    }
    elsif ( $V eq '3' ) {
        @ycho = split( /\t/, $Vga[5] );
    }
    elsif ( $V eq '4' ) {
        @ycho = split( /\t/, $Vga[6] );
    }
    elsif ( $V eq '5' ) {
        @ycho = split( /\t/, $Vga[7] );
    }
    elsif ( $V eq '6' ) {
        @ycho = split( /\t/, $Vga[8] );
    }
    else {
        @ycho = split( /\t/, $Vga[9] );
    }
    my @Price = split( / /, $ycho[2] );
    push( @price, $Price[0] );
    $computer_element{'Vga'} = $ycho[0];
    make_a_computer();
}

1;
