module ApplicationHelper

	def format_acta_name(acta)
		"Acta #{acta.territorio.name} #{l(Date.parse(acta.date.to_s))}"
	end

end
