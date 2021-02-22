
records =[{id: 1, first_name: "albert", last_name: "einstein", email: "ae@relativity.com"},
{id: 2, first_name: "marie", last_name: "curie", email: "mc@radiation.com"},
{id: 3, first_name: "issac", last_name: "newton", email: "in@gravity.com"},
{id: 4, first_name: "galileo", last_name: "galilei", email: "gg@astronomy.com"}
]

records.each do |record|
  User.create(id: record[:id], first_name: record[:first_name], last_name: record[:last_name], email: record[:email])
end