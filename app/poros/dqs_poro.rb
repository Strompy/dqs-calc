class DqsPoro
  attr_reader :tables

  def initialize
    @tables = {
      'Fruits' => [1, 1, 1, 1, 1, 1, 0.5, 0.5, 0, 0, 0, 0],
      'Vegetables' => [1, 1, 1, 1, 1, 1, 0.5, 0.5, 0, 0, 0, 0],
      'Lean Meats & Fish' => [1, 1, 1, 1, 0.5, 0.5, 0, 0, 0, 0, -0.5, -0.5],
      'Nuts & Seeds' => [1, 1, 1, 1, 0.5, 0.5, 0, 0, 0, 0, -0.5, -0.5],
      'Whole Grains' => [1, 1, 1, 1, 0.5, 0.5, 0, 0, 0, 0, -0.5, -0.5],
      'Dairy' => [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0, 0, -0.5, -0.5, -1, -1],
      'Refined Grains' => [-0.5, -0.5, -0.5, -0.5, -1, -1, -1, -1, -1, -1, -1, -1],
      'Fatty Proteins' => [-0.5, -0.5, -0.5, -0.5, -1, -1, -1, -1, -1, -1, -1, -1],
      'Sweets' => [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],
      'Fried Foods' => [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
    }
  end

  def calculate(entries)
    score = 0
    entries.each do |category, quantity|
      i = 0
      half_servings = (quantity*2).to_i
      half_servings.times do
        score += tables[category][i]
        i += 1
      end
    end
    score
  end

end
