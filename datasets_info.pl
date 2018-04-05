#!/usr/bin/perl
use DBI;
no warnings;

my $dbh = DBI->connect(          
"dbi:SQLite:dbname=$ARGV[0]", 
"",                          
"",                          
{ RaiseError => 0 },         
);
my $stmt = qq(SELECT name FROM sqlite_master WHERE type='table' AND name LIKE '%candles%';);
my $sth = $dbh->prepare( $stmt );
my $rv = $sth->execute();
my @row;
while (@row = $sth->fetchrow_array()) {
  $stmt = qq(SELECT datetime(start, 'unixepoch') FROM `main`.@row order by start ASC LIMIT 1;);
  my $sth = $dbh->prepare( $stmt );
  my $rv = $sth->execute();
  my @row2;
  while (@row2 = $sth->fetchrow_array()) {
    print "@row\nstart: @row2\n";
  }
  $stmt = qq(SELECT datetime(start, 'unixepoch') FROM `main`.@row order by start DESC LIMIT 1;);
  my $sth = $dbh->prepare( $stmt );
  my $rv = $sth->execute();
  my @row2;
  while (@row2 = $sth->fetchrow_array()) {
    print "end: @row2\n";
  }
  $stmt = qq(select count(*) FROM @row;);
  my $sth = $dbh->prepare( $stmt );
  my $rv = $sth->execute();
  while (@row2 = $sth->fetchrow_array()) {
    print "candles: @row2\n";
  }
  my $stmt = qq(SELECT avg(vwp)  FROM `main`.@row);
  my $sth = $dbh->prepare( $stmt );
  my $rv = $sth->execute();
  while (@row2 = $sth->fetchrow_array()) {
    print "avarage price: @row2\n";
  }
  my $stmt = qq(SELECT min(low) FROM `main`.@row;);
  my $sth = $dbh->prepare( $stmt );
  my $rv = $sth->execute();
  while (@row2 = $sth->fetchrow_array()) {
    print "lowest price: @row2\n";
  }
  my $stmt = qq(SELECT max(high)  FROM `main`.@row;);
  my $sth = $dbh->prepare( $stmt );
  my $rv = $sth->execute();
  while (@row2 = $sth->fetchrow_array()) {
    print "highest price: @row2\n";
  }
  my $stmt = qq(SELECT sum(trades)  FROM `main`.@row;);
  my $sth = $dbh->prepare( $stmt );
  my $rv = $sth->execute();
  while (@row2 = $sth->fetchrow_array()) {
    print "trades: @row2\n";
  }
  my $stmt = qq(SELECT sum(volume)  FROM `main`.@row;);
  my $sth = $dbh->prepare( $stmt );
  my $rv = $sth->execute();
  while (@row2 = $sth->fetchrow_array()) {
    print "volume: @row2\n\n";
  }
}
