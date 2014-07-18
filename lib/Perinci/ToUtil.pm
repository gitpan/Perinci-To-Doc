package Perinci::ToUtil;

use 5.010;
use strict;
use warnings;

our $VERSION = '0.52'; # VERSION

# generate human-readable short description of schema, this will be
# handled in the future by Sah itself (using the human compiler).

sub sah2human_short {
    require Data::Sah;
    require Function::Fallback::CoreOrPP;

    my ($s) = @_;
    if ($s->[0] eq 'any') {
        my @alts    = map {Data::Sah::normalize_schema($_)}
            @{$s->[1]{of} // []};
        my @types   = map {$_->[0]} @alts;
        @types      = sort(Function::Fallback::CoreOrPP::uniq(@types));
        return join("|", @types) || 'any';
    } else {
        return $s->[0];
    }
}

1;
# ABSTRACT: Temporary utility module

__END__

=pod

=encoding UTF-8

=head1 NAME

Perinci::ToUtil - Temporary utility module

=head1 VERSION

This document describes version 0.52 of Perinci::ToUtil (from Perl distribution Perinci-To-Doc), released on 2014-07-18.

=head1 FUNCTIONS

=head2 sah2human_short

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/Perinci-To-Doc>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-Perinci-To-Doc>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=Perinci-To-Doc>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
