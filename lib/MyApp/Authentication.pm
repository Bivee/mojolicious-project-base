package MyApp::Authentication;

use MyApp::Schema;

sub load_user {
    my ($class, $app, $uid) = @_;
    
    my $schema = MyApp::Schema->init_db;
    my $user_rs = $schema->resultset('User');
    return $user_rs->find($uid);
}

sub validate_user {
    my ($class, $app, $username, $password, $extas) = @_;

    my $schema = MyApp::Schema->init_db;
    my $user_rs = $schema->resultset('User');
    my $user = $user_rs->find( 
        { email => $username, password => $password }
    );

    # user found
    return $user->user_id if $user;
}

1;
