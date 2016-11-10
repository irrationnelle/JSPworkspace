<script>
	$(function() {
		//twitter bootstrap script
		$("#submitReply").click(function() {
			var dataVar = "&title="+$('#titleReply').val();
			dataVar += "&content="+$('#contentReply').val();
			dataVar += "&replyLevel="+$('#replyLevel').val();
			$.ajax({
				type : "POST",
				url : "board.do?action=reply",
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
<div class="modal fade modal-ext" id="modal-reply" tabindex="-1"
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
				<h4 class="modal-title" id="myModalLabel">Reply</h4>
			</div>
			<!--Body-->
			<div class="modal-body">
				<div class="md-form">
					<i class="fa fa-tag prefix"></i> <input type="text" id="titleReply"
						class="form-control"> <label for="title">Subject</label>
						<input type="hidden" id="replyLevel" value="${requestScope.article.replyLevel}">
				</div>

				<div class="md-form">
					<i class="fa fa-pencil prefix"></i>
					<textarea type="text" id="contentReply" class="md-textarea"></textarea>
					<label for="content">Content</label>
				</div>

				<div class="text-xs-center">
					<button id="submitReply" class="btn btn-primary" data-dismiss="modal">Submit</button>
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


