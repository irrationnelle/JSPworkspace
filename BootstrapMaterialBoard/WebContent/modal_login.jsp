<script>
	$(function() {
		//twitter bootstrap script
		$("#submit").click(function() {
			var dataVar = "writer="+$('#writer').val();
			dataVar += "&password="+$('#password').val();
			dataVar += "&title="+$('#title').val();
			dataVar += "&content="+$('#content').val();
			$.ajax({
				type : "POST",
				url : "write.jsp",
				data : dataVar,
				success : function(data){
					location.href="board.do?action=refresh#board";
				},
				error : function(data){
					alert("update fail!");
				}
			});
		});
	});
</script>
                                
<!-- Modal Login -->
<div class="modal fade modal-ext" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <!--Content-->
        <div class="modal-content">
           
            <!--Header-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h3><i class="fa fa-user"></i> Login</h3>
            </div>
            
            <!--Body-->
            <div class="modal-body">
                <div class="md-form">
                    <i class="fa fa-pencil prefix"></i>
                    <input type="text" id="form2" class="form-control">
                    <label for="form2">Your ID</label>
                </div>

                <div class="md-form">
                    <i class="fa fa-lock prefix"></i>
                    <input type="password" id="form3" class="form-control">
                    <label for="form3">Your password</label>
                </div>
                <div class="text-xs-center">
                    <button class="btn btn-primary btn-lg">Login</button>
                </div>
            </div>
            
            <!--Footer-->
            <div class="modal-footer">
                <div class="options">
                    <p>Not a member? <a href="#">Sign Up</a></p>
                    <p>Forgot <a href="#">Password?</a></p>
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>