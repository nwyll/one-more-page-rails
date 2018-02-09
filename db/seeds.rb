# Admin user
admin = User.create!(
  name:       'Natalie',
  email:      'nataliewyll@yahoo.com',
  password:   'helloworld',
  role:       'admin',
  confirmed_at: Datetime.now
)

# Book Clubs
bookclubs = BookClub.create!(
  [
    {
      title:        "These Broken Stars",
      author:       "Amie Kaufman and Meagan Spooner",
      description:  "Luxury spaceliner Icarus suddenly plummets from hyperspace into the nearest planet. Lilac LaRoux and Tarver Merendsen survive – alone. Lilac is the daughter of the richest man in the universe. Tarver comes from nothing, a cynical war hero. Both journey across the eerie deserted terrain for help. Everything changes when they uncover the truth.",
      start_date:    "2018-02-01",
      end_date:      "2018-02-31",
      cover:         File.open(File.join(Rails.root,'app/assets/images/cover_art/these_broken_stars.jpg'))
    },
    {
      title:        "Six of Crows",
      author:       "Leigh Bardugo",
      description:  "Criminal prodigy Kaz Brekker has been offered wealth beyond his wildest dreams. But to claim it, he'll have to pull off a seemingly impossible heist: Break into the notorious Ice Court (a military stronghold that has never been breached), retrieve a hostage (who could unleash magical havoc on the world), and survive long enough to collect his reward (and spend it). Kaz needs a crew desperate enough to take on this suicide mission and dangerous enough to get the job done - and he knows exactly who: six of the deadliest outcasts the city has to offer. Together, they just might be unstoppable - if they don't kill each other first.",
      start_date:    "2018-02-01",
      end_date:      "2018-02-31",
      cover:         File.open(File.join(Rails.root,'app/assets/images/cover_art/six_of_crows.jpg'))
    },
    {
      title:        "The Gentleman's Guide to Vice and Virtue",
      author:       "Mackenzi Lee",
      description:  "Henry “Monty” Montague was born and bred to be a gentleman, but he was never one to be tamed. The finest boarding schools in England and the constant disapproval of his father haven’t been able to curb any of his roguish passions—not for gambling halls, late nights spent with a bottle of spirits, or waking up in the arms of women or men. But as Monty embarks on his Grand Tour of Europe, his quest for a life filled with pleasure and vice is in danger of coming to an end. Not only does his father expect him to take over the family’s estate upon his return, but Monty is also nursing an impossible crush on his best friend and traveling companion, Percy.",
      start_date:    "2018-02-01",
      end_date:      "2018-02-31",
      cover:         File.open(File.join(Rails.root,'app/assets/images/cover_art/vice_and_virtue.jpg'))
    },
    {
      title:        "Illuminae",
      author:       "Amie Kaufman & Jay Kristoff",
      description:  "The year is 2575, and two rival megacorporations are at war over a planet that’s little more than an ice-covered speck at the edge of the universe. Too bad nobody thought to warn the people living on it. With enemy fire raining down on them, Kady and Ezra—who are barely even talking to each other—are forced to fight their way onto an evacuating fleet, with an enemy warship in hot pursuit. BRIEFING NOTE: Told through a fascinating dossier of hacked documents—including emails, schematics, military files, IMs, medical reports, interviews, and more—Illuminae is the first book in a heart-stopping, high-octane trilogy about lives interrupted, the price of truth, and the courage of everyday heroes.",
      start_date:    "2018-02-01",
      end_date:      "2018-02-28",
      cover:         File.open(File.join(Rails.root,'app/assets/images/cover_art/illuminae.jpg'))
    },
    {
      title:        "Everless",
      author:       "Sara Holland",
      description:  "In the kingdom of Sempera, time is currency—extracted from blood, bound to iron, and consumed to add time to one’s own lifespan. The rich aristocracy, like the Gerlings, tax the poor to the hilt, extending their own lives by centuries. No one resents the Gerlings more than Jules Ember. A decade ago, she and her father were servants at Everless, the Gerlings’ palatial estate, until a fateful accident forced them to flee in the dead of night. When Jules discovers that her father is dying, she knows that she must return to Everless to earn more time for him before she loses him forever.",
      start_date:    "2018-03-01",
      end_date:      "2018-03-28",
      cover:         File.open(File.join(Rails.root,'app/assets/images/cover_art/everless.jpg'))
    },
    {
      title:        "Our Dark Duet",
      author:       "Victoria Schwab",
      description:  "THE WORLD IS BREAKING. AND SO ARE THEY. Kate will have to return to Verity. August will have to let her back in. And a new monster is waiting—one that feeds on chaos and brings out its victims' inner demons. Which will be harder to conquer: the monsters they face, or the monsters within?",
      start_date:    "2018-03-01",
      end_date:      "2018-03-28",
      cover:         File.open(File.join(Rails.root,'app/assets/images/cover_art/our_dark_duet.jpg'))
    },
    {
      title:        "Warcross",
      author:       "Marie Lu",
      description:  "For the millions who log in every day, Warcross isn’t just a game—it’s a way of life. The obsession started ten years ago and its fan base now spans the globe, some eager to escape from reality and others hoping to make a profit. Struggling to make ends meet, teenage hacker Emika Chen works as a bounty hunter, tracking down players who bet on the game illegally. But the bounty hunting world is a competitive one, and survival has not been easy. Needing to make some quick cash, Emika takes a risk and hacks into the opening game of the international Warcross Championships—only to accidentally glitch herself into the action and become an overnight sensation.",
      start_date:    "2018-03-01",
      end_date:      "2018-03-31",
      cover:         File.open(File.join(Rails.root,'app/assets/images/cover_art/warcross.jpg'))
    },
    {
      title:        "Red Queen",
      author:       "Victoria Aveyard",
      description:  "This is a world divided by blood - red or silver. The Reds are commoners, ruled by a Silver elite in possession of god-like superpowers. And to Mare Barrow, a seventeen-year-old Red girl from the poverty-stricken Stilts, it seems like nothing will ever change. That is, until she finds herself working in the Silver Palace. Here, surrounded by the people she hates the most, Mare discovers that, despite her red blood, she possesses a deadly power of her own. One that threatens to destroy the balance of power.Fearful of Mare's potential, the Silvers hide her in plain view, declaring her a long-lost Silver princess, now engaged to a Silver prince. Despite knowing that one misstep would mean her death, Mare works silently to help the Red Guard, a militant resistance group, and bring down the Silver regime. But this is a world of betrayal and lies, and Mare has entered a dangerous dance - Reds against Silvers, prince against prince, and Mare against her own heart.",
      start_date:    "2018-03-01",
      end_date:      "2018-03-31",
      cover:         File.open(File.join(Rails.root,'app/assets/images/cover_art/red_queen.jpg'))
    },
    {
      title:        "Shadow and Bone",
      author:       "Leigh Bardugo",
      description:  "Surrounded by enemies, the once-great nation of Ravka has been torn in two by the Shadow Fold, a swath of near impenetrable darkness crawling with monsters who feast on human flesh. Now its fate may rest on the shoulders of one lonely refugee. Alina Starkov has never been good at anything. But when her regiment is attacked on the Fold and her best friend is brutally injured, Alina reveals a dormant power that saves his life—a power that could be the key to setting her war-ravaged country free. Wrenched from everything she knows, Alina is whisked away to the royal court to be trained as a member of the Grisha, the magical elite led by the mysterious Darkling. Yet nothing in this lavish world is what it seems. With darkness looming and an entire kingdom depending on her untamed power, Alina will have to confront the secrets of the Grisha . . . and the secrets of her heart.",
      start_date:    "2017-10-01",
      end_date:      "2017-10-31",
      cover:         File.open(File.join(Rails.root,'app/assets/images/cover_art/shadow_and_bone.jpg'))
    }
  ]
)

case Rails.env
when "development"
  # Create member users
  member = User.create!(
    name:       'Member',
    email:      'member@test.com',
    password:   'helloworld',
    role:       'member'
  )

  5.times do
    User.create!(
      name:     Faker::Name.name,
      email:    Faker::Internet.email,
      password: Faker::Internet.password,
      role:     'member'
      )
  end

  members = User.where(role: 'member')

  # General topics
  10.times do
    Topic.create!(
      book_club:  bookclubs.sample,
      name:       Faker::Lorem.sentence,
      topic_type: 'general'
    )
  end

  # Section topics
  10.times do
    Topic.create!(
      book_club:  bookclubs.sample,
      name:       Faker::Lorem.sentence,
      topic_type: 'section'
    )
  end

  topics = Topic.all

  # Posts
  50.times do
    Post.create!(
      user:   members.sample,
      topic:  topics.sample,
      body:   Faker::Lorem.paragraph
    )
  end

  posts = Post.all

  # Comments
  50.times do
    Comment.create!(
      user:   members.sample,
      post:   posts.sample,
      body:   Faker::Lorem.paragraph
    )
  end

  puts "Seed finished"
  puts "#{User.count} users created."
  puts "#{BookClub.count} book clubs created."
  puts "#{Topic.count} topics created."
  puts "#{Post.count} posts created."
  puts "#{Comment.count} comments created."
end
