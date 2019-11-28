package Sah::Schema::url;

# AUTHOR
# DATE
# DIST
# VERSION

our $schema = ['obj', {
    summary => 'URL string',
    isa => 'URI',
    'x.perl.coerce_rules' => ['From_str::url'],
}, {}];

1;
# ABSTRACT:
