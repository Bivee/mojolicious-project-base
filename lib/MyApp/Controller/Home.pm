package MyApp::Controller::Home;
use Mojo::Base 'MyApp::Controller::Base';

sub index {
    my $self = shift;

    # Render template "home/index.html.ep" with message
    $self->render(
        message => 'Welcome to the Bivee Mojolicious project base ;-) !' );
}

1;
