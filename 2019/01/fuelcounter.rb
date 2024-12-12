class FuelCounter
  def self.fuel_equation(mass)
    (mass / 3).floor - 2
  end

  def self.calculate(mass)
    fuel_required = current_fuel = fuel_equation(mass)
    while true
      fuel = fuel_equation(current_fuel)

      if fuel <= 0
        break
      else
        fuel_required += fuel
        current_fuel = fuel
      end
    end

    fuel_required
  end

  def self.calculate_fuel_for_input
    input_masses = [
      'oops-a-plaintext-secret'
    ]

    total_fuel = 0
    input_masses.map { |mass| total_fuel += calculate(mass) }
    total_fuel
  end
end