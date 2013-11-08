from invoke import run, task

@task
def lint():
  run("pylint *.py")
