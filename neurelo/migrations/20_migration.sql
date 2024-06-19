-- CreateTable
CREATE TABLE
  `Account` (
    `Address` VARCHAR(191) NOT NULL,
    `Email` VARCHAR(191) NOT NULL,
    `UID` VARCHAR(191) NOT NULL,
    `Username` VARCHAR(191) NOT NULL,
    UNIQUE INDEX `Account_Email_key` (`Email`),
    PRIMARY KEY (`UID`)
  ) DEFAULT CHARACTER
SET
  utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE
  `Billing` (
    `AccountUID` VARCHAR(191) NOT NULL,
    `DateCreated` DATETIME (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `DatePaid` DATETIME (3) NOT NULL,
    `Id` INTEGER NOT NULL,
    `Status` INTEGER NOT NULL,
    `TotalPrice` DOUBLE NOT NULL,
    PRIMARY KEY (`Id`)
  ) DEFAULT CHARACTER
SET
  utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE
  `BillingDetail` (
    `BillingId` INTEGER NOT NULL,
    `Id` INTEGER NOT NULL,
    `LegoId` INTEGER NOT NULL,
    `Quantity` INTEGER NOT NULL,
    PRIMARY KEY (`Id`)
  ) DEFAULT CHARACTER
SET
  utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE
  `Image` (
    `ImageId` INTEGER NOT NULL,
    `ImageUrl` VARCHAR(191) NOT NULL,
    `LegoId` INTEGER NOT NULL,
    PRIMARY KEY (`ImageId`)
  ) DEFAULT CHARACTER
SET
  utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE
  `Lego` (
    `Description` VARCHAR(191) NOT NULL,
    `Id` INTEGER NOT NULL,
    `Image` VARCHAR(191) NOT NULL,
    `Name` VARCHAR(191) NOT NULL,
    `Number` VARCHAR(191) NOT NULL,
    `Price` DOUBLE NOT NULL,
    `ReleaseYear` INTEGER NOT NULL,
    `ThemeId` INTEGER NOT NULL,
    PRIMARY KEY (`Id`)
  ) DEFAULT CHARACTER
SET
  utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE
  `LegoTheme` (
    `Id` INTEGER NOT NULL,
    `LegoId` INTEGER NOT NULL,
    `ThemeId` INTEGER NOT NULL,
    PRIMARY KEY (`Id`)
  ) DEFAULT CHARACTER
SET
  utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE
  `Theme` (
    `Id` INTEGER NOT NULL,
    `Name` VARCHAR(191) NOT NULL,
    PRIMARY KEY (`Id`)
  ) DEFAULT CHARACTER
SET
  utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Billing` ADD CONSTRAINT `Billing_AccountUID_fkey` FOREIGN KEY (`AccountUID`) REFERENCES `Account` (`UID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BillingDetail` ADD CONSTRAINT `BillingDetail_BillingId_fkey` FOREIGN KEY (`BillingId`) REFERENCES `Billing` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BillingDetail` ADD CONSTRAINT `BillingDetail_LegoId_fkey` FOREIGN KEY (`LegoId`) REFERENCES `Lego` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Image` ADD CONSTRAINT `Image_LegoId_fkey` FOREIGN KEY (`LegoId`) REFERENCES `Lego` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LegoTheme` ADD CONSTRAINT `LegoTheme_LegoId_fkey` FOREIGN KEY (`LegoId`) REFERENCES `Lego` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LegoTheme` ADD CONSTRAINT `LegoTheme_ThemeId_fkey` FOREIGN KEY (`ThemeId`) REFERENCES `Theme` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;