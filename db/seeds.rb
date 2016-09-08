# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Attendance.destroy_all
Afterevent.destroy_all
Quiz.destroy_all
Booking.destroy_all
Speech.destroy_all
User.destroy_all

u1 = User.create({ name: 'Magda', email: 'magda@ga.co'})
u2 = User.create({ name: 'Dean', email: 'dean@ga.co'})
u3 = User.create({ name: 'Denis', email: 'denis@ga.co'})
u4 = User.create({ name: 'Maggie', email: 'maggie@ga.co'})
u5 = User.create({ name: 'Sam', email: 'sam@ga.co' })
u6 = User.create({ name: 'Jordan', email: 'jordan@ga.co'})
u7 = User.create({ name: 'Andrea', email: 'andrea@ga.co' })
u8 = User.create({ name: 'Ray', email: 'ray@ga.co'})
u9 = User.create({ name: 'Tadisha', email: 'tadisa@ga.co' })
u10 = User.create({ name: 'Anthonasia', email: 'anthonasia@ga.co' })
u11 = User.create({ name: 'Harry', email: 'harry@ga.co'})
u12 = User.create({ name: 'DT', email: 'dt@ga.co'})

s1 = Speech.create( {name: 'Welcome and Introduction', speaker: 'Maggie McCain', theme: 'General', description: "We welcome you to the 5th Annual WDIConf.  We'll give you an overview of the conference, logistics, and some motivational nuggets of knowledge to kick off a fun, inspiring weekend of learning and connecting with your peers.",
      starttime: DateTime.parse("09/01/2009 09:00"), endtime: DateTime.parse("09/01/2009 10:00")})

s6 = Speech.create( {name: 'Achieving Maximum Efficiency with Agile', speaker: 'Denis Ng', theme: 'Agile', description: "The Ultimate Scrum Master gives us a crash course in optimizing efficiency for your team by implementing Agile methodologies in your organization.  Learn how to free your team of the sequential waterfall development by improving your workflow and team reaction to unpredictability in the workplace.",
      starttime: DateTime.parse("09/01/2009 10:00"), endtime: DateTime.parse("09/01/2009 11:00")})

s2 = Speech.create( {name: 'Getting SASSy', speaker: 'Jordan Etzler', theme: 'SASS/CSS', description: 'Jordan is a SASS wizard who will give us a deep dive into all the features SASS offers to make your styling that much easier.',
      starttime: DateTime.parse("09/01/2009 11:00"), endtime: DateTime.parse("09/01/2009 12:30")})

s3 = Speech.create( {name: 'Lunch Hour', description: 'Complimentary catered lunch served on premise', speaker: 'Envato',
      starttime: DateTime.parse("09/01/2009 12:30"), endtime: DateTime.parse("09/01/2009 14:00")})

s4 = Speech.create( {name: 'Node-torious B.I.G.', speaker: 'Dean Cooper', theme: 'Node.js', description: 'Dean will be teaching Javascript newbies how to use the language beyond the browser with nodeJS, as an alternative to Sinatra and Rails.',
      starttime: DateTime.parse("09/01/2009 14:00"), endtime: DateTime.parse("09/01/2009 15:00")})

s5 = Speech.create( {name: 'What a-Bot it?', speaker: 'Harry Aydin', theme: 'Robots', description: 'Ever wondered how to better organize team communications and queues?  There\'s a bot for that.',
      starttime: DateTime.parse("09/01/2009 15:00"), endtime: DateTime.parse("09/01/2009 16:00")})

s7 = Speech.create( {name: 'Gems & Ruby', speaker: 'Magda Bialon', theme: 'Ruby', description: 'Magda unearths the true diamonds among the infinite list of gems available to Ruby users.',
      starttime: DateTime.parse("09/01/2009 16:00"), endtime: DateTime.parse("09/01/2009 17:00")})

q1 = Quiz.create({prompt: 'Please correct the below code',
                  problem: "function multiply (a,b) {-n  a * b-n}",
                  answer1: "function multiply (a, b) { return a * b }",
                  answer2: "function multiply (a, b) { return (a * b) } "});

q2 = Quiz.create({prompt: "Write code to output the string 'hello' to the console using Javascript",
                  problem: "",
                  answer1: "console.log('hello')",
                  answer2: 'console.log("hello")'});

q3 = Quiz.create({prompt: "Fix the code below to write the string array to the console.",
                  problem: "function outputStringArray(arrayOfStrings) { -n  for (index = 0; index < arrayOfStrings.length; ) {-n console.log(arrayOfStrings[]);-n}-n}",
                  answer1: "function outputStringArray(arrayOfStrings) { -n  for (var index = 0; index < arrayOfStrings.length; index++) {-n console.log(arrayOfStrings[index]);-n}-n}",
                  answer2: ''});

q4 = Quiz.create({prompt: "Write code in JQuery to hide all elements with a class of 'test'",
                  problem: "",
                  answer1: "$('.test').hide()",
                  answer2: '$(".test").hide()'});

q5 = Quiz.create({prompt: "Write a JQuery selector to select list items that are in unordered lists",
                  problem: "",
                  answer1: "$('ul li');",
                  answer2: '$("ul li");'});

q6 = Quiz.create({prompt: "Write a HTML p tag with a class of 'greet' and the words Hello",
                  problem: "",
                  answer1: "<p class='greet'>Hello</p>",
                  answer2: '<p class="greet">Hello</p>'});

e1 = Afterevent.create({ user_id: u9.id, name: "Dinner @ Attica", location: "74 Glen Eira Rd, Ripponlea"});
e2 = Afterevent.create({ user_id: u8.id, name: "Dinner @ Crown", location: "130/8 Whiteman St, Southbank"});
e3 = Afterevent.create({ user_id: u7.id, name: "Party @ Bond", location: "24 Bond St, CBD"});

l1 = Attendance.create ({ afterevent_id: e1.id, user_id: u9.id });
l2 = Attendance.create ({ afterevent_id: e1.id, user_id: u7.id });
l3 = Attendance.create ({ afterevent_id: e2.id, user_id: u11.id });
l4 = Attendance.create ({ afterevent_id: e3.id, user_id: u10.id });
l5 = Attendance.create ({ afterevent_id: e3.id, user_id: u8.id });
l6 = Attendance.create ({ afterevent_id: e3.id, user_id: u12.id });
