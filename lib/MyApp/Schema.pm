package MyApp::Schema;
use base 'DBIx::Class::Schema';

use utf8;
use strict;
use warnings;

__PACKAGE__->load_namespaces;


sub init_db {
    return __PACKAGE__->connect('dbi:mysql:dbname=test', 'user', 'pass');
}

1;
