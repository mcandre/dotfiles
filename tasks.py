from invoke import run, task

@task
def pylint():
  run("pylint *.py")

@task
def pyflakes():
  run("pyflakes .")

@task("pylint", "pyflakes")
def lint():
  pass
