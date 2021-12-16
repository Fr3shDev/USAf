<?php

function imagePlaceholder($image = '') {
    if(!$image) {
        return 'image_1.jpg';
    } else {
        return $image;
    }
}

//function that makes a particular user view only posts posted by them in the view_all_posts page
function currentUser() {
    if(isset($_SESSION['username'])) {
        return $_SESSION['username'];
    }
    return false;
}

function redirect($location) {
    header("Location:" . $location);
    exit;
}

function ifItIsMethod($method=null) {
    if($_SERVER['REQUEST_METHOD'] == strtoupper($method)) {
        return true;
    }
    return false;
}

function isLoggedIn()
{
    if (session_status() == PHP_SESSION_NONE) session_start();
 
    if (isset($_SESSION['user_role'])) {
        return true;
    }
 
    return false;
}

//The function below will check if the user is loggedin and also redirect the user

function checkIfUserIsLoggedInAndRedirect ($redirectLocation=null) {
    if(isLoggedIn()) {
         redirect($redirectLocation);
    }
}

function escape($string) {
    global $connection;
    return mysqli_real_escape_string($connection, trim($string));
}



function users_online() {

    if(isset($_GET['onlineusers'])) {

    global $connection;
     
    if(!$connection) {
        session_start();
        include "../Includes/db.php";

        $session = session_id();
        $time = time();
        $time_out_in_seconds = 05;
        $time_out = $time - $time_out_in_seconds;

        $query = "SELECT * FROM users_online WHERE session = '$session'";
        $send_query = mysqli_query($connection, $query);
        $count = mysqli_num_rows($send_query);

            if($count == NULL) {
                mysqli_query($connection, "INSERT INTO users_online(session, time) VALUES('$session', '$time')");
            } else {
                mysqli_query($connection, "UPDATE users_online SET time = '$time' WHERE session = '$session'");
            }
        $users_online_query = mysqli_query($connection, "SELECT * FROM users_online WHERE time > '$time_out'");
        echo $count_user = mysqli_num_rows($users_online_query);

    }
 
} //get request isset()
}

users_online();

function confirmQuery($result) {
    global $connection;
    if(!$result) {
        die("QUERY FAILED". mysqli_error($connection));
    }
    

}

function insert_categories() {

    global $connection;
    
    if(isset($_POST['submit'])) {
        $cat_title = $_POST['cat_title'];

        if($cat_title == "" || empty($cat_title)) {
            echo "This field should not be empty";
        } else {


            $stmt = mysqli_prepare($connection, "INSERT INTO categories(cat_title) VALUES(?)");
            
            mysqli_stmt_bind_param($stmt, "s", $cat_title);

            mysqli_stmt_execute($stmt);

            

            if(!$stmt) {
                die("QUERY FAILED". mysqli_error($connection));
            }
        }

        
    }
}

function findAllCategories() {
    global $connection;
    $query = "SELECT * FROM categories"; //use "LIMIT 3" if you want to limit the number of categories displayed on the sidebar to 3
    $select_categories = mysqli_query($connection, $query);

    while($row = mysqli_fetch_assoc($select_categories)) {
        $cat_id = $row['cat_id'];
        $cat_title = $row['cat_title'];

        echo "<tr>";
        echo "<td>{$cat_id}</td>";
        echo "<td>{$cat_title}</td>";
        echo "<td><a href='categories.php?edit={$cat_id}'>Edit</a></td>";
        echo "<td><a href='categories.php?delete={$cat_id}'>Delete</a></td>";
        echo "</tr>";
    
    }
}

function deleteCategories() {
    global $connection;
    if(isset($_GET['delete'])){
        $the_cat_id = $_GET['delete'];

        $query = "DELETE FROM categories WHERE cat_id = {$the_cat_id}";
        $delete_query = mysqli_query($connection, $query);
        header("Location:categories.php");
    }

}


function recordCount($table) {
    global $connection;

    $query = "SELECT * FROM " . $table;
    $select_all_post = mysqli_query($connection, $query);

    $result = mysqli_num_rows($select_all_post);

    confirmQuery($result);
    return $result;
}

function checkStatus($table, $column, $status) {
    global $connection;;
    $query = "SELECT * FROM $table WHERE $column = '$status'";
    $result = mysqli_query($connection, $query);
    confirmQuery($result);
    return mysqli_num_rows($result);

}

function checkUserRole($table, $column, $role) {
    global $connection;

    $query = "SELECT * FROM $table WHERE $column = '$role'";
    $select_all_subscribers = mysqli_query($connection, $query);
    return mysqli_num_rows($select_all_subscribers);
}

function is_admin($username) {
    global $connection;

    $query = "SELECT user_role FROM users WHERE username = '$username'";
    
    $result = mysqli_query($connection, $query);
    confirmQuery($result);

    $row = mysqli_fetch_array($result);

    if($row['user_role'] == 'admin') {
        return true;
    } else {
        return false;
    }
}

function username_exists($username) {

    global $connection;

    $query = "SELECT username FROM users WHERE username = '$username'";
    
    $result = mysqli_query($connection, $query);
    confirmQuery($result);

    if(mysqli_num_rows($result) > 0) {
        return true;
    } else {
        return false;
    }


}

function user_firstname_exists($user_firstname) {

    global $connection;

    $query = "SELECT user_firstname FROM users WHERE user_firstname = '$user_firstname'";
    
    $result = mysqli_query($connection, $query);
    confirmQuery($result);

    if(mysqli_num_rows($result) > 0) {
        return true;
    } else {
        return false;
    }


}


function user_lastname_exists($user_lastname) {

    global $connection;

    $query = "SELECT user_lastname FROM users WHERE user_lastname = '$user_lastname'";
    
    $result = mysqli_query($connection, $query);
    confirmQuery($result);

    if(mysqli_num_rows($result) > 0) {
        return true;
    } else {
        return false;
    }


}




function email_exists($email) {

    global $connection;

    $query = "SELECT user_email FROM users WHERE user_email = '$email'";
    
    $result = mysqli_query($connection, $query);
    confirmQuery($result);

    if(mysqli_num_rows($result) > 0) {
        return true;
    } else {
        return false;
    }


}

function register_user($username, $user_firstname, $user_lastname, $email, $password) {
    global $connection; 


        $username = mysqli_real_escape_string($connection, $username);
        $user_firstname = mysqli_real_escape_string($connection, $user_firstname);
        $user_lastname = mysqli_real_escape_string($connection, $user_lastname);
        $email = mysqli_real_escape_string($connection, $email);
        $password = mysqli_real_escape_string($connection, $password);

        $password = password_hash($password, PASSWORD_BCRYPT, array('cost'=>12) );

        $query = "INSERT INTO users (username, user_firstname, user_lastname, user_email, user_password, user_role) ";
        $query .= "VALUES ('{$username}', '{$user_firstname}','{$user_lastname}','{$email}','{$password}','subscriber' )";
        $register_user_query = mysqli_query($connection, $query);
        
        confirmQuery($register_user_query);

    //$message = "Your registration has been submitted";


}

function login_user($username, $password) {
    global $connection;
   $username = trim($username);
   $password = trim($password);

    $username = mysqli_real_escape_string($connection, $username);
    $password = mysqli_real_escape_string($connection, $password);






    //This is where i adjusted the login so that only users who are admins can login into the admin section by adding AND user_role = 'admin' to the query below





    $query = "SELECT * FROM users WHERE username = '{$username}' ";
    $select_user_query = mysqli_query($connection, $query);
    if (!$select_user_query) {
        die("QUERY FAILED". mysqli_error($connection));
    }

    while($row = mysqli_fetch_array($select_user_query)) {
        $db_user_id = $row['user_id'];
        $db_username = $row['username'];
        $db_user_password = $row['user_password'];
        $db_user_firstname = $row['user_firstname'];
        $db_user_lastname = $row['user_lastname'];
        $db_user_role = $row['user_role'];



        if (password_verify($password, $db_user_password)) {

            if (session_status() === PHP_SESSION_NONE) session_start();
    
            $_SESSION['username'] = $db_username;
            $_SESSION['firstname'] = $db_user_firstname;
            $_SESSION['lastname'] = $db_user_lastname;
            $_SESSION['user_role'] = $db_user_role;
    
           redirect("/My Workspace/USAf/admin");
    
           
    
        } else {
            return false;
        }
    }
    return true;
    }

    //$password = crypt($password, $db_user_password);

  
