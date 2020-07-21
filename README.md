# ModuleOrderChecker
This permutates the order of "module load"'s until given bash commands, python modules and programs are all loadable

# Example

> perl module_searcher.pl --modenv=scs5 --ml=Hyperopt/0.2.2-fosscuda-2019b-Python-3.7.4 --ml=MongoDB/4.0.3 --ml=Python/3.7.4-GCCcore-8.3.0 --python_import=pymongo --python_import=hyperopt --programs_to_find=mongod

Tries combinations of "Hyperopt/0.2.2-fosscuda-2019b-Python-3.7.4", "MongoDB/4.0.3", "Python/3.7.4-GCCcore-8.3.0", until the following programs work (return 0 exit status):

> python3 -c "import pymongo"

> python3 -c "import hyperopt"

> which mongod
