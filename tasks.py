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
    run('yamllint -s .yamllint .')


@task(pre=[pep8, pylint, pyflakes, flake8, yamllint])
def lint():
    pass
