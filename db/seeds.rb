bookclubs = BookClub.create!(
  [
    {
      title:        "These Broken Stars",
      author:       "Amie Kaufman and Meagan Spooner",
      description:  "Luxury spaceliner Icarus suddenly plummets from hyperspace into the nearest planet. Lilac LaRoux and Tarver Merendsen survive – alone. Lilac is the daughter of the richest man in the universe. Tarver comes from nothing, a cynical war hero. Both journey across the eerie deserted terrain for help. Everything changes when they uncover the truth.",
      start_date:    "2018-01-01",
      end_date:      "2018-01-31",
      cover:         File.open(File.join(Rails.root,'app/assets/images/cover_art/these_broken_stars.jpg'))
    },
    {
      title:        "Six of Crows",
      author:       "Leigh Bardugo",
      description:  "Criminal prodigy Kaz Brekker has been offered wealth beyond his wildest dreams. But to claim it, he'll have to pull off a seemingly impossible heist: Break into the notorious Ice Court (a military stronghold that has never been breached), retrieve a hostage (who could unleash magical havoc on the world), and survive long enough to collect his reward (and spend it). Kaz needs a crew desperate enough to take on this suicide mission and dangerous enough to get the job done - and he knows exactly who: six of the deadliest outcasts the city has to offer. Together, they just might be unstoppable - if they don't kill each other first.",
      start_date:    "2018-01-01",
      end_date:      "2018-01-31",
      cover:         File.open(File.join(Rails.root,'app/assets/images/cover_art/six_of_crows.jpg'))
    },
    {
      title:        "The Gentleman's Guide to Vice and Virtue",
      author:       "Mackenzi Lee",
      description:  "Henry “Monty” Montague was born and bred to be a gentleman, but he was never one to be tamed. The finest boarding schools in England and the constant disapproval of his father haven’t been able to curb any of his roguish passions—not for gambling halls, late nights spent with a bottle of spirits, or waking up in the arms of women or men.
        But as Monty embarks on his Grand Tour of Europe, his quest for a life filled with pleasure and vice is in danger of coming to an end. Not only does his father expect him to take over the family’s estate upon his return, but Monty is also nursing an impossible crush on his best friend and traveling companion, Percy.",
      start_date:    "2018-01-01",
      end_date:      "2018-01-31",
      cover:         File.open(File.join(Rails.root,'app/assets/images/cover_art/vice&virtue.jpg'))
    }
  ]
)

#General topics
10.times do
  Topic.create!(
    book_club:  bookclubs.sample,
    name:       Faker::Lorem.sentence,
    topic_type: 'general'
  )
end

#Section topics
10.times do
  Topic.create!(
    book_club:  bookclubs.sample,
    name:       Faker::Lorem.sentence,
    topic_type: 'section'
  )
end

topics = Topic.all

#Posts
50.times do
  Post.create!(
    topic:  topics.sample,
    body:   Faker::Lorem.paragraph,
  )
end

puts "Seed finished"
puts "#{BookClub.count} book clubs created."
puts "#{Topic.count} topics created."
puts "#{Post.count} posts created."
