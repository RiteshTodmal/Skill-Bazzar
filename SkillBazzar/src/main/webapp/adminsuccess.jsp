<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #9face6);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
        }

        .container {
            text-align: center;
            background: white;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
            animation: fadeIn 1.5s ease-in-out;
        }

        h1 {
            color: #28a745;
            font-size: 2.5rem;
            margin-bottom: 15px;
            text-shadow: 1px 2px 5px rgba(0, 0, 0, 0.2);
        }

        p {
            font-size: 1.2rem;
            color: #555;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            padding: 12px 25px;
            background-color: #007bff;
            color: white;
            text-transform: uppercase;
            font-weight: 600;
            text-decoration: none;
            border-radius: 25px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
        }

        /* Fade-in Animation */
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

    <div class="container">
        <h1>Payment Processed Successfully!</h1>
        <p>The student's payment has been approved and they have been enrolled in the course.</p>
        <a href="AdminPayments.jsp">Back to Admin Dashboard</a>
    </div>

</body>
</html>
