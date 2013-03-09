use strict;
use warnings;

my $indent_level = 0;
my $indent_width = 2;
my $indent_sequence = " ";
my $indent;
my $unindent;
my $oddindent;

while ( my $line = <> ) {
  $line =~ s/^\s+//;
  $line =~ s/[^\S\n]+$//;

  $indent = ( 
    $line =~ m/^(function|if|for|repeat)/ ||
    $line =~ m/function |function\(/ ||
    $line =~ m/(do|{)$/ );

  $oddindent = ( $line =~ m/^(else|elseif)/);

  $unindent = (
    $line =~ m/^(}|},|until)/ ||
    $line =~ m/end(\))?$/ );

  # print "ind " . $indent . " oddind " . $oddindent . " unind " . $unindent . "\n";

  if ( $indent_level < 0) {
    $indent_level = 0;
  }

  if ( $indent && !$unindent ) {
    $line = ($indent_sequence x ($indent_level * $indent_width)) . $line;
    $indent_level = $indent_level + 1;
  } elsif ( $unindent && !$indent ) {
    $indent_level = $indent_level - 1;
    $line = ($indent_sequence x ($indent_level * $indent_width)) . $line;
  } elsif ( $oddindent ) {
    $indent_level = $indent_level - 1;
    $line = ($indent_sequence x ($indent_level * $indent_width)) . $line;
    $indent_level = $indent_level + 1;
  } else {
    $line = ($indent_sequence x ($indent_level * $indent_width)) . $line;
  }

  print $line;
}
