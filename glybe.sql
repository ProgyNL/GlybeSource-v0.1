-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 09 mei 2020 om 04:40
-- Serverversie: 10.4.10-MariaDB
-- PHP-versie: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `glybe`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `forum_categories`
--

CREATE TABLE `forum_categories` (
  `id` int(11) NOT NULL,
  `caption` varchar(500) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `min_permission` varchar(50) NOT NULL DEFAULT 'login',
  `min_post_permissions` varchar(50) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `forum_foras`
--

CREATE TABLE `forum_foras` (
  `id` int(11) NOT NULL,
  `category_id` int(25) NOT NULL DEFAULT 1,
  `caption` varchar(200) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `min_permission` varchar(50) NOT NULL,
  `min_post_permissions` varchar(50) NOT NULL DEFAULT '1',
  `permission_for_post` varchar(100) NOT NULL DEFAULT 'see_forum'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `forum_posts`
--

CREATE TABLE `forum_posts` (
  `id` int(11) NOT NULL,
  `user_id` int(25) NOT NULL DEFAULT 0,
  `forum_id` int(25) NOT NULL DEFAULT 0,
  `topic_id` int(25) NOT NULL DEFAULT 0,
  `state` enum('normal','deleted') NOT NULL DEFAULT 'normal',
  `message` text NOT NULL,
  `post_timestamp` int(25) NOT NULL,
  `last_edit` varchar(50) NOT NULL,
  `last_edit_by` int(10) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `first_post` int(2) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `forum_posts_old`
--

CREATE TABLE `forum_posts_old` (
  `id` int(11) NOT NULL,
  `user_id` int(25) NOT NULL,
  `forum_id` int(25) NOT NULL,
  `topic_id` int(25) NOT NULL,
  `state` enum('normal','deleted') NOT NULL,
  `message` text NOT NULL,
  `post_timestamp` int(25) NOT NULL,
  `post_id` int(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `forum_readed`
--

CREATE TABLE `forum_readed` (
  `id` int(11) NOT NULL,
  `forum_id` int(25) NOT NULL DEFAULT 0,
  `topic_id` int(25) NOT NULL DEFAULT 0,
  `user_id` int(25) NOT NULL DEFAULT 0,
  `post_id` int(25) NOT NULL DEFAULT 0,
  `timestamp` int(25) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `forum_reports`
--

CREATE TABLE `forum_reports` (
  `id` int(11) NOT NULL,
  `user_from` int(10) NOT NULL,
  `post_id` int(10) NOT NULL,
  `reason` text NOT NULL,
  `date` varchar(500) NOT NULL,
  `behandeld` int(2) NOT NULL DEFAULT 0,
  `behandeld_door` int(10) NOT NULL,
  `behandeld_date` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `forum_topics`
--

CREATE TABLE `forum_topics` (
  `id` int(11) NOT NULL,
  `forum_id` int(25) NOT NULL DEFAULT 0,
  `user_id` int(25) NOT NULL DEFAULT 0,
  `caption` varchar(500) NOT NULL,
  `state` enum('open','closed','deleted') NOT NULL DEFAULT 'open',
  `sticky` int(2) NOT NULL DEFAULT 0,
  `created_at` int(25) NOT NULL DEFAULT 0,
  `last_post` int(25) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `glybe_partners`
--

CREATE TABLE `glybe_partners` (
  `id` int(11) NOT NULL,
  `type` enum('cat','link') NOT NULL DEFAULT 'link',
  `cat` varchar(225) NOT NULL DEFAULT '6',
  `link` varchar(225) NOT NULL DEFAULT 'www.glybe.nl',
  `name` varchar(225) NOT NULL DEFAULT 'NULL',
  `recommed` enum('true','false') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_from_id` int(25) NOT NULL DEFAULT 0,
  `user_to_id` int(25) NOT NULL DEFAULT 0,
  `state` enum('open','deleted','marked_as_spam','important') NOT NULL DEFAULT 'open',
  `readed` enum('true','false') NOT NULL DEFAULT 'false',
  `folder_id` int(25) NOT NULL DEFAULT 0,
  `sended_on` int(25) NOT NULL,
  `readed_on` int(25) NOT NULL,
  `subject` varchar(400) NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messages_folders`
--

CREATE TABLE `messages_folders` (
  `id` int(11) NOT NULL,
  `user_id` int(25) NOT NULL DEFAULT 0,
  `caption` varchar(200) NOT NULL DEFAULT 'Map',
  `icon` varchar(100) NOT NULL DEFAULT 'folder'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `most_online`
--

CREATE TABLE `most_online` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `number_of_users` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(25) NOT NULL DEFAULT 0,
  `user_from_id` int(25) NOT NULL DEFAULT 0,
  `icon` varchar(100) NOT NULL DEFAULT 'house',
  `title` varchar(100) NOT NULL DEFAULT 'Belangrijk',
  `message` varchar(5000) NOT NULL DEFAULT 'Bas is uber',
  `url` varchar(1000) NOT NULL DEFAULT '#',
  `is_done` enum('1','0') NOT NULL DEFAULT '0',
  `n_ts` int(25) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `poll_answers`
--

CREATE TABLE `poll_answers` (
  `id` int(11) NOT NULL,
  `poll_id` int(25) NOT NULL DEFAULT 0,
  `caption` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `poll_questions`
--

CREATE TABLE `poll_questions` (
  `id` int(11) NOT NULL,
  `user_id` int(25) NOT NULL DEFAULT 0,
  `question` varchar(500) NOT NULL DEFAULT 'Vraag',
  `topic_id` int(25) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `poll_votes`
--

CREATE TABLE `poll_votes` (
  `id` int(11) NOT NULL,
  `poll_id` int(25) NOT NULL,
  `answer_id` int(25) NOT NULL,
  `user_id` int(25) NOT NULL,
  `voted_on` int(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `profile_guestbook`
--

CREATE TABLE `profile_guestbook` (
  `id` int(11) NOT NULL,
  `profile_id` int(25) NOT NULL DEFAULT 0,
  `user_id` int(25) NOT NULL DEFAULT 0,
  `post_timestamp` int(25) NOT NULL,
  `message` text NOT NULL,
  `deleted` enum('true','false') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `profile_music`
--

CREATE TABLE `profile_music` (
  `id` int(11) NOT NULL,
  `user_id` int(25) NOT NULL DEFAULT 0,
  `ordernum` int(25) NOT NULL DEFAULT 0,
  `yt_id` varchar(11) NOT NULL,
  `trackname` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `status_updates`
--

CREATE TABLE `status_updates` (
  `id` int(11) NOT NULL,
  `user_id` int(25) NOT NULL DEFAULT 0,
  `message` text NOT NULL,
  `post_timestamp` int(25) NOT NULL,
  `last_update` int(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `status_updates_replies`
--

CREATE TABLE `status_updates_replies` (
  `id` int(11) NOT NULL,
  `status_id` int(25) NOT NULL DEFAULT 0,
  `user_id` int(25) NOT NULL DEFAULT 0,
  `message` text NOT NULL,
  `post_timestamp` int(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` int(50) NOT NULL,
  `gelezen` int(2) NOT NULL DEFAULT 0,
  `state` enum('open','closed') NOT NULL DEFAULT 'open'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tickets_reactions`
--

CREATE TABLE `tickets_reactions` (
  `id` int(10) NOT NULL,
  `ticket_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `content` text NOT NULL,
  `date` int(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `permission_id` int(25) NOT NULL DEFAULT 1,
  `mail` varchar(500) NOT NULL,
  `avatar` varchar(500) NOT NULL DEFAULT '0_default.png',
  `status_id` enum('1','2','3','4') NOT NULL DEFAULT '1',
  `kladblok` text NOT NULL,
  `warn` int(3) NOT NULL DEFAULT 0,
  `ip` varchar(500) NOT NULL,
  `last_ip` varchar(500) NOT NULL,
  `last_active` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `active` int(3) NOT NULL DEFAULT 0,
  `page_views` int(100) NOT NULL DEFAULT 0,
  `reg_date` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users_bans`
--

CREATE TABLE `users_bans` (
  `id` int(11) NOT NULL,
  `user_id` int(25) NOT NULL,
  `user_ip` varchar(100) NOT NULL,
  `ban_reason` varchar(500) NOT NULL,
  `ban_start` int(25) NOT NULL,
  `ban_expire` int(25) NOT NULL,
  `added_by` int(25) NOT NULL,
  `ip_ban` int(2) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users_friends`
--

CREATE TABLE `users_friends` (
  `id` int(11) NOT NULL,
  `user_one_id` int(10) NOT NULL,
  `user_two_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users_friends_requests`
--

CREATE TABLE `users_friends_requests` (
  `id` int(11) NOT NULL,
  `user_from` int(25) NOT NULL DEFAULT 0,
  `user_to` int(25) NOT NULL DEFAULT 0,
  `date_requested` int(25) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users_online`
--

CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `user_id` int(25) NOT NULL,
  `last_active` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(100) NOT NULL,
  `u_a` varchar(500) NOT NULL,
  `last_page` varchar(500) NOT NULL,
  `last_topic` int(20) NOT NULL,
  `last_forum` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users_permissions`
--

CREATE TABLE `users_permissions` (
  `id` int(11) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `volgorde` int(2) NOT NULL DEFAULT 0,
  `on_teampage` enum('false','true') NOT NULL DEFAULT 'true',
  `login` enum('true','false') NOT NULL DEFAULT 'false',
  `is_admin` enum('true','false') NOT NULL DEFAULT 'false',
  `is_team` enum('true','false') NOT NULL DEFAULT 'false',
  `is_support` enum('true','false') NOT NULL DEFAULT 'false',
  `pro` enum('true','false') NOT NULL DEFAULT 'false',
  `see_forum` enum('true','false') NOT NULL DEFAULT 'false',
  `forum_topic_lock` enum('true','false') NOT NULL DEFAULT 'false',
  `forum_topic_delete` enum('true','false') NOT NULL DEFAULT 'false',
  `forum_topic_edit` enum('true','false') NOT NULL DEFAULT 'false',
  `forum_topic_sticky` enum('true','false') NOT NULL DEFAULT 'false',
  `warn_user` enum('false','true') NOT NULL DEFAULT 'false',
  `forum_report` enum('false','true') NOT NULL DEFAULT 'false',
  `forum_post_delete` enum('false','true') NOT NULL DEFAULT 'false',
  `move_topic` enum('true','false') NOT NULL DEFAULT 'false',
  `forum_first_post` enum('false','true') NOT NULL DEFAULT 'false',
  `is_opper_admin` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users_profilepictures`
--

CREATE TABLE `users_profilepictures` (
  `id` int(25) NOT NULL,
  `user_id` int(25) NOT NULL,
  `save_file` varchar(200) NOT NULL,
  `thumb_file` varchar(200) NOT NULL,
  `current` enum('true','false') NOT NULL DEFAULT 'false',
  `uploaded` int(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users_profilestyle`
--

CREATE TABLE `users_profilestyle` (
  `id` int(11) NOT NULL,
  `user_id` int(25) NOT NULL DEFAULT 0,
  `background` varchar(1000) NOT NULL,
  `background_repeat` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users_respectgiven`
--

CREATE TABLE `users_respectgiven` (
  `id` int(11) NOT NULL,
  `user_id` int(25) NOT NULL,
  `user_to_id` int(25) NOT NULL,
  `time` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users_settings`
--

CREATE TABLE `users_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `accept_friend_request` enum('true','false') NOT NULL DEFAULT 'true',
  `accept_group_invite` enum('true','false') NOT NULL DEFAULT 'true',
  `displayname` varchar(50) NOT NULL,
  `onderschrift` text NOT NULL,
  `profile_story` text NOT NULL,
  `profile_views` int(25) NOT NULL DEFAULT 0,
  `profile_cover` varchar(1000) NOT NULL,
  `respect` int(25) NOT NULL DEFAULT 0,
  `punten` double(100,2) NOT NULL DEFAULT 5.00,
  `send_pb_on_gb_post` enum('true','false') NOT NULL DEFAULT 'true',
  `birthdate` varchar(40) NOT NULL,
  `public_updates` enum('true','false') NOT NULL DEFAULT 'true',
  `sound_notif` enum('true','false') NOT NULL DEFAULT 'true'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users_warn`
--

CREATE TABLE `users_warn` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `user_from` int(10) NOT NULL,
  `percent` int(3) NOT NULL DEFAULT 0,
  `reason` text NOT NULL,
  `seen` int(2) NOT NULL DEFAULT 0,
  `date` varchar(50) NOT NULL,
  `ban` int(2) NOT NULL DEFAULT 0,
  `ban_tot` varchar(50) NOT NULL,
  `ipban` int(2) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `web_sessions`
--

CREATE TABLE `web_sessions` (
  `id` int(11) NOT NULL,
  `session_hash` varchar(500) NOT NULL,
  `session_start` int(25) NOT NULL,
  `session_end` int(25) NOT NULL,
  `user_ip` varchar(100) NOT NULL,
  `user_ua` varchar(500) NOT NULL,
  `user_id` int(25) NOT NULL,
  `admin_session` enum('true','false') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `forum_categories`
--
ALTER TABLE `forum_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `forum_foras`
--
ALTER TABLE `forum_foras`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `forum_posts_old`
--
ALTER TABLE `forum_posts_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `forum_readed`
--
ALTER TABLE `forum_readed`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `forum_reports`
--
ALTER TABLE `forum_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `forum_topics`
--
ALTER TABLE `forum_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `glybe_partners`
--
ALTER TABLE `glybe_partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `messages_folders`
--
ALTER TABLE `messages_folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `most_online`
--
ALTER TABLE `most_online`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `poll_answers`
--
ALTER TABLE `poll_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `poll_questions`
--
ALTER TABLE `poll_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `profile_guestbook`
--
ALTER TABLE `profile_guestbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `profile_music`
--
ALTER TABLE `profile_music`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `status_updates`
--
ALTER TABLE `status_updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `status_updates_replies`
--
ALTER TABLE `status_updates_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users_bans`
--
ALTER TABLE `users_bans`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users_friends`
--
ALTER TABLE `users_friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users_friends_requests`
--
ALTER TABLE `users_friends_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users_permissions`
--
ALTER TABLE `users_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users_profilestyle`
--
ALTER TABLE `users_profilestyle`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users_respectgiven`
--
ALTER TABLE `users_respectgiven`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users_settings`
--
ALTER TABLE `users_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users_warn`
--
ALTER TABLE `users_warn`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `web_sessions`
--
ALTER TABLE `web_sessions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `forum_categories`
--
ALTER TABLE `forum_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `forum_foras`
--
ALTER TABLE `forum_foras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `forum_posts`
--
ALTER TABLE `forum_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `forum_posts_old`
--
ALTER TABLE `forum_posts_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `forum_readed`
--
ALTER TABLE `forum_readed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `forum_reports`
--
ALTER TABLE `forum_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `forum_topics`
--
ALTER TABLE `forum_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `glybe_partners`
--
ALTER TABLE `glybe_partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `messages_folders`
--
ALTER TABLE `messages_folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `most_online`
--
ALTER TABLE `most_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `poll_answers`
--
ALTER TABLE `poll_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `poll_questions`
--
ALTER TABLE `poll_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `poll_votes`
--
ALTER TABLE `poll_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `profile_guestbook`
--
ALTER TABLE `profile_guestbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `profile_music`
--
ALTER TABLE `profile_music`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `status_updates`
--
ALTER TABLE `status_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `status_updates_replies`
--
ALTER TABLE `status_updates_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `users_bans`
--
ALTER TABLE `users_bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `users_friends`
--
ALTER TABLE `users_friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=450;

--
-- AUTO_INCREMENT voor een tabel `users_friends_requests`
--
ALTER TABLE `users_friends_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `users_permissions`
--
ALTER TABLE `users_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `users_profilestyle`
--
ALTER TABLE `users_profilestyle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `users_respectgiven`
--
ALTER TABLE `users_respectgiven`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `users_settings`
--
ALTER TABLE `users_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `users_warn`
--
ALTER TABLE `users_warn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `web_sessions`
--
ALTER TABLE `web_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
