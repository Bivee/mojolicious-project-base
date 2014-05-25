package MyApp::Routes;
use Mojo::Base -strict;

sub load {
    my ( $class, $route ) = @_;

    # error
    die "error with route instance!\n"
      unless $route && $route->isa('Mojolicious::Routes');

    # default route to controller
    $route->get('/')->to('Home#index');

    # account actions
    $route->any('/login')
      ->to( controller => 'Account', action => 'login' );

    $route->any('/register')
      ->to( controller => 'Account', action => 'register' );

    $route->any('/forgot')
      ->to( controller => 'Account', action => 'forgot' );

    $route->any('/change/:token')
      ->to( controller => 'Account', action => 'change', token => 0 );


    # home action
    $route->any('/profile')->over( authenticated => 1 )
      ->to( controller => 'Home', action => 'profile' );

    # really!?
    $route->any('/:controller/:action/:id')
      ->to( controller => 'Home', action => 'index', id => 0 );

    #add custom route here

    return $route;
}

1;

__END__
=pod 

=head1 NAME

MyApp::Routes - Route container for MyApp app


=head1 DESCRIPTION

This class is a simple container where you will add all your custom routes 
used at your MyApp app.


=head2 Methods


=head3 load(L<Mojolicious::Routes> instance)

    package MyApp::Routes;

    # config custom routes to Mojolicious::Routes
    my $r = $self->routes;
    MyApp::Routes->load($r);


=head1 AUTHOR

2013 (c) Bivee

L<http://bivee.com.br>

=head1 COPYRIGHT AND LICENSE

2013 (c) Bivee

This is a free software; you can redistribute it and/or modify it under the same terms 
as a Perl 5 programming language system itself.

=cut
