package MyAPP::Routes;
use Mojo::Base -strict;

sub load {
    my ( $class, $route ) = @_;

    # error
    die "error with route instance!\n"
      unless $route && $route->isa('Mojolicious::Routes');

    # account actions
    $r->any('/login')
      ->to( controller => 'Account', action => 'login' );

    $r->any('/register')
      ->to( controller => 'Account', action => 'register' );

    $r->any('/forgot')
      ->to( controller => 'Account', action => 'forgot' );

    $r->any('/change/:token')
      ->to( controller => 'Account', action => 'change', token => 0 );


    # home action
    $r->any('/profile')->over( authenticated => 1 )
      ->to( controller => 'Home', action => 'profile' );

    # really!?
    $r->any('/:controller/:action/:id')
      ->to( controller => 'Home', action => 'index', id => 0 );

    #add custom route here

    return $route;
}

1;

__END__
=pod 

=head1 NAME

MyAPP::Routes - Route container for MyAPP app


=head1 DESCRIPTION

This class is a simple container where you will add all your custom routes 
used at your MyAPP app.


=head2 Methods


=head3 load(L<Mojolicious::Routes> instance)

    package MyAPP::Routes;

    # config custom routes to Mojolicious::Routes
    my $r = $self->routes;
    MyAPP::Routes->load($r);


=head1 AUTHOR

2013 (c) Bivee

L<http://bivee.com.br>

=head1 COPYRIGHT AND LICENSE

2013 (c) Bivee

This is a free software; you can redistribute it and/or modify it under the same terms 
as a Perl 5 programming language system itself.

=cut
