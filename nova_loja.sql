-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Ago-2021 às 23:29
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `nova_loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `brands`
--

CREATE TABLE `brands` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'LG'),
(2, 'Samsung'),
(3, 'AOC'),
(5, 'Philco');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `sub` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `sub`, `name`) VALUES
(6, NULL, 'Monitor'),
(14, NULL, 'Som'),
(15, 14, 'Headphones'),
(16, 14, 'Microfones'),
(17, 15, 'Com Fio'),
(18, 15, 'Sem Fio');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `coupon_type` int(11) NOT NULL,
  `coupon_value` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `options`
--

CREATE TABLE `options` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `options`
--

INSERT INTO `options` (`id`, `name`) VALUES
(1, 'Cor'),
(2, 'Tamanho'),
(3, 'Memória RAM'),
(4, 'Polegadas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pages`
--

CREATE TABLE `pages` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pages`
--

INSERT INTO `pages` (`id`, `title`, `body`) VALUES
(1, 'Política de privacidade', '<p>...</p>'),
(2, 'Termos de Uso', '<p>...</p>'),
(3, 'Política de Devolução', '<p>...</p>');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `permission_groups`
--

INSERT INTO `permission_groups` (`id`, `name`) VALUES
(1, 'Super Administrador'),
(2, 'Administrador'),
(3, 'Gerente'),
(4, 'Vendedor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_items`
--

CREATE TABLE `permission_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `permission_items`
--

INSERT INTO `permission_items` (`id`, `name`, `slug`) VALUES
(1, 'Criar Cupom de Oferta', 'cupons_create'),
(2, 'Ver Permissões', 'permissions_view'),
(3, 'Ver Categorias', 'categories_view'),
(4, 'Ver Marcas', 'brands_view'),
(5, 'Ver Páginas', 'pages_view'),
(6, 'Ver Produtos', 'products_view'),
(7, 'Ver Usuários', 'users_view'),
(8, 'Ver Marcas', 'brands_view');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_links`
--

CREATE TABLE `permission_links` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_permission_group` int(11) NOT NULL,
  `id_permission_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `permission_links`
--

INSERT INTO `permission_links` (`id`, `id_permission_group`, `id_permission_item`) VALUES
(2, 2, 1),
(3, 3, 1),
(15, 1, 1),
(16, 1, 2),
(17, 1, 3),
(18, 1, 4),
(19, 1, 5),
(20, 1, 6),
(21, 1, 7),
(22, 1, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `price` float NOT NULL,
  `price_from` float NOT NULL,
  `rating` float NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `sale` tinyint(1) NOT NULL,
  `bestseller` tinyint(1) NOT NULL,
  `new_product` tinyint(1) NOT NULL,
  `options` varchar(200) DEFAULT NULL,
  `weight` float NOT NULL,
  `width` float NOT NULL,
  `height` float NOT NULL,
  `length` float NOT NULL,
  `diameter` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `id_category`, `id_brand`, `name`, `description`, `stock`, `price`, `price_from`, `rating`, `featured`, `sale`, `bestseller`, `new_product`, `options`, `weight`, `width`, `height`, `length`, `diameter`) VALUES
(1, 6, 1, 'Monitor 21 polegadas', 'Alguma descrição do produto.', 10, 499, 599, 0, 1, 1, 1, 0, '1,2,4', 0.9, 20, 15, 20, 15),
(2, 6, 2, 'Monitor 18 polegadas', 'Alguma outra descrição', 10, 399, 999, 2, 1, 1, 1, 0, '1,2', 0.8, 20, 15, 20, 15),
(3, 6, 2, 'Monitor 19 polegadas', 'Alguma outra descrição', 10, 599, 699, 0, 1, 0, 0, 1, '1,2', 0.7, 20, 15, 20, 15),
(4, 6, 3, 'Monitor 17 polegadas', 'Alguma outra descrição', 10, 3779, 900, 2, 1, 0, 0, 0, '1,4', 0.6, 20, 15, 20, 15),
(5, 6, 1, 'Monitor 20 polegadas', 'Alguma outra descrição', 10, 299, 499, 0, 1, 0, 0, 1, '1', 0.5, 20, 15, 20, 15),
(6, 6, 3, 'Monitor 20 polegadas', 'Alguma outra descrição', 10, 699, 0, 0, 1, 0, 0, 0, '1,2,4', 0.4, 20, 15, 20, 15),
(7, 6, 3, 'Monitor 19 polegadas', 'Alguma outra descrição', 10, 889, 999, 5, 1, 1, 0, 0, '2,4', 0.3, 20, 15, 20, 15),
(8, 6, 1, 'Monitor 18 polegadas', 'Alguma outra descrição', 10, 599, 699, 0, 1, 0, 0, 0, '4', 0.2, 20, 15, 20, 15),
(9, 14, 3, 'som bacana', '<p>som muito legal&nbsp;</p>', 4, 100, 125, 0, 1, 1, 0, 1, '1', 0.7, 15, 16, 200, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `products_images`
--

CREATE TABLE `products_images` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) NOT NULL,
  `url` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `products_images`
--

INSERT INTO `products_images` (`id`, `id_product`, `url`) VALUES
(1, 1, '1.jpg'),
(2, 2, '2.jpg'),
(3, 3, '3.jpg'),
(4, 4, '4.jpg'),
(5, 5, '1.jpg'),
(6, 6, '3.jpg'),
(7, 7, '7.jpg'),
(8, 8, '7.jpg'),
(9, 2, '3.jpg'),
(10, 2, '4.jpg'),
(11, 2, '7.jpg'),
(12, 9, '542862c184ef8ceba5be04f524c7d6e8.jpg'),
(13, 9, '29cf2c02cbb94a211df28892f3fa8d11.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `products_options`
--

CREATE TABLE `products_options` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_option` int(11) NOT NULL,
  `p_value` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `products_options`
--

INSERT INTO `products_options` (`id`, `id_product`, `id_option`, `p_value`) VALUES
(1, 1, 1, 'Azul'),
(2, 1, 2, '23cm'),
(3, 1, 4, '21'),
(4, 2, 1, 'Azul'),
(5, 2, 2, '19cm'),
(6, 3, 1, 'Vermelho'),
(7, 3, 2, '19cm'),
(8, 9, 1, 'Preto');

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_coupon` int(11) DEFAULT NULL,
  `total_amount` float NOT NULL,
  `payment_type` varchar(100) DEFAULT NULL,
  `payment_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `purchases`
--

INSERT INTO `purchases` (`id`, `id_user`, `id_coupon`, `total_amount`, `payment_type`, `payment_status`) VALUES
(1, 2, NULL, 421.44, 'psckttransparente', 1),
(2, 2, NULL, 421.44, 'psckttransparente', 1),
(3, 2, NULL, 421.44, 'psckttransparente', 1),
(4, 2, NULL, 421.44, 'psckttransparente', 1),
(5, 2, NULL, 421.44, 'psckttransparente', 1),
(6, 2, NULL, 421.44, 'psckttransparente', 1),
(7, 2, NULL, 421.44, 'psckttransparente', 1),
(8, 2, NULL, 421.44, 'psckttransparente', 1),
(9, 2, NULL, 421.44, 'psckttransparente', 1),
(10, 2, NULL, 421.44, 'psckttransparente', 1),
(11, 2, NULL, 421.44, 'psckttransparente', 1),
(12, 2, NULL, 421.44, 'psckttransparente', 1),
(13, 2, NULL, 421.44, 'psckttransparente', 1),
(14, 2, NULL, 421.44, 'psckttransparente', 1),
(15, 2, NULL, 421.44, 'psckttransparente', 1),
(16, 2, NULL, 421.44, 'psckttransparente', 1),
(17, 2, NULL, 421.44, 'psckttransparente', 1),
(18, 2, NULL, 421.44, 'psckttransparente', 1),
(19, 2, NULL, 421.44, 'psckttransparente', 1),
(20, 2, NULL, 421.44, 'psckttransparente', 1),
(21, 2, NULL, 421.44, 'psckttransparente', 1),
(22, 2, NULL, 421.44, 'psckttransparente', 1),
(23, 2, NULL, 421.44, 'psckttransparente', 1),
(24, 2, NULL, 421.44, 'psckttransparente', 1),
(25, 2, NULL, 421.44, 'psckttransparente', 1),
(26, 2, NULL, 421.44, 'psckttransparente', 1),
(27, 2, NULL, 421.44, 'psckttransparente', 1),
(28, 2, NULL, 421.44, 'psckttransparente', 1),
(29, 2, NULL, 421.44, 'psckttransparente', 1),
(30, 2, NULL, 421.44, 'psckttransparente', 1),
(31, 2, NULL, 421.44, 'psckttransparente', 1),
(32, 2, NULL, 421.44, 'psckttransparente', 1),
(33, 2, NULL, 421.44, 'psckttransparente', 1),
(34, 2, NULL, 421.44, 'psckttransparente', 1),
(35, 2, NULL, 421.44, 'psckttransparente', 1),
(36, 2, NULL, 421.44, 'psckttransparente', 1),
(37, 2, NULL, 421.44, 'psckttransparente', 1),
(38, 2, NULL, 421.44, 'psckttransparente', 1),
(39, 2, NULL, 421.44, 'psckttransparente', 1),
(40, 2, NULL, 421.44, 'psckttransparente', 1),
(41, 2, NULL, 421.44, 'psckttransparente', 1),
(42, 2, NULL, 421.44, 'psckttransparente', 1),
(43, 2, NULL, 421.44, 'psckttransparente', 1),
(44, 2, NULL, 421.44, 'psckttransparente', 1),
(45, 2, NULL, 421.44, 'psckttransparente', 1),
(46, 2, NULL, 421.44, 'psckttransparente', 1),
(47, 2, NULL, 421.44, 'psckttransparente', 1),
(48, 2, NULL, 421.44, 'psckttransparente', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchases_products`
--

CREATE TABLE `purchases_products` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_purchase` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `purchases_products`
--

INSERT INTO `purchases_products` (`id`, `id_purchase`, `id_product`, `quantity`, `product_price`) VALUES
(1, 1, 2, 1, 399),
(2, 2, 2, 1, 399),
(3, 3, 2, 1, 399),
(4, 4, 2, 1, 399),
(5, 5, 2, 1, 399),
(6, 6, 2, 1, 399),
(7, 7, 2, 1, 399),
(8, 8, 2, 1, 399),
(9, 9, 2, 1, 399),
(10, 10, 2, 1, 399),
(11, 11, 2, 1, 399),
(12, 12, 2, 1, 399),
(13, 13, 2, 1, 399),
(14, 14, 2, 1, 399),
(15, 15, 2, 1, 399),
(16, 16, 2, 1, 399),
(17, 17, 2, 1, 399),
(18, 18, 2, 1, 399),
(19, 19, 2, 1, 399),
(20, 20, 2, 1, 399),
(21, 21, 2, 1, 399),
(22, 22, 2, 1, 399),
(23, 23, 2, 1, 399),
(24, 24, 2, 1, 399),
(25, 25, 2, 1, 399),
(26, 26, 2, 1, 399),
(27, 27, 2, 1, 399),
(28, 28, 2, 1, 399),
(29, 29, 2, 1, 399),
(30, 30, 2, 1, 399),
(31, 31, 2, 1, 399),
(32, 32, 2, 1, 399),
(33, 33, 2, 1, 399),
(34, 34, 2, 1, 399),
(35, 35, 2, 1, 399),
(36, 36, 2, 1, 399),
(37, 37, 2, 1, 399),
(38, 38, 2, 1, 399),
(39, 39, 2, 1, 399),
(40, 40, 2, 1, 399),
(41, 41, 2, 1, 399),
(42, 42, 2, 1, 399),
(43, 43, 2, 1, 399),
(44, 44, 2, 1, 399),
(45, 45, 2, 1, 399),
(46, 46, 2, 1, 399),
(47, 47, 2, 1, 399),
(48, 48, 2, 1, 399);

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchase_transactions`
--

CREATE TABLE `purchase_transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_purchase` int(11) NOT NULL,
  `amount` float NOT NULL,
  `transaction_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rates`
--

CREATE TABLE `rates` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_rated` datetime NOT NULL,
  `points` int(11) NOT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `rates`
--

INSERT INTO `rates` (`id`, `id_product`, `id_user`, `date_rated`, `points`, `comment`) VALUES
(1, 2, 1, '2017-01-01 00:00:00', 2, 'Produto muito legal.'),
(2, 2, 1, '2017-01-02 00:00:00', 2, 'Produto meio ruim.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_permission` int(11) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `token` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `id_permission`, `email`, `password`, `name`, `admin`, `token`) VALUES
(1, 1, 'suporte@b7web.com.br', '698dc19d489c4e4db73e28a713eab07b', 'Bonieky Lacerda', 0, NULL),
(2, 0, 'c74502652460089725395@sandbox.pagseguro.com.br', '974U1WM32m975041', NULL, 0, NULL),
(3, 1, 'macnunes92@gmail.com', '202cb962ac59075b964b07152d234b70', 'Matheus', 1, '2e322d0578ccdac63a82809f9adf357a'),
(4, 0, 'oi@oi.com', '123456', 'oi', 1, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `permission_items`
--
ALTER TABLE `permission_items`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `permission_links`
--
ALTER TABLE `permission_links`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `products_options`
--
ALTER TABLE `products_options`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `purchases_products`
--
ALTER TABLE `purchases_products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `purchase_transactions`
--
ALTER TABLE `purchase_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `permission_items`
--
ALTER TABLE `permission_items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `permission_links`
--
ALTER TABLE `permission_links`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `products_options`
--
ALTER TABLE `products_options`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `purchases_products`
--
ALTER TABLE `purchases_products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `purchase_transactions`
--
ALTER TABLE `purchase_transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
