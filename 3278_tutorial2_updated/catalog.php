<?php

$host = "sophia"; // In CS department, the database is located in a machine called sophia. If you using your own laptop, you can use localhost
$username="h3621673"; // Your CSID, or use root if you use your own laptop
$password="15342335"; // Your MySQL password.
$database="h3621673"; // In CS department, we create a database for you with name equal to your CSID.

// Connect to database server
$con = mysqli_connect($host,$username,$password);

// Select the database we work on
mysqli_select_db($con,$database) or die( "Unable to select database");

// Step 1.3: More codes here to display the interface in browser.

echo "<!DOCTYPE html>";
echo "<html>";
echo "<head>";
echo "<title>My Catalog</title>";
echo "<link rel='stylesheet' type='text/css' href='style.css'>";
echo "</head>";
echo "<body>";
echo "<div id='header' ></div>";

// Step 1.4-1.6 More codes here to select and display book info from database

echo "</body>";
echo "</html>";

// Prepare the database query
$query = "SELECT * FROM t3_books;";
// Execute the query
$result = mysqli_query($con,$query) or die( "Unable to execute query:".mysqli_error($con));

echo "<table>";
echo "<tr><th>Book ID</th><th>Name</th><th>Selling Price</th><th>Book Detail</th></tr>";
// Step 1.7. Codes to retrieve each tuple selected.
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
{
    // Step 1.8. Codes to handle display of each selected tuple
    echo "<tr>";
    echo "<td>".$row['bookID']."</td>";
    echo "<td>".$row['name']."</td>";
    echo "<td>$".$row['price']."</td>";
    echo "<td><a href='book.php?bookID=".$row['bookID']."'>Detail</a></td>";
    echo "</tr>";
}
echo "</table>";

// Last step. Close the MySQL database connection
mysqli_close($con);

?>
