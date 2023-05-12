<%@include file="includes/header.jsp"%>

<%
    String action = request.getParameter("action");
    String name = request.getParameter("name");
    if (name == null) name = "";
    String surname = request.getParameter("surname");
    if (surname == null) surname = "";
    String telephone = request.getParameter("telephone");
    if (telephone == null) telephone = "";
%>

<main>
    <div class= "container">
        <br/>

        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="customer-index.jsp">Index</a></li>
            <li class="breadcrumb-item active" aria-current="page">Register customer</li>
          </ol>
        </nav>

        <form class="row g-3" method="post" action="edit-customer" enctype="multipart/form-data">
          <div class="row mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name">
          </div>
          <div class="row mb-3">
                <label for="surname" class="form-label">Surname</label>
                <input type="text" class="form-control" id="surname" name="surname">
          </div>
          <div class="row mb-3">
                <label for="telephone" class="form-label">Phone</label>
                <input type="text" class="form-control" id="telephone" name="telephone">
          </div>

          <input type="hidden" name="action" value="<%= action %>"/>
          <%
          if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id_customer"));
          %>
          <input type="hidden" name="id" value="<%= id %>"/>
          <%
          }
          %>
           <div class="col-12">
            <input type="submit" value="<%= action %>"/>
           </div>
        </form>
        <br/>
        <div id="result"></div>
    </div>
    </main>
<%@include file = "includes/footer.jsp"%>