package App::Routes;
use Mojo::Base -strict;

sub register {
    my ($self, $r) = @_;

    # error: not router obj ref
    die Mojo::Exception->new('parameter is not a valid router object')
        unless $r->isa('Mojolicious::Routes');

    # Default route to home
    $r->get('/')->to(controller => 'Home', action => 'index');


    # API end-points
    my $api = $r->under('/api' => sub {
        # validations and checks
        return 1;
    });

    my $user_api = $api->any('/user')->to( controller => 'API::User' );
    $user_api->get('/')->to( action => 'list' );
    $user_api->post('/')->to( action => 'create' );
    $user_api->put('/:id')->to( action => 'update', id => 0 );
    $user_api->delete('/:id')->to( action => 'remove', id => 0 );

}

1;
