<%@ page import="java.sql.*, javax.sql.*, java.util.ArrayList, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.model.Booking" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Meta tags for character set and viewport -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reviews&Ratings</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Custom CSS (if any) -->
    <!--<link rel="stylesheet" href="css/non.css">-->
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>

    <%

    // Retrieve the email attributes
    String tutorEmail  = (String) request.getAttribute("tutorEmail");

    %>

    <!-- Modal Structure -->
    <div id="bookingModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="bookingModalLabel">Review</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form  action="/add-review-ratings" method="post" class="p-4 border rounded" id="myForm">
                        <h1 class="mb-4"></h1>
                        <div class="mb-3">
                            <label for="name">Full Names</label>
                            <input type="text" id="name" name="name" class="form-control" placeholder="Sihle Sithole"  required>
                           
                        </div>

                        <div class="mb-3">
                            <label for="message">Message</label>
                            <input type="text" id="message" name="message" placeholder="The best tutor ever"  class="form-control" required>
                        
                        </div>
                        <div class="mb-3">
                            <label for="ratings">Ratings</label>
                            <input type="number" id="ratings" name="ratings" class="form-control"
                                placeholder="1 to 5" min="1" max="5" required>
                            
                        </div>

                        <input type="hidden" id="tutorEmail" name="tutorEmail" value=" <%= tutorEmail %> " class="form-control"
                                placeholder="5" required>

                        <div class="mb-3">
                            <button class="btn btn-success" type="submit">Submit</button>
                        </div>
  
                    </form>
            </div>
        </div>
    </div>



    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- JavaScript to show the modal automatically -->
    <script>
        $(document).ready(function() {
            // Show the modal when the page is ready
            $('#bookingModal').modal('show');
        });

        /*document.getElementById('myForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent the form from submitting normally
            window.location.href = '/'; // Redirect to the root URL
        });*/

    </script>

</body>
</html>
