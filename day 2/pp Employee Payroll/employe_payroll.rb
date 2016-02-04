class Employee 

	attr_reader :name, :email
	def initialize (name,email)
		@name = name
		@email = email
	end
end

class HourlyEmployee < Employee
		def initialize (name, email, hourlyRate, hoursWorked)
			super(name,email)
			@hourlyRate = hourlyRate
			@hoursWorked = hoursWorked
		end

		def calcSalar
			puts @hourlyRate * @hoursWorked
		end
end

class SalaryEmployee < Employee 
	def initialize (name, email, anualSalari)
		super(name,email)
		@anualSalari = anualSalari
	end
	def calcSalar
			puts @anualSalari / 52 
	end
end

class MultyPayment < HourlyEmployee
	def initialize (name, email, anualSalari, hourlyRate, hoursWorked)
		super(name, email, hourlyRate, hoursWorked)
		@anualSalari = anualSalari
	end
	def calcSalar
		if @hoursWorked < 40
			puts	@anualSalari/ 52
		else
			puts @anualSalari/52 + (@hoursWorked-40)*@hourlyRate
		end

	end
end


class Payroll
	def initialize(employees)
			@employees = employees
	end
	def payEmployees
			valor = 0
			@employees.each do |employee|
			valor += employee.calcSar
			end
			puts valor

	end		
end



bob = MultyPayment.new("Ted", "wertyui", 60000, 200, 50)
ashley = SalaryEmployee.new("ashley", "dfghjklñ", 50000)
employees = []
employees << bob
employees << ashley
puts employees

pay = Payroll.new(employees)
pay.payEmployees


puts "¿quieres inscribir a un nuevo trabajador?"
