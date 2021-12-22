-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2021 at 03:14 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usaf`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(6) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Political Unrest'),
(20, 'War'),
(21, 'Famine'),
(22, 'African Football'),
(23, 'Africa'),
(24, 'African Rulers');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(6) NOT NULL,
  `comment_post_id` int(6) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(11, 7, 'Edwin Diaz', 'edwindiaz@edwindiaz.com', 'This is a test comment', 'unapproved', '2021-12-21');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(6) NOT NULL,
  `post_category_id` int(6) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`) VALUES
(15, 1, 'Title 1', 'USAf', '2021-12-22', 'firspic.jpg', '<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse euismod interdum ligula vel pulvinar. Vivamus varius blandit felis, a imperdiet dui volutpat at. Phasellus eu elit bibendum, tempus justo a, vestibulum nibh. Maecenas eget sapien ut eros fringilla tincidunt. Vivamus at mattis ante. Phasellus in dolor in justo vehicula iaculis vel consequat felis. Proin in lacinia risus. Cras pellentesque nibh nec lectus commodo, quis molestie tortor porta.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Donec a tortor finibus lectus placerat commodo. Vivamus pharetra pretium lectus sit amet aliquam. Sed vitae placerat ligula, at volutpat enim. Sed fermentum ipsum eget tortor tristique elementum sed vel magna. Aenean euismod placerat neque sit amet aliquam. Aenean consectetur purus non est semper ultricies. Mauris scelerisque pellentesque nulla, quis vehicula est. Maecenas mollis turpis eget justo maximus rutrum.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Morbi ut sodales lacus. Mauris dignissim nunc vel hendrerit viverra. Vivamus dapibus leo a hendrerit porta. Nam bibendum blandit leo, id varius sem ornare lacinia. Cras accumsan rutrum suscipit. Fusce ut justo id sapien imperdiet condimentum. Nam sit amet lacus ut enim vehicula accumsan quis consequat quam. Phasellus non metus ultricies, ultrices ex at, efficitur ante.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Sed venenatis metus vulputate est ornare, sit amet sodales arcu eleifend. Aliquam tristique, ex sit amet pretium sodales, augue orci porttitor nulla, eu efficitur erat dui ac diam. Integer id dui nisi. Sed et nibh augue. Donec imperdiet consectetur laoreet. Nullam feugiat est non turpis mollis iaculis. Ut sit amet tristique eros.</p>', 'africa, leaders, african leaders', 0, 'published', 0),
(16, 20, 'Title 2', 'USAf', '2021-12-22', 'secondpic.jpg', '<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse euismod interdum ligula vel pulvinar. Vivamus varius blandit felis, a imperdiet dui volutpat at. Phasellus eu elit bibendum, tempus justo a, vestibulum nibh. Maecenas eget sapien ut eros fringilla tincidunt. Vivamus at mattis ante. Phasellus in dolor in justo vehicula iaculis vel consequat felis. Proin in lacinia risus. Cras pellentesque nibh nec lectus commodo, quis molestie tortor porta.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Donec a tortor finibus lectus placerat commodo. Vivamus pharetra pretium lectus sit amet aliquam. Sed vitae placerat ligula, at volutpat enim. Sed fermentum ipsum eget tortor tristique elementum sed vel magna. Aenean euismod placerat neque sit amet aliquam. Aenean consectetur purus non est semper ultricies. Mauris scelerisque pellentesque nulla, quis vehicula est. Maecenas mollis turpis eget justo maximus rutrum.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><br></p>', 'africa, leaders, african leaders', 0, 'published', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `user_password`, `user_image`, `user_role`, `randSalt`) VALUES
(1, 'Marcus', 'marcus@usaf', 'marcus@usaf@admin', '', 'admin', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
