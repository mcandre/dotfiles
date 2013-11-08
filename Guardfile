guard :shell do
  watch('Gemfile') do |m|
    title = 'Bundler output'
    msg = 'Bundler Failure'
    status = :failed

    if `bundle`
      msg = 'Bundled'
      status = :status
    end

    n msg, title, status

    "-> #{msg}"
  end

  watch('pom.xml') do |m|
    title = 'Test output'
    status = :failed

    msg = `mvn clean && mvn test`

    if $?.success?
      status = :success
    end

    n msg, title, status

    "-> #{msg}"
  end

  watch(/src\/main\/java\/.+\.java/) do |m|
    title = 'Test output'
    status = :failed

    msg = `mvn -Dtest=\`basename #{m[0]} .java\`Test test`

    if $?.success?
      status = :success
    end

    n msg, title, status

    "-> #{msg}"
  end

  watch(/src\/test\/java\/.+\.java/) do |m|
    title = 'Test output'
    status = :failed

    msg = `mvn -Dtest=\`basename #{m[0]} .java\` test`

    if $?.success?
      status = :success
    end

    n msg, title, status

    "-> #{msg}"
  end

  watch(/src\/main\/thrift\/.+\.thrift/) do |m|
    title = 'Test output'
    status = :failed

    msg = `mvn generate-sources && mvn -Dtest=\`basename #{m[0]} .thrift\`Test test`

    if $?.success?
      status = :success
    end

    n msg, title, status

    "-> #{msg}"
  end
end
