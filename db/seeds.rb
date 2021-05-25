include Sprig::Helpers

if !User.where(email: "admin@example.com").first
  admin = User.create!({email: "admin@example.com", password: "123123"})
  admin.add_role(:admin)
end

unless Stage.exists?
  Stage.create!({name: 'Foundation', description: 'Lorem Ipsum Dolor Sit Amet Conse', order: 1})
  Stage.create!({name: 'Framing', description: 'Lorem Ipsum Dolor Sit Amet Conse', order: 2})
  Stage.create!({name: 'Roofing', description: 'Lorem Ipsum Dolor Sit Amet Conse', order: 3})
  Stage.create!({name: 'Windows & Doors', description: 'Lorem Ipsum Dolor Sit Amet Conse', order: 4})
  Stage.create!({name: 'Exterior', description: 'Lorem Ipsum Dolor Sit Amet Conse', order: 5})
  Stage.create!({name: 'Stage with a longer name', description: 'Lorem Ipsum Dolor Sit Amet Conse', order: 6})
end

unless FloorPlan.exists?
  FloorPlan.create!({name: 'First Floor', description: 'Lorem Ipsum Dolor Sit Amet Conse'})
  FloorPlan.create!({name: 'Second Floor', description: 'Lorem Ipsum Dolor Sit Amet Conse'})
  FloorPlan.create!({name: 'Basement', description: 'Lorem Ipsum Dolor Sit Amet Conse'})
end

unless Elevation.exists?
  Elevation.create!({name: 'Front', description: 'Lorem Ipsum Dolor Sit Amet Conse'})
  Elevation.create!({name: 'Rear', description: 'Lorem Ipsum Dolor Sit Amet Conse'})
  Elevation.create!({name: 'Side', description: 'Lorem Ipsum Dolor Sit Amet Conse'})
end

unless Category.exists?
  Category.create!({name: 'Living Room', description: 'Lorem Ipsum Dolor Sit Amet Conse' })
  Category.create!({name: 'Dining Room', description: 'Lorem Ipsum Dolor Sit Amet Conse' })
  Category.create!({name: 'Kitchen', description: 'Lorem Ipsum Dolor Sit Amet Conse' })
end

unless ImageCategory.exists?
  ImageCategory.create!({name: 'Living Room', description: 'Lorem Ipsum Dolor Sit Amet Conse' })
  ImageCategory.create!({name: 'Dining Room', description: 'Lorem Ipsum Dolor Sit Amet Conse' })
  ImageCategory.create!({name: 'Kitchen', description: 'Lorem Ipsum Dolor Sit Amet Conse' })
end

unless Amenity.exists?
  Amenity.create!({name: 'School'})
  Amenity.create!({name: 'Park'})
  Amenity.create!({name: 'Shopping Mall'})
end
