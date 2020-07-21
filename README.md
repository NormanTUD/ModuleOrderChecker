# ModuleOrderChecker
This permutates the order of "module load"'s until given bash commands, python modules and programs are all loadable

# Example

> perl module_searcher.pl --modenv=scs5 --ml=Hyperopt/0.2.2-fosscuda-2019b-Python-3.7.4 --ml=MongoDB/4.0.3 --ml=Python/3.7.4-GCCcore-8.3.0 --python_import=pymongo --python_import=hyperopt --programs_to_find=mongod

Tries combinations of "Hyperopt/0.2.2-fosscuda-2019b-Python-3.7.4", "MongoDB/4.0.3", "Python/3.7.4-GCCcore-8.3.0", until the following programs work (return 0 exit status):

> python3 -c "import pymongo"

> python3 -c "import hyperopt"

> which mongod

# Example output

>=============================>
>Die folgenden Module wurde nicht entladen:
>  (Benutzen Sie "module --force purge" um alle Module zu entladen):
>
>  1) modenv/scs5
>Module MongoDB/4.0.3, Hyperopt/0.2.2-fosscuda-2019b-Python-3.7.4, Python/3.7.4-GCCcore-8.3.0 and 25 dependencies unloaded.
>Module Python/3.7.4-GCCcore-8.3.0 and 11 dependencies loaded.
>Module MongoDB/4.0.3 loaded.
>Module Hyperopt/0.2.2-fosscuda-2019b-Python-3.7.4 and 14 dependencies loaded.
>python_import: pymongo
>pymongo ok
>python_import: hyperopt
>Traceback (most recent call last):
>  File "<string>", line 1, in <module>
>  File "/sw/installed/Hyperopt/0.2.2-fosscuda-2019b-Python-3.7.4/lib/python3.7/site-packages/hyperopt-0.2.2-py3.7.egg/hyperopt/__init__.py", line 3, in <module>
>    from .base import STATUS_STRINGS
>  File "/sw/installed/Hyperopt/0.2.2-fosscuda-2019b-Python-3.7.4/lib/python3.7/site-packages/hyperopt-0.2.2-py3.7.egg/hyperopt/base.py", line 29, in <module>
>    from past.builtins import basestring
>ModuleNotFoundError: No module named 'past'
>error hyperopt
>which mongod/sw/installed/MongoDB/4.0.3/bin/mongod
>mongod ok
>=============================>
>Die folgenden Module wurde nicht entladen:
>  (Benutzen Sie "module --force purge" um alle Module zu entladen):
>
>  1) modenv/scs5
>Module Hyperopt/0.2.2-fosscuda-2019b-Python-3.7.4, MongoDB/4.0.3, Python/3.7.4-GCCcore-8.3.0 and 25 dependencies unloaded.
>Module MongoDB/4.0.3 loaded.
>Module Python/3.7.4-GCCcore-8.3.0 and 11 dependencies loaded.
>Module Hyperopt/0.2.2-fosscuda-2019b-Python-3.7.4 and 14 dependencies loaded.
>python_import: pymongo
>pymongo ok
>python_import: hyperopt
>hyperopt ok
>which mongod/sw/installed/MongoDB/4.0.3/bin/mongod
>mongod ok
>permutation:
>module load MongoDB/4.0.3
>module load Python/3.7.4-GCCcore-8.3.0
>module load Hyperopt/0.2.2-fosscuda-2019b-Python-3.7.4

