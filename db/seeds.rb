# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

Quiz.destroy_all
Booking.destroy_all
Speech.destroy_all
User.destroy_all

u1 = User.create({ name: 'Magda', password: 'magda', email: 'magda@ga.co'})
u2 = User.create({ name: 'Dean', password: 'dean', email: 'dean@ga.co'})
u3 = User.create({ name: 'Denis', password: 'denis', email: 'denis@ga.co'})
u4 = User.create({ name: 'Maggie', password: 'maggie', email: 'maggie@ga.co'})
u5 = User.create({ name: 'Sam', password: 'sam', email: 'sam@ga.co' })
u6 = User.create({ name: 'Jordan', password: 'jordan', email: 'jordan@ga.co'})
u7 = User.create({ name: 'Andrea', password: 'andrea', email: 'andrea@ga.co' })
u8 = User.create({ name: 'Ray', password: 'ray', email: 'ray@ga.co'})
u9 = User.create({ name: 'Tadisha', password: 'tadisha', email: 'tadisa@ga.co' })
u10 = User.create({ name: 'Anthonasia', password: 'anthonasia', email: 'anthonasia@ga.co' })
u11 = User.create({ name: 'Harry', password: 'harry', email: 'harry@ga.co'})
u12 = User.create({ name: 'DT', password: 'dt', email: 'dt@ga.co'})

s1 = Speech.create( {name: 'Welcome and Introduction', speaker: 'Dean Cooper',
      starttime: DateTime.parse("09/01/2009 09:00"), endtime: DateTime.parse("09/01/2009 10:00")})

s2 = Speech.create( {name: 'How I became a great artist', speaker: 'Magda',
      starttime: DateTime.parse("09/01/2009 10:30"), endtime: DateTime.parse("09/01/2009 11:00")})

s3 = Speech.create( {name: 'My love of fast cars and css', speaker: 'Jordan',
      starttime: DateTime.parse("09/01/2009 11:30"), endtime: DateTime.parse("09/01/2009 12:00")})

s4 = Speech.create( {name: 'How I became the trello lord', speaker: 'Denis',
      starttime: DateTime.parse("09/01/2009 12:30"), endtime: DateTime.parse("09/01/2009 13:00")})

s5 = Speech.create( {name: 'My Melbourne adventures', speaker: 'Maggie',
      starttime: DateTime.parse("09/01/2009 13:30"), endtime: DateTime.parse("09/01/2009 14:00")})

b1 = Booking.create({speech_id: s1.id, user_id: u1.id, seat: '1A' })
b2 = Booking.create({speech_id: s1.id, user_id: u2.id, seat: '1B' })
b3 = Booking.create({speech_id: s2.id, user_id: u3.id, seat: '1A' })
b4 = Booking.create({speech_id: s2.id, user_id: u4.id, seat: '1B' })
b5 = Booking.create({speech_id: s3.id, user_id: u5.id, seat: '1A' })
b6 = Booking.create({speech_id: s3.id, user_id: u6.id, seat: '1B' })
b7 = Booking.create({speech_id: s3.id, user_id: u7.id, seat: '2A' })

q1 = Quiz.create({prompt: 'Please correct the below code',
                  problem: "function multiply (a,b) {-n  a * b-n}",
                  answer1: "function multiply (a, b) { return a * b }",
                  answer2: "function multiply (a, b) { return (a * b) } "});

q2 = Quiz.create({prompt: "Write code to output the string 'hello' to the console",
                  problem: "",
                  answer1: "console.log('hello')",
                  answer2: 'console.log("hello")'});

q3 = Quiz.create({prompt: "Fix the code below to write the string array to the console.",
                  problem: "function outputStringArray(arrayOfStrings) { -n  for (index = 0; index < arrayOfStrings.length; ) {-n console.log(arrayOfStrings[]);-n}-n}",
                  answer1: "function outputStringArray(arrayOfStrings) { -n  for (var index = 0; index < arrayOfStrings.length; index++) {-n console.log(arrayOfStrings[index]);-n}-n}",
                  answer2: ''});

q4 = Quiz.create({prompt: "Write code in JQuery to hide all elements with class='test'",
                  problem: "",
                  answer1: "$('.test').hide()",
                  answer2: '$(".test").hide()'});

q5 = Quiz.create({prompt: "Write a JQuery selector to select list items that are in unordered lists",
                  problem: "",
                  answer1: "$('ul li');",
                  answer2: '$("ul li");'});

q6 = Quiz.create({prompt: "Write a HTML p tag element with a class of 'greet' and the words Hello",
                  problem: "",
                  answer1: "<p class='greet'>Hello</p>",
                  answer2: '<p class="greet">Hello</p>'});
