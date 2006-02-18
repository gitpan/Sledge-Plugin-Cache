package Sledge::Plugin::Cache;
use strict;
use warnings;
our $VERSION = '0.01';
use Sledge::Exceptions;

sub import {
    my $self = shift;
    my $pkg  = caller;

    $pkg->mk_accessors('cache');
    $pkg->add_trigger(AFTER_INIT => sub {
        my $self = shift;
        $self->cache($self->create_cache);
    });

    no strict 'refs';
    *{"$pkg\::create_cache"} = sub { 
        Sledge::Exception::AbstractMethod->throw
    };
}

1;
__END__

=head1 NAME

Sledge::Plugin::Cache - Object cache plugin for Sledge

=head1 SYNOPSIS

    package Your::Pages;
    use Sledge::Plugin::Cache;
    use Sledge::Cache::Memcached;
    sub create_cache { return Sledge::Cache::Memcached->new(shift) }

    sub dispatch_foo {
        my $data;
        unless ($self->cache->param('data')) {
            $data = [Your::Data->retrieve_all];
            $self->cache->param(data => $data);
        }
        $self->tmpl->param(data => $data);
    }

=head1 DESCRIPTION

This module provides an easy way to use cache in your pages classes.

=head1 AUTHOR

MATSUNO Tokuhiro E<lt>tokuhiro at mobilefactory.jpE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Bundle::Sledge>

=cut
