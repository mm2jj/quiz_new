# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


question1 = Question.create(text: 'Which is the fastest animal on the land? ')
question2 = Question.create(text: 'Which is the principal source of energy for earth?  ')
question3 = Question.create(text: 'Which is the most sensitive organ in our body? ')

Answer.create(text: 'Cheetah', question_id: question1.id, correct: true)
Answer.create(text: 'Lion', question_id: question1.id)
Answer.create(text: 'Fish', question_id: question1.id)


Answer.create(text: 'Water', question_id: question2.id)
Answer.create(text: 'Wind', question_id: question2.id)
Answer.create(text: 'Sun', question_id: question2.id, correct: true)


Answer.create(text: 'Nose', question_id: question3.id)
Answer.create(text: 'Skin', question_id: question3.id, correct: true)
Answer.create(text: 'Eyes', question_id: question3.id)