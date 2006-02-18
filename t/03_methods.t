package Your::Pages;
use strict;
use warnings;
use Test::More;
use Test::Exception;
use base qw/Class::Accessor/;
use Class::Trigger qw/AFTER_INIT/;

BEGIN {
    eval "use Sledge::Exceptions";
    plan $@ ? (skip_all => 'needs Sledge::Exceptions for testing') : (tests => 4);
}

BEGIN { use_ok 'Sledge::Plugin::Cache' };

can_ok 'Your::Pages', 'cache', 'mk_accessors';
throws_ok {Your::Pages->call_trigger('AFTER_INIT')} 'Sledge::Exception::AbstractMethod', 'call trigger';
throws_ok {Your::Pages->create_cache} 'Sledge::Exception::AbstractMethod', 'create_cache is abstract method';

