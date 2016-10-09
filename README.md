### How to Run

Ruby version: 2.2.2

```
$ bundle
$ be shotgun
```
Visit http://localhost:9393 in your browser and fill out the form!

For example in the test case provided:

> A Level 10 Warrior using an Axe with the following stats:
> 50-65 DMG, 20 STR, 10% Fire Damage

The form would look like this:

![form](http://i.imgur.com/UyXcn2x.png)

And you would see these results:

![results](http://i.imgur.com/N9o2Qj2.png)

### Design
My main goal was to make it flexible enough that adding a new warrior, weapon, or attack could be easily handled. I seperated attacks, warriors, and weapons into parent classes. This way it is easy to add a new child class if Copycat Gaming wanted a new weapon, warrior, etc you just need to create a child class with the stats provided as constants. In my controller I tried to methods that weapon_creator that would be helpful and easy to toggle between the different child classes the user request in the form drop-downs.

All calculations are done using the AttackCalculator. If calculation rules change then you can easily modify the methods in this class.

I have a simple view that has a user fill out a form to calculate results, if I had more time I would put validations on the form to prevent user error when filling it out.

### Tech
* Ruby
* Sinatra
* Little but of JQuery/AJAX
* Bootstrap

### Testing
All test can be found in spec/models, I used RSpec for all my model tests.
