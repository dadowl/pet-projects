-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 31 2020 г., 01:41
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `enabledFrom` date NOT NULL,
  `enabledUntil` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`ID`, `name`, `enabledFrom`, `enabledUntil`) VALUES
(2, 'Первое', '2020-09-07', '2020-11-01'),
(3, 'Второе', '2020-09-07', '2020-10-02'),
(4, 'Десерты', '2020-09-07', '2020-10-02'),
(5, 'Закуски', '2020-09-07', '2020-10-02');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1598724629),
('m130524_201442_init', 1598724685),
('m190124_110200_add_verification_token_column_to_user_table', 1598724685);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`ID`, `name`, `menu_id`, `position`) VALUES
(1, 'Борщ', 2, 1),
(2, 'Щи', 2, 2),
(3, 'Свекольник', 2, 3),
(4, 'Котлеты с гарниром', 3, 1),
(5, 'Котлеты без гарнира', 3, 2),
(6, 'Торт \"Наполеон\"', 4, 1),
(7, 'Чизкейк \"Нью-Йорк\"', 4, 2),
(8, 'Макарон', 4, 3),
(9, 'Закуска из моццареллы, помидоров и базилика', 5, 1),
(10, 'Закуска лечо', 5, 2),
(11, 'Закуска из кабачка с творожным сыром', 5, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `role` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `role`, `created_at`, `updated_at`, `verification_token`, `access_token`) VALUES
(1, 'admin', 'QmYUAFBVJAENKYsp2ZLsJ-2PxUBg5KFv', '$2y$13$kmOPFXBJqKHcV0PHVEMUV.wLa9N05roRtfN78om/i8M6SpLVft7xK', NULL, 'admin@site.ru', 10, 20, 1598733367, 1598734336, 'CsSGFfytTLmBFXVbGz4K4GKIpvwJI7fc_1598733367', NULL),
(2, 'user', '-7b8jNcBzQCJn4NFYKNvcgqOhk0zAjxd', '$2y$13$O5FbN.FwFYmCF6DH8HMlDe0iEPYYyutN4wLZH7ouAy4XRZvy2HYKi', NULL, 'user@site.ru', 10, 10, 1598823173, 1598823246, 'biYFKiCoaMK4bU9cv4DKBkVykqNXgneS_1598823173', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
