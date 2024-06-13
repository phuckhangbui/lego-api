-- CreateTable
CREATE TABLE
  `comments` (
    `comment` TEXT NOT NULL,
    `comment_id` INTEGER NOT NULL AUTO_INCREMENT,
    `commented_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `post_id` INTEGER NOT NULL,
    `user_id` INTEGER NOT NULL,
    PRIMARY KEY (`comment_id`)
  ) DEFAULT CHARACTER
SET
  utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE
  `posts` (
    `content` TEXT NULL,
    `post_id` INTEGER NOT NULL AUTO_INCREMENT,
    `posted_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `status` ENUM ('DELETED', 'ARCHIVED', 'PUBLISHED', 'DRAFT') NOT NULL DEFAULT 'DRAFT',
    `title` VARCHAR(200) NOT NULL,
    `user_id` INTEGER NOT NULL,
    PRIMARY KEY (`post_id`)
  ) DEFAULT CHARACTER
SET
  utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE
  `users` (
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `email` VARCHAR(100) NOT NULL,
    `user_id` INTEGER NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(50) NOT NULL,
    UNIQUE INDEX `users_email_key` (`email`),
    UNIQUE INDEX `users_username_key` (`username`),
    PRIMARY KEY (`user_id`)
  ) DEFAULT CHARACTER
SET
  utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `comments` ADD CONSTRAINT `comments_post_id_fkey` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `comments` ADD CONSTRAINT `comments_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `posts` ADD CONSTRAINT `posts_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;