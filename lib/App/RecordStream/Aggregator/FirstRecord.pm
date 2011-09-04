package App::RecordStream::Aggregator::FirstRecord;

use strict;
use lib;

use base qw(App::RecordStream::Aggregator::InjectInto);

sub new
{
   my $class = shift;
   my @args  = @_;

   return $class->SUPER::new(@args);
}

sub combine
{
   my $this   = shift;
   my $cookie = shift;
   my $record  = shift;

   return $record unless ( defined $cookie );

   return $cookie;
}

sub short_usage
{
   return "first record";
}

sub long_usage
{
   print "Usage: first\n";
   print "   Returns the first record.\n";
   exit 1;
}

sub argct
{
   return 0;
}

sub returns_record
{
   return 1;
}

App::RecordStream::Aggregator::register_aggregator('firstrecord', __PACKAGE__);
App::RecordStream::Aggregator::register_aggregator('firstrec', __PACKAGE__);

1;
