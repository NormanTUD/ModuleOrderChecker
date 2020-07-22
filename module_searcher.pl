#!/usr/bin/perl

use strict;
use warnings;
use lib './perllib';
use Env::Modify 'system';
use Term::ANSIColor;
use Data::Dumper;
use Digest::MD5 qw/md5_hex/;

my %options = (
        modules_to_load => [],
        python_modules_to_load => [],
        bashcode_to_run => [],
        programs_to_find => [],
        modenv => '',
        max_tries => 0,
        max_time => 0
);

my %already_checked = ();

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


sub faculty {
    my $n = shift ;
    my $product = 1 ;
    foreach my $i ( 1..$n ) {
        $product *= $i ;
    }
    return $product ;
}

sub main {
        my $continue = 1;
        my $i = 1;
        my $t_start = time();
        my $already_dones = 0;

        my $max_number_of_combinations = faculty(scalar @{$options{modules_to_load}});

        while ($continue) {
            my $shuffled = \@{$options{modules_to_load}};
            fisher_yates_shuffle($shuffled);
            my $ret = check_combination($shuffled, $i, $max_number_of_combinations);
            if($ret eq "ALREADYDONE") {
                $already_dones++;
            } else {
                $i++;
            }

            if($options{max_tries} && $i > $options{max_tries}) {
                warn "Reached limit of maximally $options{max_tries} checks. Stopping";
                $continue = 0;
            }

            my $diff = time() - $t_start;
            if($options{max_time} && $diff > $options{max_time}) {
                warn "Hit time limit ($diff > $options{max_time})";
                $continue = 0;
            }

            if($already_dones >= $max_number_of_combinations) {
                print "Checked all combinations, none seemed to have worked\n";
                exit 1;
            }
        }
}

sub check_combination {
        my ($shuffled, $i, $max) = @_;

        my $hash = md5_hex(Dumper($shuffled));

        if (exists $already_checked{$hash}) {
                return 'ALREADYDONE';
        }

        $already_checked{$hash} = 1;

        print "$i of $max =============================>\n";

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

        if($ok) {
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
        }

        if($ok) {
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
        }

        if($ok) {
                my $ongreen = color("BRIGHT_BLUE on_green");
                my $reset = color("reset");
                print "permutation:\n".$ongreen."module load ".join("$reset\n$ongreen"."module load ", @{$shuffled})."$reset\n";
                exit 0;
        } else {
                return 'FAILED';
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
Example
    perl ml.pl --modenv=ml --ml=Hyperopt/0.2.2-fosscuda-2019b-Python-3.7.4 --ml=MongoDB/4.0.3 --ml=Python/3.7.4-GCCcore-8.3.0 --python_import=pymongo --python_import=hyperopt --bash=mongod

Parameters

        --ml=ModuleName/Version                 Specifies module to be loaded
        --max_tries=100                         Stops after 100 combinations
        --max_time=120                          Stops after ca. 120 seconds of trying
        --python_import=hyperopt                Needs to be able to load hyperopt before declaring success
        --bash="simple_command"                 Needs to run simple_command and exit with 0 before declaring success
        --programs_to_find=mongod               Needs to be able to find a "mongod" executable in the PATHs
        --modenv=scs5                           Specifies under which modenv should be looked (needed!)
        --help                                  This help
EOF

        exit $exit_code;
}

sub analyze_args {
        foreach (@_) {
                if(m#^--ml=(.*)$#) {
                        push @{$options{modules_to_load}}, $1;
                } elsif (m#^--max_tries=(\d+)$#) {
                        $options{max_tries} = $1;
                } elsif (m#^--max_time=(\d+)$#) {
                        $options{max_time} = $1;
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

