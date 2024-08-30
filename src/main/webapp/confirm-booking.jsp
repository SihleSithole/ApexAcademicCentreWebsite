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
    <title>Booking Details</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Custom CSS (if any) -->
    <link rel="stylesheet" href="css/non.css">
</head>
<body>

    <%
    // Retrieve the Booking object from request attributes
    Booking book = (Booking) request.getAttribute("bookings");

    if (book != null) {

        Long entryId = book.getEntry();
        String bName = book.getName();
        String bSurname = book.getSurname();
        String bEmail = book.getEmail();
        String bTutoring = book.getTutoring();
        String bTutorName = book.getTutorName();
        String bTutorEmail = book.getTutorEmail();
        String bStatus = book.getStatus();
        String bPhone = book.getPhone();
        String bSubject = book.getSubject();
        String bContactVia = book.getContactMethod();
        String bProvince = book.getProvince();
        String bSuburb = book.getSuburb();
        if(bSuburb.equals("")){
            bSuburb = "n/a";
        }
        String bgetInternetCheck = book.getInternetCheck();

        if(bgetInternetCheck.equals("on")){
            bgetInternetCheck = "Yes";

        }
        else{
            bgetInternetCheck = "No";
        }

        String bTutoringFor = book.getTutoringFor();
        String bHelpWith = book.getHelpWith();
        String bStudName = book.getStudName();
        if(bStudName.equals("")){
        bStudName = "n/a";
        }
        String bStudSurname = book.getStudSurname();
        if(bStudSurname.equals("")){
            bStudSurname = "n/a";
            }
        String bGrade = book.getGrade();
        if(bGrade.equals("")){
            bGrade = "n/a";
            }
        String bSyllabus = book.getSyllabus();
        if(bSyllabus.equals("")){
            bSyllabus = "n/a";
            }
        String bYear = book.getYear();
        if(bYear.equals("")){
            bYear = "n/a";
            }

            String bMessage = book.getMessage();
    %>

    <!-- Modal Structure -->
    <div id="bookingModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="bookingModalLabel">Booking Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <!-- Applicant Section -->
                        <div class="col-md-6">
                            <h5>Applicant</h5>
                            <p><strong>Name:</strong> <span id="modalName"><%= bName %> <%= bSurname %></span></p>
                            <p><strong>Email:</strong> <span id="modalEmail"><%= bEmail %></span></p>
                            <p><strong>Phone:</strong> <span id="modalPhone"><%= bPhone %></span></p>
                            <p><strong>Subject:</strong> <span id="modalSubject"><%= bSubject %></span></p>
                            <p><strong>Tutoring:</strong> <span id="modalTutoring"><%= bTutoring %></span></p>
                            <p><strong>Contact Via:</strong> <span id="modalContactVia"><%= bContactVia %></span></p>
                            <p><strong>Province:</strong> <span id="modalProvince"><%= bProvince %></span></p>
                            <p><strong>Suburb:</strong> <span id="modalSuburb"><%= bSuburb %></span></p>
                            <p><strong>Connection network:</strong> <span id="modalConnection"><%= bgetInternetCheck %></span></p>
                        </div>
                        <!-- Student Details Section -->
                        <div class="col-md-6">
                            <h5>Student Details</h5>
                            <p><strong>Tutoring For:</strong> <span id="modalTutoringFor"><%= bTutoringFor %></span></p>
                            <p><strong>Help with:</strong> <span id="modalHelpWith"><%= bHelpWith %></span></p>
                            <p><strong>Student Name:</strong> <span id="modalStudName"><%= bStudName %></span></p>
                            <p><strong>Student Surname:</strong> <span id="modalStudSurname"><%= bStudSurname %></span></p>
                            <p><strong>Grade:</strong> <span id="modalGrade"><%= bGrade %></span></p>
                            <p><strong>Syllabus:</strong> <span id="modalSyllabus"><%= bSyllabus %></span></p>
                            <p><strong>Year:</strong> <span id="modalYear"><%= bYear %></span></p>
                        </div>
                    </div>
                    <!-- Message Section -->
                    <div class="row">
                        <div class="col-md-6">
                            <h5>Tutor</h5>
                            <p><strong>Tutor Name:</strong> <span id="modalTutorName"><%= bTutorName %></span></p>
                            <p><strong>Tutor Email:</strong> <span id="modalTutorEmail"><%= bTutorEmail %></span></p>
                        </div>
                        <div class="col-md-6">
                            <h5>Progress</h5>
                            <p><strong>Booking Message:</strong> <span id="modalMessage"><%= bMessage %></span></p>
                            <p><strong>Status:</strong> <span id="modalStatus"><%= bStatus %></span></p>
                            
                        </div>
                    </div>
                </div>
                <form action="/accept-booking" method="post">
                <div class="modal-footer">
                    <input type="hidden" id="accept-id" name="accept-id" value=' <%= entryId %> '/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <div class="col-sm-6 p-0 flex justify-content-lg-end justify-content-center">

                     <%
                         if(bStatus.equals("approved")){

                            %>
                                <p>Booking approved...</p>
                            <%
                         } 

                            else{

                                %>

                                <button class="btn btn-success" type="submit">Accept</button>

                                <%
                            }

                         %> 
                   
                    </div>
                    
                </div>
                </form>
            </div>
        </div>
    </div>

    <%
        } else {
        %>
            <p>No booking details found.</p>
        <%
        }
        %>

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
    </script>

</body>
</html>
