-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 23. 08 2019 kl. 14:59:35
-- Serverversion: 10.1.37-MariaDB
-- PHP-version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vennerforlivet`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `games`
--

CREATE TABLE `games` (
  `gameID` int(11) NOT NULL,
  `gameName` text COLLATE utf8_bin NOT NULL,
  `gameHasStarted` int(11) NOT NULL,
  `private` int(11) NOT NULL,
  `gameStage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Data dump for tabellen `games`
--

INSERT INTO `games` (`gameID`, `gameName`, `gameHasStarted`, `private`, `gameStage`) VALUES
(215645, 'testGame', 0, 0, 0),
(8456161, 'Unavailble Game', 1, 0, 1),
(8617876, 'Phone Game', 1, 0, 1);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `questions`
--

CREATE TABLE `questions` (
  `ID` int(11) NOT NULL,
  `question` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Data dump for tabellen `questions`
--

INSERT INTO `questions` (`ID`, `question`) VALUES
(1, 'Hvem af jer bruger mest tid på venner/veninder?'),
(2, 'Hvem af jer kysser bedst?'),
(3, 'Hvem af jer har den største røv?'),
(4, 'Hvem af jer har de fedeste ben?'),
(5, 'Hvem af jer spilder mest når man spiser?'),
(6, 'Hvem af jer er det største naturmenneske?'),
(7, 'Hvem af jer bedst til at tegne/male?'),
(8, 'Hvem af jer er mest snobbet?'),
(9, 'Hvem af jer kører hurtigst?'),
(10, 'Hvem af jer kører mest langsomt?'),
(11, 'Hvem af jer læser flest bøger?'),
(12, 'Hvem af jer er mest dominerende?'),
(13, 'Hvem af jer er klogest?'),
(14, 'Hvem af jer bærer mest nag?'),
(15, 'Hvem af jer er mest nærig?'),
(16, 'Hvem af jer bliver oftest væk fra tandlæge?'),
(17, 'Hvem af jer sover stadig med bamse?'),
(18, 'Hvem af jer går i det mest kropsnære tøj?'),
(19, 'Hvem af jer har den pæneste håndskrift?'),
(20, 'Hvem af jer er den værste toastmaster?'),
(21, 'Hvem af jer har den grimmeste telefon?'),
(22, 'Hvem af jer er mest musikalsk?'),
(23, 'Hvem af jer er bedst til at lave mad?'),
(24, 'Hvem af jer er værst til at lave mad?'),
(25, 'Hvem af jer er mest perfektionistisk?'),
(26, 'Hvem af jer er mest hjælpeløs?'),
(27, 'Hvem af jer er mest rastløs?'),
(28, 'Hvem af jer staver bedst?'),
(29, 'Hvem af jer spiser mest junkfood?'),
(30, 'Hvem af jer bliver hurtigst ked af det?'),
(31, 'Hvem af jer er mest ussel når man er syg?'),
(32, 'Hvem af jer er den største fedterøv?'),
(33, 'Hvem af jer har den bedste hukommelse?'),
(34, 'Hvem af jer har det grimmeste navn?'),
(35, 'Hvem af jer har det dårligste syn?'),
(36, 'Hvem af jer bruger længst tid på tønden?'),
(37, 'Hvem af jer er mest selvglad?'),
(38, 'Hvem af jer går i det grimmeste tøj?'),
(39, 'Hvem af jer er mest følsom?'),
(40, 'Hvem af jer har den korteste lunte?'),
(41, 'Hvem af jer bekymrer sig mest?'),
(42, 'Hvem af jer spiser oftest på resturant?'),
(43, 'Hvem af jer er mest fantasifuld?'),
(44, 'Hvem af jer har haft det grimmeste øgenavn?'),
(45, 'Hvem af jer interesserer sig mest for kongehuset?'),
(46, 'Hvem af jer er mest primitiv?'),
(47, 'Hvem af jer interesserer sig mindst for politik?'),
(48, 'Hvem af jer har gået kortest tid i skole?'),
(49, 'Hvem af jer er den største vovehals?'),
(50, 'Hvem af jer arbejder mindst?'),
(51, 'Hvem af jer er mest til fest og ballade?'),
(52, 'Hvem af jer er mest stille og rolig?'),
(53, 'Hvem af jer er mest bagklog?'),
(54, 'Hvem af jer køber flest spil?'),
(55, 'Hvem af jer er den bedste bilist?'),
(56, 'Hvem af jer rejser mest?'),
(57, 'Hvem af jer har gået længst tid i skole?'),
(58, 'Hvem af jer brokker sig mest?'),
(59, 'Hvem af jer provokerer mest, når I er i byen?'),
(60, 'Hvem af jer savler mest, når man sover?'),
(61, 'Hvem af jer er bedst til logik?'),
(62, 'Hvem af jer kan bedst lide at vise sig frem?'),
(63, 'Hvem af jer er den bedste ven?'),
(64, 'Hvem af jer går mest i bad?'),
(65, 'Hvem af jer gør mest ud af sig selv?'),
(66, 'Hvem af jer ved mest om mode?'),
(67, 'Hvem af jer ved mest om ure?'),
(68, 'Hvem af jer er mest voksen?'),
(69, 'Hvem af jer bruger mest sukker i kaffen?'),
(70, 'Hvem af jer kan lide lever?'),
(71, 'Hvem af jer har de korteste ben?'),
(72, 'Hvem af jer ser flest film?'),
(73, 'Hvem af jer rødmer hurtigst?'),
(74, 'Hvem af jer har den dårligste ånde?'),
(75, 'Hvem af jer prutter mest?'),
(76, 'Hvem af jer bøvser mest?'),
(77, 'Hvem af jer er bedst til hovedregning?'),
(78, 'Hvem af jer er mest på sociale medier?'),
(79, 'Hvem af jer er i bedst form?'),
(80, 'Hvem af jer går oftest til frisør?'),
(81, 'Hvem af jer er den største kælling?'),
(82, 'Hvem af jer er den dårligste taber?'),
(83, 'Hvem af jer bruger flest penge på latterlige impulskøb?'),
(84, 'Hvem af jer har den grimmeste pung?'),
(85, 'Hvem af jer er vildest med italiensk mad?'),
(86, 'Hvem af jer er højest?'),
(87, 'Hvem af jer er den største kujon?'),
(88, 'Hvem af jer er hurtigst ude af døren?'),
(89, 'Hvem af jer tager længst tid om at blive færdig?'),
(90, 'Hvem af jer har flest tatoveringer?'),
(91, 'Hvem af jer er den mindst økonomiske?'),
(92, 'Hvem af jer er den bedste kok?'),
(93, 'Hvem af jer er den største soldyrker?'),
(94, 'Hvem af jer dyrker mindst sport?'),
(95, 'Hvem af jer sover mest?'),
(96, 'Hvem af jer arbejder mest?'),
(97, 'Hvem af jer har det mest smittende grin?'),
(98, 'Hvem af jer sover mest i teatret?'),
(99, 'Hvem af jer er mest kræsen?'),
(100, 'Hvem af jer har de grønneste fingre?'),
(101, 'Hvem af jer er mest huslig?'),
(102, 'Hvem af jer spiser mest ost?'),
(103, 'Hvem af jer shopper mest?'),
(104, 'Hvem af jer spiser mest?'),
(105, 'Hvem af jer går tidligst i seng?'),
(106, 'Hvem af jer er mest fotogen?'),
(107, 'Hvem af jer dyrker mest sport?'),
(108, 'Hvem af jer ser mest tv?'),
(109, 'Hvem af jer kører mest bil?'),
(110, 'Hvem af jer hører mest musik?'),
(111, 'Hvem af jer spiser hurtigst?'),
(112, 'Hvem af jer kan bøvse højest?'),
(113, 'Hvem af jer er mest pivet?'),
(114, 'Hvem af jer er mindst fotogen?'),
(115, 'Hvem af jer er mest spillegal?'),
(116, 'Hvem af jer er det største rodehoved?'),
(117, 'Hvem af jer er den største charmetrold?'),
(118, 'Hvem af jer ser mest latterlig ud i shorts?'),
(119, 'Hvem af jer har de grimmeste negle?'),
(120, 'Hvem af jer er mest bange for at flyve?'),
(121, 'Hvem af jer har grimmeste morgenhår?'),
(122, 'Hvem af jer har de sureste tæer?'),
(123, 'Hvem af jer er mest sjusket?'),
(124, 'Hvem af jer er mest bange for nåle?'),
(125, 'Hvem af jer er mest vandskræk?'),
(126, 'Hvem af jer har været flest gange i tivoli?'),
(127, 'Hvem af jer bruger mindst tid på venner/veninder?'),
(128, 'Hvem af jer har dyrket flest forskellige sportsgrene?'),
(129, 'Hvem af jer har den bedste stedsans?'),
(130, 'Hvem af jer har de grimmeste tænder?'),
(131, 'Hvem af jer går mest sexet klædt?'),
(132, 'Hvem af jer har de bredeste hofter?'),
(133, 'Hvem af jer kan drikke flest øl?'),
(134, 'Hvem af jer er den bedste toastmaster?'),
(135, 'Hvem af jeg er mindst huslig?'),
(136, 'Hvem af jer shopper mindst?'),
(137, 'Hvem af jer går senest i seng?'),
(138, 'Hvem af jer er det værst at komme lige efter på WC?'),
(139, 'Hvem af jer spreder flest rygter?'),
(140, 'Hvem af jer har mest kropsbehåring?'),
(141, 'Hvem af jer har den grimmeste mund?'),
(142, 'Hvem af jer sviner mest i hjemmet?'),
(143, 'Hvem af jer har de mest buskede øjenbryn?'),
(144, 'Hvem af jer har den største dobbelthage?'),
(145, 'Hvem af jer sender flest beskeder?'),
(146, 'Hvem af jer er mindst kreativ?'),
(147, 'Hvem af jer går mest i johhintøj?'),
(148, 'Hvem af jer er den største bangebuks?'),
(149, 'Hvem af jer har det mest kultiverede sprog?'),
(150, 'Hvem af jer drikker mindst kaffe?'),
(151, 'Hvem af jer køber mest økologisk?'),
(152, 'Hvem af jer ved mest om teknik?'),
(153, 'Hvem af jer er den mindst opfindsomme?'),
(154, 'Hvem af jer er mest behagesyg?'),
(155, 'Hvem af jer er mindst tjekket?'),
(156, 'Hvem af jer er sjovest?'),
(157, 'Hvem af jer er mest kedelig?'),
(158, 'Hvem af jer interesserer sig mest for politik?'),
(159, 'Hvem af jer er den dårligste kok?'),
(160, 'Hvem af jer er mest konfliktsky?'),
(161, 'Hvem af jer har flest sko?'),
(162, 'Hvem af jer er mest overfladisk?'),
(163, 'Hvem af jer har den flotteste røv?'),
(164, 'Hvem af jer snorker mest?'),
(165, 'Hvem af jer er mest omsorgsfuld?'),
(166, 'Hvem af jer er mindst omsorgsfuld?'),
(167, 'Hvem af jer er dårligst til hovedregning?'),
(168, 'Hvem af jer synger bedst?'),
(169, 'Hvem af jer synger dårligst?'),
(170, 'Hvem af jer sviner mest når man spiser?'),
(171, 'Hvem af jer ender oftest med at ligge på den våde plet?'),
(172, 'Hvem af jer spiser mest hvidløg?'),
(173, 'Hvem af jer er mest stædig?'),
(174, 'Hvem af jer er mest tålmodig?'),
(175, 'Hvem af jer er mest fleksibel?'),
(176, 'Hvem af jer drikker mest sodavand?'),
(177, 'Hvem af jer spiser mest slik?'),
(178, 'Hvem af jer har den kedeligste frisure?'),
(179, 'Hvem af jer har de bedste manerer?'),
(180, 'Hvem af jer er den dårligste til at modtage komplimenter?'),
(181, 'Hvem af jer er mest kreativ?'),
(182, 'Hvem af jer har været i seng med flest?'),
(183, 'Hvem af jer er mest arrogant?'),
(184, 'Hvem af jer har haft kørekort i længst tid?'),
(185, 'Hvem af jer har haft mest sex i det fri?'),
(186, 'Hvem af jer er den mest overbærende?'),
(187, 'Hvem af jer er mest gavmild?'),
(188, 'Hvem af jer har de dårligste manerer?'),
(189, 'Hvem af jer er mest ærlig?'),
(190, 'Hvem af jer er mest tjekket?'),
(191, 'Hvem af jer er mest smålig?'),
(192, 'Hvem af jer sveder mest?'),
(193, 'Hvem af jer roder mindst?'),
(194, 'Hvem af jer er mest barnlig?'),
(195, 'Hvem af jer taler flest sprog?'),
(196, 'Hvem af jer læser færrest bøger?'),
(197, 'Hvem af jer bliver hurtigst brun?'),
(198, 'Hvem af jer bliver hurtigst rød?'),
(199, 'Hvem af jer tager mest sol?'),
(200, 'Hvem af jer er mest umedgørlig?'),
(201, 'Hvem af jer har den tydeligste dialekt?'),
(202, 'Hvem af jer har haft færrest kærester?'),
(203, 'Hvem af jer har det bedste syn?'),
(204, 'Hvem af jer har den dårligste stedsans?'),
(205, 'Hvem af jer har den dårligste hukommelse?'),
(206, 'Hvem af jer har flest grå hår?'),
(207, 'Hvem af jer har det kraftigste hår?'),
(208, 'Hvem af jer har de værste tømmermænd?'),
(209, 'Hvem af jer er mest morgenfrisk?'),
(210, 'Hvem af jer har de pæneste negle?'),
(211, 'Hvem af jer vil hellere spise dårlig mad, end at klage til tjeneren?'),
(212, 'Hvem af jer er mest ivrig?'),
(213, 'Hvem af jer er mest pyntesyg?'),
(214, 'Hvem af jer har den bedste selvironi?'),
(215, 'Hvem af jer er mest lunefuld?'),
(216, 'Hvem af jer rejser mindst?'),
(217, 'Hvem af jer er den dårligste bilist?'),
(218, 'Hvem af jer er den mest økonomiske?'),
(219, 'Hvem af jer er den største sportsidiot?'),
(220, 'Hvem af jer køre mest råddent?'),
(221, 'Hvem af jer er den største nar?'),
(222, 'Hvem af jer har flest søskende?'),
(223, 'Hvem af jer er mest slesk?'),
(224, 'Hvem af jer køber oftest dårlig vin?'),
(225, 'Hvem af jer er mest belærende?'),
(226, 'Hvem af jer er mest klodset?'),
(227, 'Hvem af jer er god til at lyve?'),
(228, 'Hvem af jer tuder mest til film?'),
(229, 'Hvem af jer har den vildeste fantasi?'),
(230, 'Hvem af jer er oftest syg?'),
(231, 'Hvem af jer har haft flest kærester?'),
(232, 'Hvem af jer er sværrest at få fat i?'),
(233, 'Hvem af jer har det tyndeste hår?'),
(234, 'Hvem af jer er mindst snobbet?'),
(235, 'Hvem af jer er i den dårligste form?'),
(236, 'Hvem af jer kan spise mest?'),
(237, 'Hvem af jer snakker mest med mad i munden?'),
(238, 'Hvem af jer vil helst være kendt?'),
(239, 'Hvem af jer har fået flest fartbøder?'),
(240, 'Hvem af jer lever mest usundt?'),
(241, 'Hvem af jer sover længst om morgen?'),
(242, 'Hvem af jer er mest ugidelig med tømmermænd?'),
(243, 'Hvem af jer er dårligst til at overholde aftaler?'),
(244, 'Hvem af jer har den flotteste telefon?'),
(245, 'Hvem af jer har den grimmeste håndskrift?'),
(246, 'Hvem af jer er bedst til at holde tale?'),
(247, 'Hvem af jer sover mest til film?'),
(248, 'Hvem af jer taler færrest sprog?'),
(249, 'Hvem af jer er mindst kræsen?'),
(250, 'Hvem af jer har den pæneste kæreste?'),
(251, 'Hvem af jer er værst når man er fuld?'),
(252, 'Hvem af jer tror man er den bedste - uden at være det?'),
(253, 'Hvem af jer er mest flov over sin skoletid?'),
(254, 'Hvem af jer har det pæneste navn?'),
(255, 'Hvem af jer taler hurtigst?'),
(256, 'Hvem af jer er mest dydig?'),
(257, 'Hvem af jer er mest uhygiejnisk?'),
(258, 'Hvem af jer er mest mistroisk?'),
(259, 'Hvem af jer er mest forfængelig?'),
(260, 'Hvem af jer er mest sjofel?'),
(261, 'Hvem af jer er mest morgengrim?'),
(262, 'Hvem af jer flirter mest?'),
(263, 'Hvem af jer har den bedste krop?'),
(264, 'Hvem af jer er mest nervøs?'),
(265, 'Hvem af jer sladrer mest?'),
(266, 'Hvem af jer er mest charmerende?'),
(267, 'Hvem af jer lyver mest?'),
(268, 'Hvem af jer renser ikke WC-kummen efter brug?'),
(269, 'Hvem pjækker mest fra arbejde?'),
(270, 'Hvem af jer sover oftest nøgen?'),
(271, 'Hvem af jer er den største festoriginal?'),
(272, 'Hvem af jer drikker mest?'),
(273, 'Hvem af jer er mest miljøbevidst?'),
(274, 'Hvem af jer er den største livsnyder?'),
(275, 'Hvem af jer går mest konservativt klædt?'),
(276, 'Hvem af jer har den mest mærkelige musiksmag?'),
(277, 'Hvem af jer har den grimmeste kæreste?'),
(278, 'Hvem af jer taler højst?'),
(279, 'Hvem af jer har været i flest forskellige lande?'),
(280, 'Hvem af jer har boet flest steder?'),
(281, 'Hvem af jer har haft flest biler?'),
(282, 'Hvem af jer er dårligst til at fortælle historier/vittigheder?'),
(283, 'Hvem af jer er mest gammeldags?'),
(284, 'Hvem af jer er mest fingernem?'),
(285, 'Hvem af jer er mindst konfliktsky?'),
(286, 'Hvem af jer sover mindst?'),
(287, 'Hvem af jer opfatter langsomst?'),
(288, 'Hvem af jer er dårligst til at holde tale?'),
(289, 'Hvem af jer er den mest opfindsomme?'),
(290, 'Hvem af jer ved mest om biler? '),
(291, 'Hvem af jer ved mest om motorcykler?');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `spillere`
--

CREATE TABLE `spillere` (
  `spillerID` int(11) NOT NULL,
  `playerName` text COLLATE utf8_bin NOT NULL,
  `gameID` int(11) NOT NULL,
  `sessionID` text COLLATE utf8_bin NOT NULL,
  `hasVoted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`gameID`);

--
-- Indeks for tabel `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks for tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indeks for tabel `spillere`
--
ALTER TABLE `spillere`
  ADD PRIMARY KEY (`spillerID`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `questions`
--
ALTER TABLE `questions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
