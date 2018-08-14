import fnmatch
import os
from invoke import run, task


@task
def pep8():
    run('pep8 .')


@task
def pylint():
    run('pylint *.py')


@task
def pyflakes():
    run('pyflakes .')


@task
def flake8():
    run('flake8 .')


@task
def yamllint():
    run('yamllint .yamllint')

    matches = []
    for root, dirname, filenames in os.walk("."):
        for filename in fnmatch.filter(filenames, "*.yml"):
            matches.append(os.path.join(root, filename))

        for filename in fnmatch.filter(filenames, "*.yaml"):
            matches.append(os.path.join(root, filename))

    for m in matches:
        run('yamllint %s' % m)


@task(pre=[pep8, pylint, pyflakes, flake8, yamllint])
def lint():
    pass
