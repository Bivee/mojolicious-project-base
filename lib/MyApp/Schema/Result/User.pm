package MyApp::Schema::Result::User;
use base 'DBIx::Class::Core';

use utf8;
use strict;
use warnings;

__PACKAGE__->load_components("InflateColumn::DateTime");

__PACKAGE__->table("user");
__PACKAGE__->add_columns(
    "user_id",
    { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
    "name",
    { data_type => "varchar", is_nullable => 0, size => 60 },
    "email",
    { data_type => "varchar", is_nullable => 0, size => 60 },
    "password",
    { data_type => "varchar", is_nullable => 0, size => 100 },
    "about_me",
    { data_type => "varchar", is_nullable => 1, size => 250 },
    "change",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "token",
    { data_type => "varchar", is_nullable => 1, size => 100 },
    "created",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "updated",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
);

__PACKAGE__->set_primary_key("user_id");

1;
