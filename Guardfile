guard :shell do
  watch('pom.xml') do |m|
    title = 'Test'
    msg = `mvn clean && mvn test`
    status = ($?.success? && :success) || :failed

    n msg, title, status
    "-> #{msg}"
  end

  watch(%r{src/main/java/.+\.java}) do |m|
    title = 'Test'
    msg = `mvn test-compile -q && mvn -Dtest=\`basename #{m[0]} .java\`Test test`
    status = ($?.success? && :success) || :failed

    n msg, title, status
    "-> #{msg}"
  end

  watch(%r{src/test/java/.+\.java}) do |m|
    title = 'Test'
    msg = `mvn test-compile -q && mvn -Dtest=\`basename #{m[0]} .java\` test`
    status = ($?.success? && :success) || :failed

    n msg, title, status
    "-> #{msg}"
  end

  watch(%r{src/main/thrift/.+\.thrift}) do |m|
    title = 'Test'
    msg = `mvn generate-sources && mvn test-compile -q && mvn -Dtest=\`basename #{m[0]} .thrift\`Test test`
    status = ($?.success? && :success) || :failed

    n msg, title, status
    "-> #{msg}"
  end
end
