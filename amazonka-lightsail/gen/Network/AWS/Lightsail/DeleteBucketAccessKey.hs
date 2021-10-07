{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Lightsail.DeleteBucketAccessKey
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes an access key for the specified Amazon Lightsail bucket.
--
-- We recommend that you delete an access key if the secret access key is
-- compromised.
--
-- For more information about access keys, see
-- <https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-bucket-access-keys Creating access keys for a bucket in Amazon Lightsail>
-- in the /Amazon Lightsail Developer Guide/.
module Network.AWS.Lightsail.DeleteBucketAccessKey
  ( -- * Creating a Request
    DeleteBucketAccessKey (..),
    newDeleteBucketAccessKey,

    -- * Request Lenses
    deleteBucketAccessKey_bucketName,
    deleteBucketAccessKey_accessKeyId,

    -- * Destructuring the Response
    DeleteBucketAccessKeyResponse (..),
    newDeleteBucketAccessKeyResponse,

    -- * Response Lenses
    deleteBucketAccessKeyResponse_operations,
    deleteBucketAccessKeyResponse_httpStatus,
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import Network.AWS.Lightsail.Types
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newDeleteBucketAccessKey' smart constructor.
data DeleteBucketAccessKey = DeleteBucketAccessKey'
  { -- | The name of the bucket that the access key belongs to.
    bucketName :: Prelude.Text,
    -- | The ID of the access key to delete.
    --
    -- Use the GetBucketAccessKeys action to get a list of access key IDs that
    -- you can specify.
    accessKeyId :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DeleteBucketAccessKey' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'bucketName', 'deleteBucketAccessKey_bucketName' - The name of the bucket that the access key belongs to.
--
-- 'accessKeyId', 'deleteBucketAccessKey_accessKeyId' - The ID of the access key to delete.
--
-- Use the GetBucketAccessKeys action to get a list of access key IDs that
-- you can specify.
newDeleteBucketAccessKey ::
  -- | 'bucketName'
  Prelude.Text ->
  -- | 'accessKeyId'
  Prelude.Text ->
  DeleteBucketAccessKey
newDeleteBucketAccessKey pBucketName_ pAccessKeyId_ =
  DeleteBucketAccessKey'
    { bucketName = pBucketName_,
      accessKeyId = pAccessKeyId_
    }

-- | The name of the bucket that the access key belongs to.
deleteBucketAccessKey_bucketName :: Lens.Lens' DeleteBucketAccessKey Prelude.Text
deleteBucketAccessKey_bucketName = Lens.lens (\DeleteBucketAccessKey' {bucketName} -> bucketName) (\s@DeleteBucketAccessKey' {} a -> s {bucketName = a} :: DeleteBucketAccessKey)

-- | The ID of the access key to delete.
--
-- Use the GetBucketAccessKeys action to get a list of access key IDs that
-- you can specify.
deleteBucketAccessKey_accessKeyId :: Lens.Lens' DeleteBucketAccessKey Prelude.Text
deleteBucketAccessKey_accessKeyId = Lens.lens (\DeleteBucketAccessKey' {accessKeyId} -> accessKeyId) (\s@DeleteBucketAccessKey' {} a -> s {accessKeyId = a} :: DeleteBucketAccessKey)

instance Core.AWSRequest DeleteBucketAccessKey where
  type
    AWSResponse DeleteBucketAccessKey =
      DeleteBucketAccessKeyResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          DeleteBucketAccessKeyResponse'
            Prelude.<$> (x Core..?> "operations" Core..!@ Prelude.mempty)
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable DeleteBucketAccessKey

instance Prelude.NFData DeleteBucketAccessKey

instance Core.ToHeaders DeleteBucketAccessKey where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Core.=# ( "Lightsail_20161128.DeleteBucketAccessKey" ::
                          Prelude.ByteString
                      ),
            "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON DeleteBucketAccessKey where
  toJSON DeleteBucketAccessKey' {..} =
    Core.object
      ( Prelude.catMaybes
          [ Prelude.Just ("bucketName" Core..= bucketName),
            Prelude.Just ("accessKeyId" Core..= accessKeyId)
          ]
      )

instance Core.ToPath DeleteBucketAccessKey where
  toPath = Prelude.const "/"

instance Core.ToQuery DeleteBucketAccessKey where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newDeleteBucketAccessKeyResponse' smart constructor.
data DeleteBucketAccessKeyResponse = DeleteBucketAccessKeyResponse'
  { -- | An array of objects that describe the result of the action, such as the
    -- status of the request, the timestamp of the request, and the resources
    -- affected by the request.
    operations :: Prelude.Maybe [Operation],
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DeleteBucketAccessKeyResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'operations', 'deleteBucketAccessKeyResponse_operations' - An array of objects that describe the result of the action, such as the
-- status of the request, the timestamp of the request, and the resources
-- affected by the request.
--
-- 'httpStatus', 'deleteBucketAccessKeyResponse_httpStatus' - The response's http status code.
newDeleteBucketAccessKeyResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  DeleteBucketAccessKeyResponse
newDeleteBucketAccessKeyResponse pHttpStatus_ =
  DeleteBucketAccessKeyResponse'
    { operations =
        Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | An array of objects that describe the result of the action, such as the
-- status of the request, the timestamp of the request, and the resources
-- affected by the request.
deleteBucketAccessKeyResponse_operations :: Lens.Lens' DeleteBucketAccessKeyResponse (Prelude.Maybe [Operation])
deleteBucketAccessKeyResponse_operations = Lens.lens (\DeleteBucketAccessKeyResponse' {operations} -> operations) (\s@DeleteBucketAccessKeyResponse' {} a -> s {operations = a} :: DeleteBucketAccessKeyResponse) Prelude.. Lens.mapping Lens._Coerce

-- | The response's http status code.
deleteBucketAccessKeyResponse_httpStatus :: Lens.Lens' DeleteBucketAccessKeyResponse Prelude.Int
deleteBucketAccessKeyResponse_httpStatus = Lens.lens (\DeleteBucketAccessKeyResponse' {httpStatus} -> httpStatus) (\s@DeleteBucketAccessKeyResponse' {} a -> s {httpStatus = a} :: DeleteBucketAccessKeyResponse)

instance Prelude.NFData DeleteBucketAccessKeyResponse
