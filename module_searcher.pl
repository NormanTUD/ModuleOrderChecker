#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use lib './perllib';
use Env::Modify 'system';
use Term::ANSIColor;

my %options = (
        modules_to_load => [],
        python_modules_to_load => [],
        bashcode_to_run => [],
        programs_to_find => [],
        modenv => ''
);

analyze_args(@ARGV);

main();

sub red ($) {
        my $p = shift;
        print color('red bold').$p.color("reset")."\n";
}

sub green ($) {
        my $p = shift;
        print color('green bold').$p.color("reset")."\n";
}

sub main {
        while (1) {
                print "=============================>\n";
                my $shuffled = \@{$options{modules_to_load}};
                fisher_yates_shuffle($shuffled);

                my $ok = 1;
                module_purge();
                module_load("modenv/$options{modenv}");

                foreach my $ml (@{$shuffled}) {
                        module_load($ml);
                }

                foreach my $python_import (@{$options{python_modules_to_load}}) {
                        print "python_import: $python_import\n";
                        if (!python_module_is_loadable($python_import)) {
                                red "error $python_import";
                                $ok = 0;
                        } else {
                                green "$python_import ok";
                        }
                }

                foreach my $bash_code (@{$options{bashcode_to_run}}) {
                        print "bash_code: $bash_code\n";
                        system("$bash_code");
                        if(!$? == 0) {
                                red "error $bash_code";
                                $ok = 0;
                        } else {
                                green "$bash_code ok";
                        }
                }

                foreach my $program (@{$options{programs_to_find}}) {
                        print "which $program";
                        system("which $program");
                        if(!$? == 0) {
                                red "error $program";
                                $ok = 0;
                        } else {
                                green "$program ok";
                        }
                }

                if($ok) {
                        my $ongreen = color("BRIGHT_BLUE on_green");
                        my $reset = color("reset");
                        print "permutation:\n".$ongreen."module load ".join("$reset\n$ongreen"."module load ", @{$shuffled})."$reset\n";
                        exit 0;
                }
        }
}

sub modify_system {
        my $command = shift;
        return Env::Modify::system($command);
}

sub module_purge {
    my $lmod_path = $ENV{LMOD_CMD};
    my $command = "eval \$($lmod_path sh purge)";
    local $Env::Modify::CMDOPT{startup} = 1;
    modify_system($command);
}

sub module_load {
    my $toload = shift;

    my $lmod_path = $ENV{LMOD_CMD};
    my $command = "eval \$($lmod_path sh load $toload)";
    local $Env::Modify::CMDOPT{startup} = 1;
    modify_system($command);
}

sub fisher_yates_shuffle {
        my $deck = shift;  # $deck is a reference to an array
        my $i = @$deck;
        while ($i--) {
                my $j = int rand ($i+1);
                @$deck[$i,$j] = @$deck[$j,$i];
        }
}


sub python_module_is_loadable {
        my $module = shift;

        system(qq#python3 -c "import $module"#);

        if($? == 0) {
                return 1;
        } else {
                return 0;
        }
}

sub _help {
        my $exit_code = shift // 0;

        print <<EOF;
perl ml.pl --modenv=ml --ml=Hyperopt/0.2.2-fosscuda-2019b-Python-3.7.4 --ml=MongoDB/4.0.3 --ml=Python/3.7.4-GCCcore-8.3.0 --python_import=pymongo --python_import=hyperopt --bash=mongod
EOF

        exit $exit_code;
}

sub analyze_args {
        foreach (@_) {
                if(m#^--ml=(.*)$#) {
                        push @{$options{modules_to_load}}, $1;
                } elsif (m#^--python_import=(.*)$#) {
                        push @{$options{python_modules_to_load}}, $1;
                } elsif (m#^--bash=(.*)$#) {
                        push @{$options{bashcode_to_run}}, $1;
                } elsif (m#^--programs_to_find=(.*)$#) {
                        push @{$options{programs_to_find}}, $1;
                } elsif (m#^--modenv=(?:modenv)?(ml|scs5|classic)$#) {
                        if($options{modenv} eq "") {
                                $options{modenv} = $1;
                        } else {
                                die "You cannot specify modenv twice!";
                        }
                } elsif (m#^--help$#) {
                        _help();
                } else {
                        die "Unknown switch $_";
                        _help(1);
                }
        }

        if($options{modenv} eq "") {
                die "Modenv needs to be set!";
        }
}

