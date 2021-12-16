# Martian Robots

This challenge is solved in `ruby` and for tests `rspec` was used, you can see the algorithm [here](/movement.rb), and the tests [here](/spec/movement_spec.rb)

First use `bundle` to install rspec gem for the ruby project

    bundle install

To run all tests using this command on the root path

    rspec

To run a single test, use this command on the root path, pointing to the line number where the test begins.

    rspec spec/movement_spec.rb:#


***Important!!***

For now, the algorithm works by console and to test possible new scenarios I think the best option is to add a test and run it individually or all.

I leave you a commented test so that you can edit and test it, to run it without problems, please comment on the `skip` block, it will look like this.

```ruby
it "Sample test" do
    # skip 'this is an example so you can use it in your tests.' do
      ...
    # end
  end
```

