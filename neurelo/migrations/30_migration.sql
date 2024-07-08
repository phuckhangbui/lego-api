-- Neurelo Generated Migration
-- Description: This migration was automatically generated by Neurelo
/*
Warnings:

- You are about to drop the column `Username` on the `Account` table. All the data in the column will be lost.
- Added the required column `DisplayName` to the `Account` table without a default value. This is not possible if the table is not empty.
- Added the required column `PhoneNumber` to the `Account` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Account`
DROP COLUMN `Username`,
ADD COLUMN `DisplayName` VARCHAR(191) NOT NULL,
ADD COLUMN `PhoneNumber` VARCHAR(191) NOT NULL;