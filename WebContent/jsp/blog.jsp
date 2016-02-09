<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp" />
       <div class="col-lg-8">
			<div class="row" id="newpost">
				<div class="col-lg-2"></div>
				<form role="form">
					<div class="form-group col-lg-10">
						 <textarea id="newpost" placeholder="Ask something about Ayurveda?" cols="100" rows="4"></textarea>
					</div>
					<div class="col-lg-10 pull-right">
						<button type="submit" class="btn btn-primary"  id="addPost">Post</button>
					</div>
				</form>
			</div>
			<div class="col-lg-offset-2" id="postText">
				
			</div>
		</div>
   	 <script type="text/javascript">
   	$(function() {
   		
   		var post1 = displayPost("Jim Garry","2015-12-25","I have a Gastric Problem since Last 15 Years. I have been using English Medicine since 10 years. Can i use Ayurveda for my cure ?")+
   		displayComment("Ayuracharya - Admin","2015-12-26","We will advise you to consult any Certified Doctor( Vaidyas) to find the exact medicine and cure, Since your Prolem is older. you can Check the list of Doctors in our website. Jai Guru Dev")+
   		displayComment("Phillip","2015-12-27","I had similar Kind of Problem a couple of years back. I studied in some Ayurvedic Books and took Trifala and i got the benefit.")+
   		displayComment("Venu Das","2015-12-28","I Think you should go and visit Some Ayurvedic Doctor. or Try Some HAT YOGA..")+
   	   
   		displayComment1("","","");
   		$(post1).appendTo('#postText');
   		//displayPost("Rohan","2015-12-05","What is Ayur Dohsa");
   		$('#addPost').on("click", function addPost(evt) {
   			evt.preventDefault();
   	        var post = $("#newpost").val();
   	        var post1 = displayPost("Robert","2015-12-28","How to find my Bod type using Ayurveda 'Vaata-Pita- Kaffa'")+
   	   		displayComment1("","","");
   	        $(post1).prependTo('#postText');
   	       
   	    });
   	});
	  	

   	function displayPost(username,createdate,posttext){
   		
   		var ele = "<div class='row oldpost'><div class='col-lg-10'>Post <strong>"+createdate+"</strong></div>"
   		+"<div class='col-lg-2'><strong>"+username+"</strong></div>"+ 		
 		"<div class='col-lg-12'><textarea cols='120' disabled>"+posttext+"</textarea></div></div>";
   		return ele;

   	}
	function displayComment(username,createdate,comment){
   		
   		var ele = "<div class='row oldpost'><div class='col-lg-10'><strong>"+username+"</strong></div>"+
 		"<div class='col-lg-2'><strong>"+createdate+"</strong></div>"+
 		"<div class='col-lg-12'><textarea cols='120' disabled>"+comment+"</textarea></div></div>";
   		return ele;

   	}
function displayComment1(username,createdate,comment){
   		
   		var ele = "<div class='row oldpost'><div class='col-lg-10'><strong>"+username+"</strong></div>"+
 		"<div class='col-lg-2'><strong>"+createdate+"</strong></div>"+
 		"<div class='col-lg-12'><textarea cols='120'>"+comment+"</textarea></div></div>";
   		return ele;

   	}


   
   	 </script>
   
    
</body>
</html>
