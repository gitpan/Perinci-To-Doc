package Perinci::ToUtil;

our $DATE = '2014-12-11'; # DATE
our $VERSION = '0.58'; # VERSION

use 5.010;
use strict;
use warnings;

sub sah2human_short {
    require Data::Sah::Normalize;
    require Function::Fallback::CoreOrPP;

    my ($s) = @_;
    if ($s->[0] eq 'any') {
        my @alts    = map {Data::Sah::Normalize::normalize_schema($_)}
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

This document describes version 0.58 of Perinci::ToUtil (from Perl distribution Perinci-To-Doc), released on 2014-12-11.

=head1 SYNOPSIS

 use Perinci::ToUtil qw(sah2human_short);

 say sah2human_short("int"); # -> int
 say sah2human_short(["int", {req=>1, min=>0}]); # -> int
 say sah2human_short(["any", of=>["int*", [array=>of=>'int*']]]); # -> int|array

=head1 FUNCTIONS

=head2 sah2human_short($sch) -> str

Generate human-readable short description of schema, basically just type name
(e.g. C<int>) or a list of type names (e.g. C<code|hash>). This is a temporary
function and will be handled in the future by L<Data::Sah> using the human
compiler.

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/Perinci-To-Doc>.

=head1 SOURCE

Source repository is at L<https://github.com/perlancar/perl-Perinci-To-Doc>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=Perinci-To-Doc>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

perlancar <perlancar@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by perlancar@cpan.org.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
