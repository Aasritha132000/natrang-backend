Booking.destroy_all
QuizScore.destroy_all
Bookmark.destroy_all
Progress.destroy_all
Review.destroy_all
Quiz.destroy_all
Video.destroy_all
Dance.destroy_all
User.destroy_all

User.create!(
  name: "Admin",
  email: "admin@natrang.com",
  password: "password123",
  is_admin: true
)

Dance.create!([
  { name: "Bharatanatyam", region: "Tamil Nadu", dance_type: "Classical", description: "One of the oldest classical dance forms of India originating from Tamil Nadu.", history: "Bharatanatyam originated in the temples of Tamil Nadu and was performed by Devadasis.", image_url: "dancebb_bg.jpg" },
  { name: "Kathak", region: "Uttar Pradesh", dance_type: "Classical", description: "A major classical dance form from North India known for its fast spins.", history: "Kathak evolved from storytelling traditions in North India.", image_url: "kathak_bg.jpg" },
  { name: "Odissi", region: "Odisha", dance_type: "Classical", description: "Classical dance from Odisha known for its sculpturesque poses.", history: "Odissi is one of the oldest surviving dance forms from ancient India.", image_url: "odissi_bg.jpg" },
  { name: "Kuchipudi", region: "Andhra Pradesh", dance_type: "Classical", description: "Classical dance from Andhra Pradesh combining dance and drama.", history: "Kuchipudi originated in the village of Kuchipudi in Andhra Pradesh.", image_url: "kuchipudi_bg.jpg" },
  { name: "Manipuri", region: "Manipur", dance_type: "Classical", description: "Graceful classical dance from Manipur with gentle flowing movements.", history: "Manipuri dance is deeply rooted in the rituals and traditions of Manipur.", image_url: "manipuri_bg.jpg" },
  { name: "Mohiniyattam", region: "Kerala", dance_type: "Classical", description: "Classical dance from Kerala known for its graceful swaying movements.", history: "Mohiniyattam is associated with the dance of Mohini from Hindu mythology.", image_url: "mohiniyattam_bg.jpg" },
  { name: "Kathakali", region: "Kerala", dance_type: "Classical", description: "Classical dance drama from Kerala known for elaborate costumes and makeup.", history: "Kathakali originated in Kerala around the 17th century.", image_url: "kathakali_bg.jpg" },
  { name: "Sattriya", region: "Assam", dance_type: "Classical", description: "Classical dance from Assam introduced by Srimanta Sankardeva.", history: "Sattriya was traditionally performed in monasteries called Sattras.", image_url: "sattriya_bg.jpg" },
  { name: "Garba", region: "Gujarat", dance_type: "Folk", description: "Vibrant folk dance from Gujarat performed during Navratri festival.", history: "Garba is performed in honor of Goddess Durga.", image_url: "garba_bg.jpg" },
  { name: "Bhangra", region: "Punjab", dance_type: "Folk", description: "Energetic folk dance from Punjab performed during harvest season.", history: "Bhangra originated as a harvest celebration dance in Punjab.", image_url: "bhangra_bg.jpg" },
  { name: "Lavani", region: "Maharashtra", dance_type: "Folk", description: "Folk dance from Maharashtra known for rhythm and expressions.", history: "Lavani combines song and dance traditions.", image_url: "lavani_bg.jpg" },
  { name: "Bihu", region: "Assam", dance_type: "Folk", description: "Joyful folk dance from Assam performed during Bihu festival.", history: "Bihu celebrates Assamese New Year.", image_url: "bihu_bg.jpg" }
])

dances = Dance.all.index_by(&:name)

quizzes = [
  { dance: dances["Bharatanatyam"], question: "Where did Bharatanatyam originate?", option_a: "Kerala", option_b: "Tamil Nadu", option_c: "Odisha", option_d: "Andhra Pradesh", correct_answer: "B" },
  { dance: dances["Bharatanatyam"], question: "Who traditionally performed Bharatanatyam in temples?", option_a: "Monks", option_b: "Priests", option_c: "Devadasis", option_d: "Soldiers", correct_answer: "C" },
  { dance: dances["Bharatanatyam"], question: "Bharatanatyam is which type of dance?", option_a: "Folk", option_b: "Tribal", option_c: "Classical", option_d: "Modern", correct_answer: "C" },
  { dance: dances["Kathak"], question: "Kathak is a classical dance form from which region?", option_a: "South India", option_b: "North India", option_c: "East India", option_d: "West India", correct_answer: "B" },
  { dance: dances["Kathak"], question: "What is Kathak known for?", option_a: "Slow movements", option_b: "Fast spins", option_c: "Acrobatics", option_d: "Mime", correct_answer: "B" },
  { dance: dances["Kathak"], question: "Kathak evolved from which tradition?", option_a: "Warrior traditions", option_b: "Storytelling traditions", option_c: "Temple rituals", option_d: "Harvest festivals", correct_answer: "B" },
  { dance: dances["Odissi"], question: "Odissi is a classical dance from which state?", option_a: "Assam", option_b: "West Bengal", option_c: "Odisha", option_d: "Bihar", correct_answer: "C" },
  { dance: dances["Odissi"], question: "What is Odissi known for?", option_a: "Fast footwork", option_b: "Sculpturesque poses", option_c: "Acrobatics", option_d: "Aerial movements", correct_answer: "B" },
  { dance: dances["Odissi"], question: "Odissi is one of the oldest surviving dance forms from?", option_a: "Medieval India", option_b: "Modern India", option_c: "Ancient India", option_d: "Colonial India", correct_answer: "C" },
  { dance: dances["Kuchipudi"], question: "Kuchipudi originates from which state?", option_a: "Tamil Nadu", option_b: "Karnataka", option_c: "Kerala", option_d: "Andhra Pradesh", correct_answer: "D" },
  { dance: dances["Kuchipudi"], question: "Kuchipudi is named after?", option_a: "A river", option_b: "A village", option_c: "A king", option_d: "A goddess", correct_answer: "B" },
  { dance: dances["Kuchipudi"], question: "Kuchipudi combines which two art forms?", option_a: "Music and painting", option_b: "Dance and drama", option_c: "Poetry and dance", option_d: "Sculpture and dance", correct_answer: "B" },
  { dance: dances["Manipuri"], question: "Manipuri dance originates from which state?", option_a: "Meghalaya", option_b: "Nagaland", option_c: "Manipur", option_d: "Mizoram", correct_answer: "C" },
  { dance: dances["Manipuri"], question: "Manipuri is known for its?", option_a: "Vigorous movements", option_b: "Gentle flowing movements", option_c: "Acrobatic jumps", option_d: "Fast spins", correct_answer: "B" },
  { dance: dances["Mohiniyattam"], question: "Mohiniyattam is a classical dance from which state?", option_a: "Tamil Nadu", option_b: "Karnataka", option_c: "Andhra Pradesh", option_d: "Kerala", correct_answer: "D" },
  { dance: dances["Mohiniyattam"], question: "Mohiniyattam is associated with the dance of which mythological figure?", option_a: "Radha", option_b: "Mohini", option_c: "Parvati", option_d: "Saraswati", correct_answer: "B" },
  { dance: dances["Kathakali"], question: "Kathakali originated in which state?", option_a: "Tamil Nadu", option_b: "Andhra Pradesh", option_c: "Kerala", option_d: "Karnataka", correct_answer: "C" },
  { dance: dances["Kathakali"], question: "Kathakali is known for its?", option_a: "Simple costumes", option_b: "Elaborate costumes and makeup", option_c: "Minimal expressions", option_d: "Fast spins", correct_answer: "B" },
  { dance: dances["Sattriya"], question: "Sattriya dance is from which state?", option_a: "Manipur", option_b: "Assam", option_c: "Tripura", option_d: "Sikkim", correct_answer: "B" },
  { dance: dances["Sattriya"], question: "Who introduced Sattriya dance?", option_a: "Rabindranath Tagore", option_b: "Srimanta Sankardeva", option_c: "Tansen", option_d: "Balamurali Krishna", correct_answer: "B" },
  { dance: dances["Garba"], question: "Garba is a folk dance from which state?", option_a: "Rajasthan", option_b: "Maharashtra", option_c: "Gujarat", option_d: "Punjab", correct_answer: "C" },
  { dance: dances["Garba"], question: "Garba is performed during which festival?", option_a: "Diwali", option_b: "Navratri", option_c: "Holi", option_d: "Eid", correct_answer: "B" },
  { dance: dances["Bhangra"], question: "Bhangra is a folk dance from which state?", option_a: "Haryana", option_b: "Himachal Pradesh", option_c: "Punjab", option_d: "Rajasthan", correct_answer: "C" },
  { dance: dances["Bhangra"], question: "Bhangra was originally performed during which season?", option_a: "Winter", option_b: "Monsoon", option_c: "Spring", option_d: "Harvest", correct_answer: "D" },
  { dance: dances["Lavani"], question: "Lavani is a folk dance from which state?", option_a: "Gujarat", option_b: "Rajasthan", option_c: "Maharashtra", option_d: "Goa", correct_answer: "C" },
  { dance: dances["Bihu"], question: "Bihu is a folk dance from which state?", option_a: "West Bengal", option_b: "Assam", option_c: "Odisha", option_d: "Jharkhand", correct_answer: "B" },
  { dance: dances["Bihu"], question: "Bihu is performed during which occasion?", option_a: "Durga Puja", option_b: "Diwali", option_c: "Assamese New Year", option_d: "Harvest festival", correct_answer: "C" },
]

quizzes.each do |q|
  Quiz.create!(
    dance: q[:dance],
    question: q[:question],
    option_a: q[:option_a],
    option_b: q[:option_b],
    option_c: q[:option_c],
    option_d: q[:option_d],
    correct_answer: q[:correct_answer]
  )
end
