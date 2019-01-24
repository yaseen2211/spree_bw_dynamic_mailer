class Spree::Email::EmailDynamic

	EXCLUDED_COLUMNS = ["id", "created_at", "updated_at"]

	def self.token_wrt_obj(obj_names)
  	token_arry = []
  	obj_names.each do |obj|
	  	(obj.class.name.constantize.column_names - EXCLUDED_COLUMNS).each do |cn|
	  		token_arry.push(obj.class.name.split('::').last.downcase + "-"+ cn)
	  	end
	  end
  	return token_arry
	end

	def self.make_dynamic(email_objects, slug)
  	template_obj = EmailContent.by_slug(slug).last
  	
    @body = template_obj.body
	  email_objects.each do |e_obj|

  		(e_obj.class.name.constantize.column_names - EXCLUDED_COLUMNS).each do |el|
  			next if e_obj.public_send(el).blank?
   			@body.gsub!(e_obj.class.name.split("::").last.downcase + "-" + el, e_obj.public_send(el)) 
   		end
	  end
	  return @body
	end
end
