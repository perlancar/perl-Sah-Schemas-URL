package Sah::Schema::url;

# DATE
# VERSION

our $schema = ['obj', {
    summary => 'URL string',
    isa => 'URI',
    'x.perl.coerce_rules' => ['str_url'],
}, {}];

1;
# ABSTRACT:
