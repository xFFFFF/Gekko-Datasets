# Its script scaning all databases for missed candles, and add command to import to sh file. 

#!/usr/bin/perl -w
use strict;
use DBI;
use POSIX qw(strftime);
use File::chdir;

open my $fh, '<', 'pairs.conf';
chomp(my @pairs = <$fh>);
close $fh;

foreach (@pairs) {
  my @exchange = split /-/, $_;
  my $dbh = DBI->connect("dbi:SQLite:dbname=$_/history/$exchange[0]_0.1.db", "", "", { RaiseError => 0 });
  my $stmt = qq(SELECT name FROM sqlite_master WHERE type='table' AND name LIKE '%candles%';);
  my $sth = $dbh->prepare( $stmt );
  my $rv = $sth->execute();
  while (my @table = $sth->fetchrow_array()) {
    my @table2 = split /_/, $table[0];
    my $stmt = qq(SELECT start FROM @table ORDER BY start ASC;);
    my $sth = $dbh->prepare( $stmt );
    my $rv = $sth->execute() or die $DBI::errstr;
    my $fmt='%Y-%m-%d %H:%M:%S';
    my $expected;
    while (my @row=$sth->fetchrow_array())  {
      if (defined $expected && $row[0] != $expected) {
        my $f = sprintf "%s", strftime($fmt, localtime ($expected-10000));
        my $t = sprintf "%s", strftime($fmt, localtime ($row[0]+10000));
        print "perl backtest.pl -i -p $exchange[0]:$table2[1]:$table2[2] -f $f -t $t\n";
        local $CWD = "$_";
        sleep 1;
        print `echo "perl backtest.pl -i -p $exchange[0]:$table2[1]:$table2[2] -f \'$f\' -t \'$t\'" >> bascktest4.sh`;
        sleep 2;
        local $CWD = "..";
      }
      $expected=$row[0]+60
    }
  }
}

