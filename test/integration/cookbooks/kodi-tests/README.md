# kodi-tests

A test fixture cookbook for use in the kodi cookbook's [test-kitchen][1] integration tests.

The reason we need this is for including test-only cookbook dependencies, specifically: mwrock/export-node

For the original example where this pattern is demonstrated, see:

1. [Accessing Chef Node attributes from kitchen tests][2]
2. [Multi-Node testing with test-kitchen and docker][3]
3. [mwrock/couchbase cookbook usage example][4]

[1]: https://kitchen.ci
[2]: http://www.hurryupandwait.io/blog/accessing-chef-node-attributes-from-kitchen-tests
[3]: http://www.hurryupandwait.io/blog/multi-node-testing-with-test-kitchen-and-docker
[4]: https://github.com/mwrock/couchbase/blob/multi-node/test/integration/cookbooks/couchbase-tests/metadata.rb

