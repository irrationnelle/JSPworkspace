<script>
	$(function() {
		//twitter bootstrap script
		$("#submitUpdate").click(function() {
			var dataVar = "writer="+$('#writerUpdate').val();
			dataVar += "&password="+$('#passwordUpdate').val();
			dataVar += "&title="+$('#titleUpdate').val();
			dataVar += "&content="+$('#contentUpdate').val();
			dataVar += "&articleId="+${requestScope.article.articleId};
			$.ajax({
				type : "POST",
				url : "board.do?action=update",
				data : dataVar,
				success : function(data){
					location.href="board.do?action=board#board";
				},
				error : function(data){
					alert("update fail!");
				}
			});
		});
	});
</script>

<!-- Modal Update -->
<div class="modal fade modal-ext" id="modal-update" tabindex="-1"
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
					<i class="fa fa-user prefix"></i> <input type="text" id="writerUpdate"
						class="form-control" value="${requestScope.article.writer}"> <label for="writer"></label>
				</div>

				<div class="md-form">
					<i class="fa fa-lock prefix"></i> <input type="password"
						id="passwordUpdate" class="form-control"> <label for="password">Your
						password</label>
				</div>

				<div class="md-form">
					<i class="fa fa-tag prefix"></i> <input type="text" id="titleUpdate"
						class="form-control" value="${requestScope.article.title}"> <label for="title"></label>
				</div>

				<div class="md-form">
					<i class="fa fa-pencil prefix"></i>
					<textarea type="text" id="contentUpdate" class="md-textarea">${requestScope.article.content}</textarea>
					<label for="content"></label>
				</div>

				<div class="text-xs-center">
					<button id="submitUpdate" class="btn btn-primary" data-dismiss="modal">Submit</button>
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