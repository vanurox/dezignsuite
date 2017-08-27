$(document).on "turbolinks:load", ->
	$("#new_workshop").submit ->
		flag = true
		pattern = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i
		pattern_number = /^\d+$/
		if $("#workshop_name").val() is ""
			showPopup($("#workshop_name"),"This field is required")
			flag = false
		else if $("#workshop_email"). val() is ""
			showPopup($("#workshop_email"),"This field is required")
			flag = false
		else unless pattern.test($("#workshop_email").val())
			showPopup($("#workshop_email"),"Invalid email")
			flag = false
		else if $("#workshop_mobile").val() is ""
			showPopup($("#workshop_mobile"),"This field is required")
			flag = false
		else if !pattern_number.test($("#workshop_mobile").val())
			showPopup($("#workshop_mobile"),"Invalid mobile")
			flag = false
		else if $("#workshop_state").val() is ""
			showPopup($("#workshop_state"),"This field is required")
			flag = false
		else if $("#workshop_city").val() is ""
			showPopup($("#workshop_city"),"This field is required")
			flag = false
		else if $("#workshop_subject").val() is ""
			showPopup($("#workshop_subject"),"This field is required")
			flag = false
		else if $("#workshop_message").val() is ""
			showPopup($("#workshop_message"),"This field is required")
			flag = false
		flag


	showPopup = (elm, msg) ->
		elm.parent('div').find('label').css('color','#ef5a13')
		elm.css('border','1px solid #ef5a13').attr('placeholder',msg)


	$("#new_workshop input[type='text'], #new_workshop input[type='email'], #new_workshop textarea, #new_workshop select").focus ->
		text = $(this).parent('div').find('label').text()
		$(this).css('border','1px solid #ccc').attr('placeholder',text.slice(0,-1))
		$(this).parent('div').find('label').css('color','#000')