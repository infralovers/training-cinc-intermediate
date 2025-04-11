# Chef InSpec test for recipe apache::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/


# This is an example test, replace it with your own test.
describe command('curl http://localhost') do
  its(:stdout) { should match(/Welcome home/) }
end

describe command('curl http://localhost:8080') do
  its(:stdout) { should match(/Welcome admins/) }
end
