# NAME

Dancer2::Plugin::Sixpack - Dancer2's plugin for WWW::Sixpack

# DESCRIPTION

This plugin gives you the ability to do A/B testing within Dancer2 easily,
using [http://sixpack.seatgeek.com/](http://sixpack.seatgeek.com/).

It handles the client\_id transparantly through Dancer2's Session plugin.

# SYNOPSIS

    use Dancer2;
    use Dancer2::Plugin::Sixpack;

    get '/route' => sub {
        my $variant = experiment 'decimal_dot_comma', [ 'comma', 'dot' ];

        $price =~ s/\.(?=[0-9]{2})$/,/
           if( $variant eq 'comma' );
        # ...
    };

    get '/some_click' => sub {
        convert 'decimal_dot_comma', 'click';
        redirect $somewhere;
    };

    get '/confirmation' => sub {
        convert 'decimal_dot_comma';
        # ...
    };



# CONFIGURATION

There are no mandatory settings.

    plugins:
      Sixpack:
        host: http://localhost:5000
        experiments:
          decimal_dot_comma:
            - comma
            - dot
          beer:
            - duvel
            - budweiser

The experiments can be generated on the fly without defining them. See below
for more information.

# KEYWORDS

## experiment

Fetch the alternative used for the experiment name passed in.

The experiment and its' alternatives may be defined in the configuration. If
they're not defined, the experiment will be created (if you provided the
alternatives arrayref).

Examples:

    # experiment defined in config:
    my $variant = exeriment 'known-experiment';

    # experiment not defined
    my $variant = experiment 'on-the-fly', [ 'alt-1', 'alt-2' ];

The client\_id will be fetched from session, or generated if needed.

The client's IP address and user agent string are automatically
added to the request for bot detection.

Returns the alternative name chosen.

## convert

Convert a user.

Provide the experiment and (optional) a KPI to track conversion on.
If the KPI doesn't exist yet, it will be created.

When no experiment name is given, we try to fetch the experiments
from the user's session and convert on all of the found experiments.

Returns a hashref with { 'experiment' => 'status' }

## get\_sixpack

Internal method to construct the [WWW::Sixpack](http://search.cpan.org/perldoc?WWW::Sixpack) object.

# AUTHOR

Menno Blom, `<blom at cpan.org>`

# BUGS

Please report any bugs or feature requests to `bug-dancer2-plugin-sixpack at rt.cpan.org`, or through
the web interface at [http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Dancer2-Plugin-Sixpack](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Dancer2-Plugin-Sixpack).  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

# LICENSE AND COPYRIGHT

Copyright 2013 Menno Blom.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See [http://dev.perl.org/licenses/](http://dev.perl.org/licenses/) for more information.
