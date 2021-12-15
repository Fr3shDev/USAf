
<?php  include "Includes/db.php"; ?>

 <?php  include "Includes/header.php"; ?>
 

 <?php

if($_SERVER['REQUEST_METHOD'] == "POST") {

    $username = trim($_POST['username']);
    $user_firstname = trim($_POST['user_firstname']);
    $user_lastname = trim($_POST['user_lastname']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    $error = [
        'username'=> '',
        'user_firstname'=> '',
        'user_lastname'=> '',
        'email'=> '',
        'password'=> ''

    ];

    if(strlen($username) < 4){
        $error['username'] = 'Username is too short';
    }
    
    if(strlen($user_firstname) < 4) {
        $error['user_firstname'] = 'Firstname is too short';
    }
    
    if(strlen($user_lastname) < 4) {
        $error['user_lastname'] = 'Lastname is too short';
    }

    if($username == '') {
        $error['username'] = 'Username cannot be empty';
    }
    
    if($user_firstname == ''){
        $error['user_firstname'] = 'First Name cannot be empty';
    }
    
    if($user_lastname == ''){
        $error['user_lastname'] = 'Last Name cannot be empty';
    }
    
    if($email == '') {
        $error['email'] = 'Email cannot be empty';
    }

    if($password == '') {
        $error['password'] = 'Password cannot be empty';
    }

    
    if(username_exists($username)) {
        $error['username'] = 'Username already exists';
    }

    if(user_firstname_exists($user_firstname)) {
        $error['user_firstname'] = 'Name already exists';
    }

    if(user_lastname_exists($user_lastname)) {
        $error['user_firstname'] = 'Name already exists';
    }

    if(email_exists($email)) {
        $error['email'] = 'Name already exists, <a href = "index.php">Please login </a>';
    }

    foreach($error as $key => $value) {
        if(empty($value)) {
            
            
            unset($error[$key]);
        }
    } //foreach

    if(empty($error)) {
        register_user($username, $user_firstname, $user_lastname, $email, $password);

        login_user($username, $password);
    }

    
    

    
    
 }

 ?>

    <!-- Navigation -->
    
    <?php  include "includes/navigation.php"; ?>
    
 
    <!-- Page Content -->
    <div class="container">
    
<section id="login">
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-xs-offset-3">
                <div class="form-wrap">
                <h1>Register</h1>
                    <form role="form" action="registration.php" method="post" id="login-form" autocomplete="off">
                        
                        <div class="form-group">
                            <label for="username" class="sr-only">username</label>
                            <input type="text" name="username" id="username" class="form-control" placeholder="Enter Desired Username"

                            autocomplete="on"

                            value="<?php echo isset($username) ? $username : '' ?>">

                            <p style="color: red;"><?php echo isset($error['username']) ? $error['username'] : '' ?></p>


                        </div>
                        <div class="form-group">
                            <label for="user_firstname" class="sr-only">user_firstname</label>
                            <input type="text" name="user_firstname" id="user_firstname" class="form-control" placeholder="Enter First Name"

                            autocomplete="on"

                            value="<?php echo isset($user_firstname) ? $user_firstname : '' ?>" >

                            <p style="color: red;"><?php echo isset($error['user_firstname']) ? $error['user_firstname'] : '' ?></p>


                        </div>
                        <div class="form-group">
                            <label for="user_lastname" class="sr-only">user_lastname</label>
                            <input type="text" name="user_lastname" id="user_lastname" class="form-control" placeholder="Enter Last Name"

                            autocomplete="on"

                            value="<?php echo isset($user_lastname) ? $user_lastname : '' ?>">

                            <p style="color: red;"><?php echo isset($error['user_lastname']) ? $error['user_lastname'] : '' ?></p>

                        </div>
                         <div class="form-group">
                            <label for="email" class="sr-only">Email</label>
                            <input type="email" name="email" id="email" class="form-control" placeholder="somebody@example.com"

                            autocomplete="on"

                            value="<?php echo isset($email) ? $email : '' ?>" >

                            <p style="color: red;"><?php echo isset($error['email']) ? $error['email'] : '' ?></p>

                        </div>
                         <div class="form-group">
                            <label for="password" class="sr-only">Password</label>
                            <input type="password" name="password" id="key" class="form-control" placeholder="Password">

                            <p style="color: red;"><?php echo isset($error['password']) ? $error['password'] : '' ?></p>

                        </div>
                
                        <input type="submit" name="register" id="btn-login" class="btn btn-custom btn-lg btn-block" value="Register">
                    </form>
                 
                </div>
            </div> <!-- /.col-xs-12 -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</section>


        <hr>



<?php include "includes/footer.php";?>
