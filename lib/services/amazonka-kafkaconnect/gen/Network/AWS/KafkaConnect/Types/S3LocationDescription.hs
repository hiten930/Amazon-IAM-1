{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.KafkaConnect.Types.S3LocationDescription
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.KafkaConnect.Types.S3LocationDescription where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude

-- | The description of the location of an object in Amazon S3.
--
-- /See:/ 'newS3LocationDescription' smart constructor.
data S3LocationDescription = S3LocationDescription'
  { -- | The version of an object in an S3 bucket.
    objectVersion :: Prelude.Maybe Prelude.Text,
    -- | The Amazon Resource Name (ARN) of an S3 bucket.
    bucketArn :: Prelude.Maybe Prelude.Text,
    -- | The file key for an object in an S3 bucket.
    fileKey :: Prelude.Maybe Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'S3LocationDescription' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'objectVersion', 's3LocationDescription_objectVersion' - The version of an object in an S3 bucket.
--
-- 'bucketArn', 's3LocationDescription_bucketArn' - The Amazon Resource Name (ARN) of an S3 bucket.
--
-- 'fileKey', 's3LocationDescription_fileKey' - The file key for an object in an S3 bucket.
newS3LocationDescription ::
  S3LocationDescription
newS3LocationDescription =
  S3LocationDescription'
    { objectVersion =
        Prelude.Nothing,
      bucketArn = Prelude.Nothing,
      fileKey = Prelude.Nothing
    }

-- | The version of an object in an S3 bucket.
s3LocationDescription_objectVersion :: Lens.Lens' S3LocationDescription (Prelude.Maybe Prelude.Text)
s3LocationDescription_objectVersion = Lens.lens (\S3LocationDescription' {objectVersion} -> objectVersion) (\s@S3LocationDescription' {} a -> s {objectVersion = a} :: S3LocationDescription)

-- | The Amazon Resource Name (ARN) of an S3 bucket.
s3LocationDescription_bucketArn :: Lens.Lens' S3LocationDescription (Prelude.Maybe Prelude.Text)
s3LocationDescription_bucketArn = Lens.lens (\S3LocationDescription' {bucketArn} -> bucketArn) (\s@S3LocationDescription' {} a -> s {bucketArn = a} :: S3LocationDescription)

-- | The file key for an object in an S3 bucket.
s3LocationDescription_fileKey :: Lens.Lens' S3LocationDescription (Prelude.Maybe Prelude.Text)
s3LocationDescription_fileKey = Lens.lens (\S3LocationDescription' {fileKey} -> fileKey) (\s@S3LocationDescription' {} a -> s {fileKey = a} :: S3LocationDescription)

instance Core.FromJSON S3LocationDescription where
  parseJSON =
    Core.withObject
      "S3LocationDescription"
      ( \x ->
          S3LocationDescription'
            Prelude.<$> (x Core..:? "objectVersion")
            Prelude.<*> (x Core..:? "bucketArn")
            Prelude.<*> (x Core..:? "fileKey")
      )

instance Prelude.Hashable S3LocationDescription

instance Prelude.NFData S3LocationDescription
