package Perinci::To::POD;

our $DATE = '2015-01-05'; # DATE
our $VERSION = '0.60'; # VERSION

use 5.010001;
use Log::Any '$log';
use Moo;

use Locale::TextDomain::UTF8 'Perinci-To-Doc';

extends 'Perinci::To::PackageBase';

sub BUILD {
    my ($self, $args) = @_;
}

sub _md2pod {
    require Markdown::To::POD;

    my ($self, $md) = @_;
    my $pod = Markdown::To::POD::markdown_to_pod($md);
    # make sure we add a couple of blank lines in the end
    $pod =~ s/\s+\z//s;
    $pod . "\n\n\n";
}

sub gen_doc_section_summary {
    my ($self) = @_;

    my $dres = $self->{_doc_res};

    $self->SUPER::gen_doc_section_summary;

    my $name_summary = join(
        "",
        $dres->{name} // "",
        ($dres->{name} && $dres->{summary} ? ' - ' : ''),
        $dres->{summary} // ""
    );

    $self->add_doc_lines(
        "=head1 " . uc(__("Name")),
        "",
        $name_summary,
        "",
    );
}

sub gen_doc_section_version {
    my ($self) = @_;

    my $meta = $self->meta;

    $self->add_doc_lines(
        "=head1 " . uc(__("Version")),
        "",
        $meta->{entity_v} // '?',
        "",
    );
}

sub gen_doc_section_description {
    my ($self) = @_;

    my $dres = $self->{_doc_res};

    $self->add_doc_lines(
        "=head1 " . uc(__("Description")),
        ""
    );

    $self->SUPER::gen_doc_section_description;

    if ($dres->{description}) {
        $self->add_doc_lines(
            $self->_md2pod($dres->{description}),
            "",
        );
    }

    #$self->add_doc_lines(
    #    __("This module has L<Rinci> metadata") . ".",
    #    "",
    #);
}

sub _gen_func_doc {
    my $self = shift;
    my $o = Perinci::Sub::To::POD->new(@_);
    $o->gen_doc;
    $o->doc_lines;
}

sub gen_doc_section_functions {
    require Perinci::Sub::To::POD;

    my ($self) = @_;
    my $dres = $self->{_doc_res};

    $self->add_doc_lines(
        "=head1 " . uc(__("Functions")),
    );

    $self->SUPER::gen_doc_section_functions;

    # XXX if module uses Perinci::Exporter, show a basic usage for importing and
    # show exportability information

    # XXX categorize functions based on tags?
    for my $furi (sort keys %{ $dres->{functions} }) {
        $self->add_doc_lines("");
        for (@{ $dres->{functions}{$furi} }) {
            chomp;
            $self->add_doc_lines($_);
        }
    }
}

sub gen_doc_section_links {
    my $self = shift;

    my $meta = $self->meta;

    if ($meta->{links} && @{ $meta->{links} }) {
        $self->add_doc_lines("=head1 " . __("SEE ALSO"), "");
        for my $link (@{ $meta->{links} }) {
            my $url = $link->{url};
            # currently only handles pm: urls (link to another perl module)
            next unless $url =~ m!\Apm:(?://)?(.+)!;
            my $mod = $1;
            $self->add_doc_lines(
                "L<$mod>" .
                    ($link->{summary} ? ", $link->{summary}." : "") .
                    ($link->{summary} ? $self->_md2pod($link->{description}) : ""),
                "");
        }
    }
}

1;
# ABSTRACT: Generate POD documentation for a package from Rinci metadata

__END__

=pod

=encoding UTF-8

=head1 NAME

Perinci::To::POD - Generate POD documentation for a package from Rinci metadata

=head1 VERSION

This document describes version 0.60 of Perinci::To::POD (from Perl distribution Perinci-To-Doc), released on 2015-01-05.

=head1 SYNOPSIS

You can use the included L<peri-doc> script, or:

 use Perinci::To::POD;
 my $doc = Perinci::To::POD->new(
     name=>"Foo::Bar", meta => {...}, child_metas => {...});
 say $doc->gen_doc;

To generate documentation for a single function, see L<Perinci::Sub::To::POD>.

To generate a usage-like help message for a single function, you can try
the L<peri-func-usage> from the L<Perinci::CmdLine> distribution.

=for Pod::Coverage .+

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

perlancar <perlancar@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by perlancar@cpan.org.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
