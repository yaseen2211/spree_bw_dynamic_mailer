class Spree::Email::EmailDynamic

	EXCLUDED_COLUMNS = ["id", "created_at", "updated_at"]

	def self.token_wrt_obj(obj_names)
  	token_arry = []
  	obj_names.each do |obj|
	  	(obj.constantize.column_names - EXCLUDED_COLUMNS).each do |cn|
	  		token_arry.push("{:" + obj.split('::').last.downcase + "_"+ cn + "}")
	  	end
	  end
  	return token_arry
	end

	def self.finder(reason,module_name)
		template_obj = Spree::EmailContent.finder(reason,module_name).last
	end

	def self.make_dynamic(email_objects,body)
  	
    @template = body
	  email_objects.each do |e_obj|

  		(e_obj.class.name.constantize.column_names - EXCLUDED_COLUMNS).each do |el|
  			next if e_obj.public_send(el).blank?
   			@template.gsub!( "{:"+ e_obj.class.name.split("::").last.downcase + "_" + el.to_s + "}", e_obj.public_send(el).to_s) 
   		end
	  end
	  return @template

	end

	def self.detailed_dynamic(partial_hash, body, dir_path)
		partial_hash.each do |par_name, obj_hash|
	  	body.gsub!( "{:"+par_name+"}", (ApplicationController.new.render_to_string(partial: dir_path + par_name , locals: obj_hash)))
	  end
	  return body
	end

end