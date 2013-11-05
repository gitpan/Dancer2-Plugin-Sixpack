use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Dancer2::Plugin::Sixpack',
    AUTHOR           => q{Menno Blom <blom@cpan.org>},
    VERSION_FROM     => 'lib/Dancer2/Plugin/Sixpack.pm',
    ABSTRACT_FROM    => 'lib/Dancer2/Plugin/Sixpack.pm',
    LICENSE          => 'Perl_5',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
        'Test::LWP::UserAgent' => 0,
        'Dancer2::Test' => 0,
    },
    PREREQ_PM => {
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
        'Dancer2' => 0,
        'WWW::Sixpack' => 0.02,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Dancer2-Plugin-Sixpack-*' },
    META_MERGE => {
        resources => {
            repository => 'https://github.com/b10m/p5-Dancer2-Plugin-Sixpack',
        },
    },

);
