package App::Controller::Home;
use Mojo::Base 'App::Controller::Base';

sub index {
    my $self = shift;

    return $self->render(
        msg => 'Welcome to the Mojolicious real-time web framework!'
    );
}

1;
