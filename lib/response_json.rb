module ResponseJson

  def build_response_view code,entity,resultjson
    respond_to do |format|
      format.json { render :json => msg_json(code,entity).merge(resultjson) }         
    end 
  end

	def msg_json msg_code,entity
    case msg_code
    when "success"
      result = {code: 200, message: "Success"}
    when "custom_ok"
      result = {code: 200, message: entity}
    when "custom"
      result = {code: 422, message: entity}
    when "created"
      result = {code: 201, message: "#{entity} created successfully" }
    when "accepted"
    	result = {code: 202, message: "#{entity} accepted successfully" }
    when "updated"
      result = {code: 205, message: "#{entity} updated successfully"}
    when "bad"
      result = {code: 400, message: "Bad Request"}      
    when "unauthorized"
      result = {code: 401, message: "Unauthorized access"}      
    when "suspend"
      result = {code: 403, message: "#{entity} suspend"}
    when "not"
      result = {code: 404, message: "#{entity} does not exists"}      
    when "missing"
      result = {code: 422, message: "Bad Request, #{entity} must be present."}
    when "blank"
      result = {code: 422, message: "#{entity} can't blank"}
    when "already"
      result = {code: 422, message: "#{entity} already exists"}
    when "already_paid"
      result = {code: 432, message: "Subscription already paid"}
    when "session_expired"
      result = {code: 345, message: entity}
    when "guest_expired"
      result = {code: 123, message: entity}
    when "custom_code"
      result = {code: entity.to_s.split(':').first.to_i, message: entity.to_s.split(':').last}
    else
      result = {code: 420, message: "Unknown Request"}
    end
    result
  end
end
