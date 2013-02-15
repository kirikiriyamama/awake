var showed, recieved;
recieved = false;
$(function(){
	$("#awake-btn").click(awake);
});
function awake(){
	$("#awake-btn").attr('disabled', true);
	bird();
	$.post("/",{message:"awake"},function(){
		var time;
		recieved = true;
		if(showed){
			time = new Date();
			if(showed + 2000 < time){
				hide();
			} else {
				setTimeout(hide, showed+2000-time);
			}
		}
	});
}
function bird(){
	$("#bird").fadeIn();
	setTimeout(function(){
		$("#message").show("fast");
		showed = new Date();
		if(recieved){
			setTimeout(hide, 2000);
		}
	}, 1000);
}
function hide(){
	$("#bird").fadeOut();
	$("#message").fadeOut();
	$("#awake-btn").removeAttr("disabled");
	delete showed;
	recieved = false;
}
