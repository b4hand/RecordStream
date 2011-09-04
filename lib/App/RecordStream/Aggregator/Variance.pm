package App::RecordStream::Aggregator::Variance;

use strict;
use lib;

use App::RecordStream::Aggregator::Ord2Univariate;
use App::RecordStream::Aggregator;

use base 'App::RecordStream::Aggregator::Ord2Univariate';

sub new
{
   my ($class, @args) = @_;
   return $class->SUPER::new(@args);
}

sub squish
{
   my ($this, $cookie) = @_;

   my ($sum1, $sumx, $sumx2) = @$cookie;

   return ($sumx2 / $sum1) - ($sumx / $sum1) ** 2;
}

sub long_usage
{
   while(my $line = <DATA>)
   {
      print $line;
   }
   exit 1;
}

sub short_usage
{
   return "find variance of provided field";
}

App::RecordStream::Aggregator::register_aggregator('var', __PACKAGE__);
App::RecordStream::Aggregator::register_aggregator('variance', __PACKAGE__);

1;

__DATA__
Usage: var,<field1>
   Variance of specified fields.

This is computed as Var(X) = E[(X - E[X])^2].  Variance is an indication of
deviation from average value.
