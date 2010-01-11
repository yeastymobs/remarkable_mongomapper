# WARNING

The official repo has been moved to "http://github.com/nmerouze/remarkable_mongo":http://github.com/nmerouze/remarkable_mongo

# Remarkable MongoMapper

Remarkable matchers for [MongoMapper](http://github.com/jnunemaker/mongomapper).

## Matchers

<pre><code>it { should have_key(:name, String) }
it { should have_keys(:name, :phone_number, String) }
it { should validate_presence_of(:name, :phone_number, :message => "not there!") }
it { should belong_to(:user, :class_name => 'Person') }
it { should have_many(:users, :class_name => 'Person', :polymorphic => true) }</code></pre>

## TODO

* Finish validate_length_of

## Contributions

It is far from complete! It'd be very helpful to have some help.

## Contributors

* Nicolas Mérouze
* Mathieu Fosse
* Vincent Hellot