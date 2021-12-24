-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2021 at 01:52 AM
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
(21, 'Famine'),
(22, 'African Football'),
(23, 'Africa'),
(24, 'African Rulers'),
(25, 'Electricity');

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
(12, 23, 'Edwin Diaz', 'edwindiaz@edwindiaz.com', 'I personally think this judgement is bias and lacks judgement.', 'approved', '2021-12-22'),
(13, 22, 'Edwin Diaz', 'edwindiaz@edwindiaz.com', 'This is very true', 'approved', '2021-12-22'),
(14, 21, 'Cindy', 'cindy@cindy.com', 'I couldn\'t agree more!!', 'approved', '2021-12-22');

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
(19, 1, 'The Great wall of Benin', 'USAf', '2021-12-22', '269764089_277953447708145_2053677314826534470_n.jpg', '<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ex est, ullamcorper ac laoreet quis, rutrum nec neque. Donec tortor dui, mollis pellentesque ullamcorper at, dapibus nec ligula. Nunc tristique pulvinar lorem, non fringilla nunc tempus non. Donec accumsan magna et mi aliquet vulputate. Etiam nec mi vitae arcu malesuada mollis ac non leo. Pellentesque dolor enim, pharetra sit amet risus a, vulputate porttitor eros. Maecenas sollicitudin suscipit odio, quis commodo nunc iaculis eget.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Aliquam sed eros in diam volutpat feugiat sed nec libero. In hac habitasse platea dictumst. Curabitur pharetra fermentum malesuada. Vestibulum venenatis orci sit amet malesuada tincidunt. Quisque auctor, tortor a ornare posuere, augue metus molestie ligula, quis fermentum lacus eros non felis. In pulvinar enim euismod orci interdum euismod. Etiam suscipit erat at lacus consectetur luctus. Mauris nisi elit, semper vel interdum eget, maximus eget felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer euismod, turpis non rutrum convallis, felis lorem tempus risus, in interdum magna ipsum hendrerit mi. Aliquam tincidunt sodales diam, at convallis erat luctus at.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Integer quis tempor lorem, ac dapibus arcu. Fusce lectus metus, pretium sit amet lobortis ac, semper a magna. Proin congue consectetur nibh, sed rhoncus sem. Sed velit sem, luctus sed sollicitudin id, dapibus vel quam. Maecenas velit ligula, iaculis vel nibh accumsan, sodales tempus nisi. Duis at felis ac massa tincidunt dapibus. Sed eget lobortis neque, sed sagittis orci. Cras porta sit amet elit ut mollis.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Nunc vulputate neque ut diam blandit aliquet. Sed pulvinar condimentum dolor auctor euismod. Morbi vel laoreet lorem. Duis eu est dictum, luctus arcu id, congue lacus. Aliquam neque nulla, tristique eu laoreet sed, vehicula id nisl. Nunc sed urna euismod, egestas ligula sed, fermentum neque. Proin condimentum ipsum non egestas aliquet. Maecenas ultrices lacinia quam, sit amet mattis massa consectetur sed. Sed venenatis posuere magna nec gravida. Phasellus ut odio accumsan, semper massa eu, rutrum ipsum. Mauris vitae urna sed massa mollis egestas. Ut eget sodales nisi. Morbi nec tortor mauris. Maecenas orci purus, auctor at quam ac, tristique finibus nibh.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Nullam mi lorem, scelerisque quis risus efficitur, lacinia ullamcorper sapien. Integer vestibulum molestie massa, quis pulvinar ante pharetra sed. Duis pellentesque luctus neque eu tempor. Praesent eget sem efficitur, tincidunt nulla vel, sagittis arcu. Proin nec quam a felis finibus aliquam pharetra eu risus. Vivamus tristique purus non fermentum tristique. Integer suscipit consequat quam, eget pulvinar augue. In hendrerit egestas ex, vitae pellentesque tortor ornare eu. Donec dignissim volutpat libero. Aliquam ut commodo enim, a tincidunt magna. Etiam malesuada mauris urna, in posuere lectus rhoncus laoreet. Duis accumsan, ipsum sed condimentum aliquam, justo nibh fringilla est, id suscipit urna augue eu urna. Nam et pretium nunc.</p>', 'africa', 0, 'published', 4),
(20, 1, 'Test', 'USAf', '2021-12-22', 'Screenshot 2021-12-22 142253.png', '<p>Lorem ipsum dolor sit amet, affluérét assidua cotidie eloquentiam inportuno, metu necessarius propterea quandam status testibus? áccusám claudicaré conceptam cursu discere disserunt fugiendum illius melióre páriá pércussit sapientiam saxum! Ceteris democriti porta vituperari? Exercendi morbis nusquam viros. Alienae amice declinatio nóstri plena sénsus suscepi. Aut bónas effluere fruitur impénsa, nobis postulet quanta recta sensus séntio tibique tollátur tria! </p><p><br></p><p>Comit didicisse éléméntum impéritorum, reprimique scriptum? Causas confidet explicari fecerit, finxerat greges haé intémpérantiam ius magnum pariter percipit reliquerunt repugnantibus? Dubitemus exultat impedit legendós natus praesertim quodsi spe utrisque vérbis videtur! Consciéntia maioribus malit molestias, profectus quasi quondám. </p><p><br></p><p>Arbitrer audivi confidam exerci, imperiis infinitó mazim nobis numquam recusabo reprehensiones théséo tollunt? Consecutionem consul emancipaverat esset, mentitum motu optimus périculum sententiae suam vocibus? Geómetria prompta rómanum sentire, solent tandem várius. Dialectica divitiarum facerem ferentur filium, geometriaque moderatio poená sermo voluptate? Amatoriis appellat careret cibó legant, litteris vitáe! Censet commenticiam habent sensuum! </p><p><br></p>', 'africa, leaders, african leaders', 0, 'published', 1),
(21, 1, 'Thomas Sankara', 'USAf', '2021-12-22', '269733790_277558804414276_2589675587462181270_n.jpg', '<p>Happy Bornday to the <b>Late Great Thomas Isidore Noel Sankara!! </b>If you was alive today you would have made Burkina Faso progress and seen poverty completely eradicated. He was a true leader who worked on socialism, revolution and women empowerment. An inspiration to many of us and he teaches us if you do good to people, they will remember and celebrate you forever. He loved his people and tried to do what was best for them, and for that he had to die. May your spirit permeate through the universe.</p><p>The people\'s enemies are those who keep them in ignorance. ~Thomas Sankara.</p>', 'africa, leaders, african leaders', 1, 'published', 6),
(22, 1, 'Electricity Distribution Scam in Africa', 'USAf', '2021-12-22', 'elec.jpg', '<p>You bought a pole, you bought the cable &amp; you bought the meter and you contributed money to buy or replace the community transformer. As soon as you have done all these, it automatically becomes their property. Then the fraudster electricity distribution companies will without taking the meter reading, send outrageous estimated bills to you for power never consumed. And if you dare raise a question against their barefaced robbery, they will come and remove the cable you bought with your money as their property.</p><p>Then you\'ll be charged what they call re-connection fee to get your cable fixed back and you\'ll have to bribe their personnel to replace a melted fuse or you\'ll remain perpetually in darkness and still pay the bill at the of the month.</p><p>The most heinous part of their corporate activities against the people is the revenue target they set for their personnel&nbsp; as to how much they intend to rob africans every month.</p>', 'electricity', 1, 'published', 8),
(23, 1, 'The Power in Africa', 'USAf', '2021-12-22', '269828389_277498727753617_8126054502685438035_n.jpg', '<p>There was a power house in Africa.</p><p>Infact were power in our ourselves. But today, we can\'t even own ourselves. We\'re all liquidated properties of others. All these have happened because we abandoned our spirituality of justice in an exchange of religious favor. We don\'t want to walk in spirituality of justice, but we are happy to serve an imaginary God of favour.</p><p>When you call on African sprituality on a matter of disagreement between two people, instantly or in a short time you get result and the verdict is always based on justice. The one who is wrong always receives the punishment.</p><p>We say this spirituality is dangerous because it kills. Yes, spirituality kills because it contains power. Every power kills; the electricity is power and it kills, speed is power and it kills, the thunder is power and it kills, the sun is power and it kills.</p><p>African spirituality, like all powers does not just kill, it only kills when you abuse it. This doesn\'t mean the power must be thrown away for something fictional. A society cannot become industrial by replacing electric cables with rubber ropes because the electric power kills.</p><p>Unfortunately, we have replaced our electric power, the African spirituality with rubber ropes, religious just to have the feeling that we are having the same power. Unfortunately, religions have no power in them but lies, it lies to ensure that you live your life feeling that everything is fine. It promises you a power and justice but they can only be redeemed after death. The religious God favor and bless those he loves even when they are wrong, while punishes those who do not serve him even when they are right. A God of favor over justice.</p><p>Religion doesn\'t kill because it has no power in it, it even needs you to defend it.</p><p>If we need power to rebuild Africa, then we must not throw away our spirituality, our science, or roadmap, and ourselves.</p>', 'african treasure', 1, 'published', 22),
(24, 22, 'Another Test', 'USAf', '2021-12-23', 'Screenshot 2021-12-22 074915.png', '<p>This isn\'t just <b>anothe</b>r test, it just isn\'t!!</p>', 'test', 0, 'published', 26);

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
  MODIFY `cat_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
