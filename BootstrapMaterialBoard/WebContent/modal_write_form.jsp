<script>
	$(function() {
		//twitter bootstrap script
		$("#submit").click(function() {
			var dataVar = "&title="+$('#title').val();
			dataVar += "&content="+$('#content').val();
			$.ajax({
				type : "POST",
				url : "board.do?action=write",
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
<!-- Modal Write -->
<div class="modal fade modal-ext" id="modal-write" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<!--Content-->
		<div class="modal-content">
			<!--Header-->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>

				</button>
				<h4 class="modal-title" id="myModalLabel">Write</h4>
			</div>
			<!--Body-->
			<div class="modal-body">
				<div class="md-form">
					<i class="fa fa-tag prefix"></i> <input type="text" id="title"
						class="form-control"> <label for="title">Subject</label>
				</div>

				<div class="md-form">
					<i class="fa fa-pencil prefix"></i>
					<textarea type="text" id="content" class="md-textarea"></textarea>
					<label for="content">Content</label>
				</div>

				<div class="text-xs-center">
					<button id="submit" class="btn btn-primary" data-dismiss="modal">Submit</button>
				</div>
			</div>
			<!--Footer-->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
		<!--/.Content-->
	</div>
</div>


