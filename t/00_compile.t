use strict;
use warnings;
use Test::More;

BEGIN {
    eval "use Sledge::Exceptions";
    plan $@ ? (skip_all => 'needs Sledge::Exceptions for testing') : (tests => 1);
}

sub mk_accessors { 'dummy for test' }
sub add_trigger  { 'dummy for test' }
BEGIN { use_ok 'Sledge::Plugin::Cache' }
