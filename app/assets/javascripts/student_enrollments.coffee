$(document).on 'turbolinks:load', ->
	$("#new_student_enrollment").submit ->
		flag = true
		pattern = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i
		pattern_number = /^\d+$/
		if $("#student_enrollment_name").val() is ""
			showPopup($("#student_enrollment_name"),"This field is required")
			flag = false
		else if $("#student_enrollment_email").val() is ""
			showPopup($("#student_enrollment_email"),"This field is required")
			flag = false
		else unless pattern.test($("#student_enrollment_email").val())
			showPopup($("#student_enrollment_email"),"Invalid email")
			flag = false
		else if $("#student_enrollment_mobile").val() is ""
			showPopup($("#student_enrollment_mobile"),"This field is required")
			flag = false
		else if !pattern_number.test($("#student_enrollment_mobile").val())
			showPopup($("#student_enrollment_mobile"),"Invalid mobile number")
			flag = false
		else if $("#student_enrollment_year").val() is ""
			showPopup($("#student_enrollment_year"),"This filed is required")
			flag = false
		else if $("#student_enrollment_course").val() is ""
			showPopup($("#student_enrollment_course"),"This field is required")
			flag = false
		else if $("#student_enrollment_state").val() is ""
			showPopup($("#student_enrollment_state"),"This field is required")
			flag = false
		else if $("#student_enrollment_postal_code").val() is ""
			showPopup($("#student_enrollment_postal_code"),"This field is required")
			flag = false
		else if $("#student_enrollment_preferred_center").val() is ""
			showPopup($("#student_enrollment_preferred_center"),"This field is required")
			flag = false
		else if $("#student_enrollment_college").val() is ""
			showPopup($("#student_enrollment_college"),"This field is required")
			flag = false
		else if $("#student_enrollment_amount").val() is ""
			showPopup($("#student_enrollment_amount"),"This field is required")
			flag = false
		else if !pattern_number.test($("#student_enrollment_amount").val())
			showPopup($("#student_enrollment_amount"),"Invalid amount")
			flag = false
		flag


	showPopup = (elm, msg) ->
		elm.parent('div').find('label').css('color','#ef5a13')
		elm.css('border','1px solid #ef5a13').attr('placeholder',msg)


	$("#new_student_enrollment input[type='text'], #new_student_enrollment input[type='email'], #new_student_enrollment textarea, #new_student_enrollment select").focus ->
		text = $(this).parent('div').find('label').text()
		$(this).css('border','1px solid #ccc').attr('placeholder',text.slice(0,-1))
		$(this).parent('div').find('label').css('color','#000')
