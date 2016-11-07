<script>
	$(function() {
		//twitter bootstrap script
		$("#submitSignup").click(function() {
			var dataVar = "id="+$('#idSignup').val();
			if($('#passwordSignup').val() == $('#verifySignup').val()) {
				dataVar += "&password="+$('#passwordSignup').val();
			} else {
				return false;
			}
			dataVar += "&name="+$('#nameSignup').val();
			dataVar += "&email="+$('#emailSignup').val();
			$.ajax({
				type : "POST",
				url : "member.do?action=signup",
				data : dataVar,
				success : function(data){
					alert("Sign up Success!");
					location.href="board.do?action=main";
				},
				error : function(data){
					alert("update fail!");
				}
			});
		});
	});
</script>

<!-- Modal SignUp -->
	<div class="modal fade modal-ext" id="modal-signup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <!--Content-->
	        <div class="modal-content">
	            <!--Header-->
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	                <h3><i class="fa fa-user"></i> Register with:</h3>
	            </div>
	            <!--Body-->
	            <div class="modal-body">
	                <div class="md-form">
	                    <i class="fa fa-pencil prefix"></i>
	                    <input type="text" id="idSignup" class="form-control">
	                    <label for="id">Your ID</label>
	                </div>
	
	                <div class="md-form">
	                    <i class="fa fa-lock prefix"></i>
	                    <input type="password" id="passwordSignup" class="form-control">
	                    <label for="password">Your password</label>
	                </div>
	
	                <div class="md-form">
	                    <i class="fa fa-lock prefix"></i>
	                    <input type="password" id="verifySignup" class="form-control">
	                    <label for="verify">Repeat password</label>
	                </div>
	                
	                <div class="md-form">
	                    <i class="fa fa-user prefix"></i>
	                    <input type="text" id="nameSignup" class="form-control">
	                    <label for="name">Your name</label>
	                </div>
	                
	                <div class="md-form">
	                    <i class="fa fa-envelope prefix"></i>
	                    <input type="email" id="emailSignup" class="form-control">
	                    <label for="email">Your e-mail address</label>
	                </div>
	
	                <div class="text-xs-center">
	                    <button type="submit" class="btn btn-primary btn-lg" id="submitSignup">Sign up</button>
	                </div>
	            </div>
	            <!--Footer-->
	            <div class="modal-footer">
	                <div class="options">
	                    <p>Already have an account? <a href="#" data-dismiss="modal">Log in</a></p>
	                </div>
	                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	            </div>
	        </div>
	        <!--/.Content-->
	    </div>
	</div>
<!-- /.Modal SignUp -->