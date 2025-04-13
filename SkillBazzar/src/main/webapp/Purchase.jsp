<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Purchase</title>
    <%@ include file="bootStrapSupport.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <style>
        /* General Body Styling */
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(to right, #5a5cda, #93e4fa);  /* Professional gradient */
            margin: 0;
            padding: 20px;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #fff;
            font-size: 2.8rem;
            margin-bottom: 20px;
            text-shadow: 2px 3px 8px rgba(0, 0, 0, 0.5);
        }

        h2 {
            text-align: center;
            color: #4c72ff;
            font-size: 2.2rem;
            margin-bottom: 10px;
        }

        p {
            text-align: center;
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 20px;
        }

        /* Course Details Styling */
        .course-details {
            max-width: 700px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1.5s ease-in-out;
            text-align: center;
        }

        .course-details img {
            display: block;
            margin: 0 auto 20px;
            max-width: 100%;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }

        .course-details h3 {
            font-size: 1.6rem;
            color: #007bff;
            margin-bottom: 15px;
        }

        /* QR Code Section */
        .qr-code-section {
            text-align: center;
            margin: 20px 0;
        }

        .qr-code-section img {
            width: 220px;
            margin-bottom: 20px;
        }

        /* Transaction ID Input Section */
        .transaction-input {
            margin: 25px 0;
        }

        .transaction-input input {
            padding: 12px;
            width: 90%;
            max-width: 500px;
            font-size: 1rem;
            border-radius: 10px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .transaction-input button {
            background: linear-gradient(135deg, #007bff, #28a745);
            color: white;
            font-size: 1.2rem;
            padding: 12px 30px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease;
        }

        .transaction-input button:hover {
            background: linear-gradient(135deg, #0056b3, #1e7e34);
            transform: translateY(-3px);
        }

        /* Alert Box for Success Message */
        .alert {
            max-width: 700px;
            margin: 20px auto;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            font-size: 1.1rem;
        }

        /* Success alert */
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        /* Fade-in Animation for Course Details */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

    <h1>Course Purchase</h1>
    <%@ include file="StudentNavbar.jsp" %>
    <br>

    <!-- Success Message Display -->
    <c:if test="${not empty sessionScope.success}">
        <div class="alert alert-success text-center" role="alert">
            ${sessionScope.success}
        </div>
        <c:remove var="success" scope="session" />
    </c:if>

    <div class="course-details">
        <!-- Course details -->
        <h2>!! LET's LEARN !!</h2>
        <p>Course Price: Rs.4999 Only</p>
        <img src="https://i.ytimg.com/vi/Wx0SJa8L4dA/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBTtAm9b620BcU71XBI2vyMJDWqjA"
             alt="Course Image" width="300">

        <!-- QR Code Section -->
        <div class="qr-code-section">
            <h3>Scan the QR Code to complete the payment:</h3>
            <img
                src="https://upload.wikimedia.org/wikipedia/commons/d/d0/QR_code_for_mobile_English_Wikipedia.svg"
                alt="QR Code">
        </div>

        <!-- Transaction ID Input -->
        <div class="transaction-input">
            <h3>Enter Transaction ID:</h3>
            <!-- Form that sends data to ProcessTransactionServlet -->
            <form action="ProcessTransactionServlet" method="post">
                <input type="text" id="transactionId" name="transactionId" placeholder="Enter your Transaction ID" required>
                <br>
                <input type="text" id="courseId" name="courseId" placeholder="Enter Course ID Mentioned on Previous Page" required>
                <br>
                <button type="submit">Submit Transaction</button>
            </form>
        </div>

    </div>

</body>
</html>
