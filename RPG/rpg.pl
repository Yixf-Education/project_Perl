#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long qw(GetOptions);
Getopt::Long::Configure qw(gnu_getopt);
use Pod::Usage qw(pod2usage);

my ( $help, $man ) = 0;
my $number = 1;
my $width  = 12;
my $seed;
my ( $upper, $lower, $digit, $punct ) = 0;
my ( $addition, $exclude );
my $readable = 0;
my $verbose  = 0;

GetOptions(
    "help|h"      => \$help,
    "man|m"       => \$man,
    "number|n=i"  => \$number,
    "width|w=s"   => \$width,
    "seed|s=i"    => \$seed,
    "upper|u"     => \$upper,
    "lower|l"     => \$lower,
    "digit|d"     => \$digit,
    "punct|p"     => \$punct,
    "add|a=s"     => \$addition,
    "exclude|e=s" => \$exclude,
    "readable|r"  => \$readable,
    "verbose|v"   => \$verbose,
) or pod2usage(2);

pod2usage(1) if $help;
pod2usage( -exitval => 0, -verbose => 2 ) if $man;

( $upper || $lower || $digit || $punct )
  or pod2usage(
"$0: At least one character set (uppercase, lowercase, digit, punctuation) must be used.\n"
  );

my @char_set = &make_character_set();

srand($seed) if $seed;

my @passwords;
@passwords = &generate_password_set();

if ($verbose) {
    print "Character set is used:\n";
    print join "", @char_set;
    print "\n\n";
    print "Generating $number randomly passwords ";
    if ( $width =~ /,/ ) {
        print "with lengths between ";
        my ( $min, $max ) = split /,/, $width;
        print "$min and $max:\n\n";
    }
    else {
        print "of length $width\n\n";
    }
}

foreach my $password (@passwords) {
    print "$password\n";
}

exit;

##########################################
# Subroutines
#########################################

sub generate_password_set {
    my ( $len, $min, $max );
    $len = $width;
    if ( $width =~ /,/ ) {
        ( $min, $max ) = split /,/, $width;
    }
    my @passwords;
    for ( my $i = 0 ; $i < $number ; $i++ ) {
        if ( $min && $max ) {
            $len = &random_length( $min, $max );
        }
        my $password = &generate_random_password($len);
        push @passwords, $password;
    }
    return @passwords;
}

sub random_length {
    my ( $min, $max ) = @_;
    return ( int( rand( $max - $min + 1 ) ) + $min );
}

sub generate_random_password {
    my ($len) = @_;
    my $password;
    for ( my $i = 0 ; $i < $len ; $i++ ) {
        $password .= &get_random_character();
    }
    return $password;
}

sub get_random_character {
    return &random_element(@char_set);
}

sub random_element {
    my (@array) = @_;
    return $array[ rand @array ];
}

sub make_character_set {

    # Define different character set
    my $upper_char = join "", ( "A" .. "Z" );
    my $lower_char = join "", ( "a" .. "z" );
    my $digit_char = join "", ( 0 .. 9 );
    my $punct_char = "~`!@#\$\%^&*()-_=+[]{}\\|;:'\",.<>/?";

    # Combine character sets
    my $char_set = "";
    $char_set .= $upper_char if $upper;
    $char_set .= $lower_char if $lower;
    $char_set .= $digit_char if $digit;
    $char_set .= $punct_char if $punct;
    $char_set .= $addition   if $addition;

    # Exclude charactrs from set
    my $char_blacklist;
    $char_blacklist .= "O0l1"   if $readable;
    $char_blacklist .= $exclude if $exclude;
    $char_set =~ s/[$char_blacklist]//g if ( $readable || $exclude );

    return split //, $char_set;
}

__END__
 
=head1 NAME
 
rpg.pl - Random Password Generator
  
=head1 SYNOPSIS
 
rpg.pl [options]

(At least one of [uldp] must be used!)
  
  Options:
    -h,--help        brief help message
    -m,--man         full documentation
    -n,--number      number of the password [default: 1]
    -w,--width       length of the password [default: 12]
    -s,--seed        random seed
    -u,--upper       uppercase letters
    -l,--lower       lowercase letters
    -d,--digit       digits
    -p,--punct       punctations
    -a,--add         additional characters
    -e,--exclude     characters to exclude
    -r,--readable    human-readable
    -v,--verbose     verbose mode
          
=head1 OPTIONS
 
=over 8
 
=item B<-h, --help>
 
Print a brief help message and exits.
  
=item B<-m, --man>
 
Print the manual page and exits.
  
=item B<-n, --number>
 
Set the number of password it will generate.
  
=item B<-w, --width>
 
Set the length of password it will generate. You can use it in two format:

1. L: set the exact length

2. M,N: set the min and max length

=item B<-s, --seed>

Set the random seed so you can get the exact same password.

=item B<-u, --upper>

Use the uppercase letters: A-Z.

=item B<-l, --lower>

Use the lowercase letters: a-z.

=item B<-d, --digit>

Use the digits: 0-9.

=item B<-p, --punct>

Use the punctations.

=item B<-a, --add>

Add characters to use.

=item B<-e, --exclude>

Exclude some characters.

=item B<-r, --readable>

Exclude non-readable characters: O0l1.

=item B<-v, --verbose>

Print some additional information.

=back
 
=head1 DESCRIPTION
 
B<rpg.pl> will generate random password. At least one of [-uldp] must be used.

=head1 EXAMPLES

=over 8

=item ./rpg.pl -uld

=item ./rpg.pl -d -w 15 -n 3 -r

=item ./rpg.pl -uldp -w 8,12 -n 5

=item ./rpg.pl -uld -a "_-" -e "Xx" -v

=item ./rpg.pl -uldp -s 99

=back

=head1 AUTHOR

Yixf (Yi Xianfu)

=head1 VERSION

2016-11-08
  
=cut
