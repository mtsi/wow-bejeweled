use strict;
use warnings;

while (my $line = <>) {
  $line =~ s/;/\n/g;
  $line =~ s/}/}\n/g;

  $line =~ s/{\[/{\n\[/g;
  $line =~ s/{{/{\n{/g;

  $line =~ s/\n,/,\n/g;

  $line =~ s/,},/,\n},/g;

  $line =~ s/\n\n/\n/g;

  chomp($line);

  print $line . "\n";
}
