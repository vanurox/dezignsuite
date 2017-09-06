$(document).on 'turbolinks:load', ->
	$("#new_contact").submit ->
		flag = true
		pattern = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i
		if $("#contact_name").val() is ""
			showPopup($("#contact_name"),'This field is required')
			flag = false
		else if $("#contact_email").val() is ""
			showPopup($("#contact_email"),'This field is required')
			flag = false
		else unless pattern.test($("#contact_email").val())
			showPopup($("#contact_email"), "Invalid email")
			flag = false
		else if $("#contact_message").val() is ""
			showPopup($("#contact_message"),'This field is required')
			flag = false
		flag


	showPopup = (elm, msg) ->
		elm.parent('div').find('label').css('color','#ef5a13')
		elm.css('border','1px solid #ef5a13').attr('placeholder',msg)


	$("#new_contact input[type='text'], #new_contact input[type='email'], #new_contact textarea").focus ->
		text = $(this).parent('div').find('label').text()
		$(this).css('border','1px solid #ccc').attr('placeholder',text.slice(0,-1))
		$(this).parent('div').find('label').css('color','#000')