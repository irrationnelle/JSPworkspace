<!--Navbar-->
    <nav class="navbar navbar-dark navbar-fixed-top scrolling-navbar">

        <!-- Collapse button-->
        <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#collapseEx">
            <i class="fa fa-bars"></i>
        </button>

        <div class="container">

            <!--Collapse content-->
            <div class="collapse navbar-toggleable-xs" id="collapseEx">
                <!--Navbar Brand-->
                <a class="navbar-brand" href="http://mdbootstrap.com/material-design-for-bootstrap/" target="_blank">irrationnelle</a>
                <!--Links-->
                <ul class="nav navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#about" data-toggle="modal" data-target="#modal-register" data-backdrop="false">Sign Up</a>
                    </li>
					
					<jsp:include page="modal_signup.jsp"></jsp:include>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="#best-features" data-toggle="modal" data-target="#modal-write" data-backdrop="false">Write</a>
                    </li>
                    
                    <jsp:include page="modal_write_form.jsp"></jsp:include>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="start_board.jsp">Board</a>
                    </li>
                </ul>
                
            </div>
            <!--/.Collapse content-->

        </div>

    </nav>
    <!--/.Navbar-->