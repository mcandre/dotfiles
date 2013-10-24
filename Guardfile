guard :shell do
  watch("Gemfile") do |m|
    title = "Bundler output"
    msg = "Bundler Failure"
    status = :failed

    if system("bundle")
      msg = "Bundled"
      status = :status
    end

    n msg, title, status

    "-> #{msg}"
  end

  watch(/(pom\.xml)|(src\/(main|test)\/.+\.(thrift|java))/) do |m|
    title = "Test output"
    status = :failed

    msg = `mvn generate-sources -q && mvn test -q`

    if $?.success?
      status = :success
    end

    n msg, title, status

    "-> #{msg}"
  end
end
