
User.destroy_all
User.create!(
  name: "Admin",
  email: "admin@natrang.com",
  password: "password123"
)
Dance.destroy_all

Dance.create!([
  {
    name: "Bharatanatyam",
    region: "Tamil Nadu",
    dance_type: "Classical",
    description: "One of the oldest classical dance forms of India originating from Tamil Nadu.",
    history: "Bharatanatyam originated in the temples of Tamil Nadu and was performed by Devadasis.",
    image_url: "dancebb_bg.jpg"
  },
  {
    name: "Kathak",
    region: "Uttar Pradesh",
    dance_type: "Classical",
    description: "A major classical dance form from North India known for its fast spins.",
    history: "Kathak evolved from storytelling traditions in North India.",
    image_url: "kathak_bg.jpg"
  },
  {
    name: "Odissi",
    region: "Odisha",
    dance_type: "Classical",
    description: "Classical dance from Odisha known for its sculpturesque poses.",
    history: "Odissi is one of the oldest surviving dance forms from ancient India.",
    image_url: "odissi_bg.jpg"
  },
  {
    name: "Kuchipudi",
    region: "Andhra Pradesh",
    dance_type: "Classical",
    description: "Classical dance from Andhra Pradesh combining dance and drama.",
    history: "Kuchipudi originated in the village of Kuchipudi in Andhra Pradesh.",
    image_url: "kuchipudi_bg.jpg"
  },
  {
    name: "Manipuri",
    region: "Manipur",
    dance_type: "Classical",
    description: "Graceful classical dance from Manipur with gentle flowing movements.",
    history: "Manipuri dance is deeply rooted in the rituals and traditions of Manipur.",
    image_url: "manipuri_bg.jpg"
  },
  {
    name: "Mohiniyattam",
    region: "Kerala",
    dance_type: "Classical",
    description: "Classical dance from Kerala known for its graceful swaying movements.",
    history: "Mohiniyattam is associated with the dance of Mohini from Hindu mythology.",
    image_url: "mohiniyattam_bg.jpg"
  },
  {
    name: "Kathakali",
    region: "Kerala",
    dance_type: "Classical",
    description: "Classical dance drama from Kerala known for elaborate costumes and makeup.",
    history: "Kathakali originated in Kerala around the 17th century.",
    image_url: "kathakali_bg.jpg"
  },
  {
    name: "Sattriya",
    region: "Assam",
    dance_type: "Classical",
    description: "Classical dance from Assam introduced by Srimanta Sankardeva.",
    history: "Sattriya was traditionally performed in monasteries called Sattras.",
    image_url: "sattriya_bg.jpg"
  },
  {
    name: "Garba",
    region: "Gujarat",
    dance_type: "Folk",
    description: "Vibrant folk dance from Gujarat performed during Navratri festival.",
    history: "Garba is performed in honor of Goddess Durga.",
    image_url: "garba_bg.jpg"
  },
  {
    name: "Bhangra",
    region: "Punjab",
    dance_type: "Folk",
    description: "Energetic folk dance from Punjab performed during harvest season.",
    history: "Bhangra originated as a harvest celebration dance in Punjab.",
    image_url: "bhangra_bg.jpg"
  },
  {
    name: "Lavani",
    region: "Maharashtra",
    dance_type: "Folk",
    description: "Folk dance from Maharashtra known for rhythm and expressions.",
    history: "Lavani combines song and dance traditions.",
    image_url: "lavani_bg.jpg"
  },
  {
    name: "Bihu",
    region: "Assam",
    dance_type: "Folk",
    description: "Joyful folk dance from Assam performed during Bihu festival.",
    history: "Bihu celebrates Assamese New Year.",
    image_url: "bihu_bg.jpg"
  }
])
