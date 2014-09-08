{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.S3.V2006_03_01.CompleteMultipartUpload
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Completes a multipart upload by assembling previously uploaded parts.
module Network.AWS.S3.V2006_03_01.CompleteMultipartUpload
    (
    -- * Request
      CompleteMultipartUpload
    -- ** Request constructor
    , mkCompleteMultipartUpload
    -- ** Request lenses
    , cmuBucket
    , cmuKey
    , cmuMultipartUpload
    , cmuUploadId

    -- * Response
    , CompleteMultipartUploadResponse
    -- ** Response lenses
    , cmurLocation
    , cmurBucket
    , cmurKey
    , cmurExpiration
    , cmurETag
    , cmurServerSideEncryption
    , cmurVersionId
    ) where

import Network.AWS.Request.RestS3
import Network.AWS.S3.V2006_03_01.Types
import Network.AWS.Prelude
import Network.AWS.Types (Region)

data CompleteMultipartUpload = CompleteMultipartUpload
    { _cmuBucket :: BucketName
    , _cmuKey :: ObjectKey
    , _cmuMultipartUpload :: Maybe CompletedMultipartUpload
    , _cmuUploadId :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'CompleteMultipartUpload' request.
mkCompleteMultipartUpload :: BucketName -- ^ 'cmuBucket'
                          -> ObjectKey -- ^ 'cmuKey'
                          -> Text -- ^ 'cmuUploadId'
                          -> CompleteMultipartUpload
mkCompleteMultipartUpload p1 p2 p4 = CompleteMultipartUpload
    { _cmuBucket = p1
    , _cmuKey = p2
    , _cmuMultipartUpload = Nothing
    , _cmuUploadId = p4
    }

cmuBucket :: Lens' CompleteMultipartUpload BucketName
cmuBucket = lens _cmuBucket (\s a -> s { _cmuBucket = a })

cmuKey :: Lens' CompleteMultipartUpload ObjectKey
cmuKey = lens _cmuKey (\s a -> s { _cmuKey = a })

cmuMultipartUpload :: Lens' CompleteMultipartUpload (Maybe CompletedMultipartUpload)
cmuMultipartUpload =
    lens _cmuMultipartUpload (\s a -> s { _cmuMultipartUpload = a })

cmuUploadId :: Lens' CompleteMultipartUpload Text
cmuUploadId = lens _cmuUploadId (\s a -> s { _cmuUploadId = a })

instance ToPath CompleteMultipartUpload where
    toPath CompleteMultipartUpload{..} = mconcat
        [ "/"
        , toBS _cmuBucket
        , "/"
        , toBS _cmuKey
        ]

instance ToQuery CompleteMultipartUpload where
    toQuery CompleteMultipartUpload{..} = mconcat
        [ "uploadId" =? _cmuUploadId
        ]

instance ToHeaders CompleteMultipartUpload

instance ToBody CompleteMultipartUpload where
    toBody = toBody . encodeXML . _cmuMultipartUpload

data CompleteMultipartUploadResponse = CompleteMultipartUploadResponse
    { _cmurLocation :: Maybe Text
    , _cmurBucket :: Maybe BucketName
    , _cmurKey :: Maybe ObjectKey
    , _cmurExpiration :: Maybe RFC822
    , _cmurETag :: Maybe ETag
    , _cmurServerSideEncryption :: Maybe ServerSideEncryption
    , _cmurVersionId :: Maybe ObjectVersionId
    } deriving (Show, Generic)

cmurLocation :: Lens' CompleteMultipartUploadResponse (Maybe Text)
cmurLocation = lens _cmurLocation (\s a -> s { _cmurLocation = a })

cmurBucket :: Lens' CompleteMultipartUploadResponse (Maybe BucketName)
cmurBucket = lens _cmurBucket (\s a -> s { _cmurBucket = a })

cmurKey :: Lens' CompleteMultipartUploadResponse (Maybe ObjectKey)
cmurKey = lens _cmurKey (\s a -> s { _cmurKey = a })

-- | If the object expiration is configured, this will contain the expiration
-- date (expiry-date) and rule ID (rule-id). The value of rule-id is URL
-- encoded.
cmurExpiration :: Lens' CompleteMultipartUploadResponse (Maybe RFC822)
cmurExpiration = lens _cmurExpiration (\s a -> s { _cmurExpiration = a })

-- | Entity tag of the object.
cmurETag :: Lens' CompleteMultipartUploadResponse (Maybe ETag)
cmurETag = lens _cmurETag (\s a -> s { _cmurETag = a })

-- | The Server-side encryption algorithm used when storing this object in S3.
cmurServerSideEncryption :: Lens' CompleteMultipartUploadResponse (Maybe ServerSideEncryption)
cmurServerSideEncryption =
    lens _cmurServerSideEncryption
         (\s a -> s { _cmurServerSideEncryption = a })

-- | Version of the object.
cmurVersionId :: Lens' CompleteMultipartUploadResponse (Maybe ObjectVersionId)
cmurVersionId = lens _cmurVersionId (\s a -> s { _cmurVersionId = a })

instance AWSRequest CompleteMultipartUpload where
    type Sv CompleteMultipartUpload = S3
    type Rs CompleteMultipartUpload = CompleteMultipartUploadResponse

    request = post
    response _ = cursorResponse $ \hs xml ->
        pure CompleteMultipartUploadResponse
            <*> xml %|? "Location"
            <*> xml %|? "BucketName"
            <*> xml %|? "ObjectKey"
            <*> hs ~:? "x-amz-expiration"
            <*> xml %|? "ETag"
            <*> hs ~:? "x-amz-server-side-encryption"
            <*> hs ~:? "x-amz-version-id"
