<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.entities.Post" %>
<%@page import="java.util.*" %>

<div class="row">
<% 
Thread.sleep(1000);
PostDao dao = new PostDao(ConnectionProvider.getConnection());
int cid = Integer.parseInt(request.getParameter("cid"));
List<Post> posts =null;
if(cid==0){
	posts = dao.getAllPosts();
}else{
	posts=dao.getPostByCatId(cid);
}
if(posts.size()==0){
	out.println("<h3 class='display-3 text-center'>No Posts in this Category..</h3>");
	return;
}
for(Post p : posts){
%>
<div class="col-md-6 mt-2">
<div class="card">
<img alt="Card image cap" class="card-img-top" src="blog_pics/<%= p.getpPic()%>">
<div class="card-body">
<b><%= p.getpTitle() %></b>
<p><%= p.getpContent() %></p>
</div>
<div class="card-footer text-center primary-background">
<a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-up"></i>10</a>
<a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>
<a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i>20</a>
</div>
</div>
</div>

<%
}

%>
</div>