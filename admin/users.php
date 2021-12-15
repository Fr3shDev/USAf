<?php include "Includes/admin_header.php"; ?>
<?php 

if(!is_admin($_SESSION['username'])) {
    header("Location:index.php");
}

?>

    <div id="wrapper">











        <!-- Navigation -->
  <?php include "Includes/admin_navigation.php";?>










        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                    <h1 class="page-header">
                            Welcome to admin
                            <small>Author</small>
                        </h1>

                        <?php

                        if(isset($_GET['source'])){
                            $source = $_GET['source'];
                        } else {
                            $source = '';
                        }
                        
                        switch ($source) {
                            case 'add_user';
                            include "Includes/add_user.php";
                            break;

                            case 'edit_user';
                            include "Includes/edit_user.php";
                            break;

                            case '200';
                            echo "NICE 200";
                            break;

                            default:
                            include "Includes/view_all_users.php";
                            break;
                        }




                        ?>
                       
                    </div>





                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>



        <!-- /#page-wrapper -->

   <?php include "Includes/admin_footer.php";?>
