package Data::Sah::Coerce::perl::obj::str_url;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 3,
        enable_by_default => 0,
        might_fail => 1,
        prio => 50,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};
    my $coerce_to = $args{coerce_to} // 'URI';

    my $res = {};

    $res->{modules}{'URI'} //= 0;
    $res->{expr_match} = "!ref($dt)";
    if ($coerce_to eq 'str') {
        $res->{expr_coerce} = $dt;
    } elsif ($coerce_to eq 'URI') {
        $res->{expr_coerce} = join(
            "",
            "do { my \$url = URI->new($dt); if (!\$url) { ['Invalid URL'] } else { [undef, \$url] } }",
        );
    }
    $res;
}

1;
# ABSTRACT: Coerce URL object (URI) from string

=for Pod::Coverage ^(meta|coerce)$

=head1 DESCRIPTION
