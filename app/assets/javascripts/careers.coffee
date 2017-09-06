$(document).on "turbolinks:load", ->
	$("#new_career").submit ->
		flag = true
		pattern = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i
		pattern_number = /^\d+$/
		if $("#career_name").val() is ""
			showPopup($("#career_name"),"This field is required")
			flag = false
		else if $("#career_email"). val() is ""
			showPopup($("#career_email"),"This field is required")
			flag = false
		else unless pattern.test($("#career_email").val())
			showPopup($("#career_email"),"Invalid email")
			flag = false
		else if $("#career_mobile").val() is ""
			showPopup($("#career_mobile"),"This field is required")
			flag = false
		else if !pattern_number.test($("#career_mobile").val())
			showPopup($("#career_mobile"),"Invalid mobile number")
			flag = false
		else if $("#career_phone").val() isnt "" and !pattern_number.test($("#career_phone").val())
			showPopup($("#career_phone"),"Inaveld phone number")
			flag = false
		else if $("#career_state").val() is ""
			showPopup($("#career_state"),"This field is required")
			flag = false
		else if $("#career_city").val() is ""
			showPopup($("#career_city"),"This field is required")
			flag = false
		else if $("#career_subject").val() is ""
			showPopup($("#career_subject"),"This field is required")
			flag = false
		else if $("#career_message").val() is ""
			showPopup($("#career_message"),"This field is required")
			flag = false
		flag


	showPopup = (elm, msg) ->
		elm.parent('div').find('label').css('color','#ef5a13')
		elm.css('border','1px solid #ef5a13').attr('placeholder',msg)


	$("#new_career input[type='text'], #new_career input[type='email'], #new_career textarea, #new_career select").focus ->
		text = $(this).parent('div').find('label').text()
		$(this).css('border','1px solid #ccc').attr('placeholder',text.slice(0,-1))
		$(this).parent('div').find('label').css('color','#000')