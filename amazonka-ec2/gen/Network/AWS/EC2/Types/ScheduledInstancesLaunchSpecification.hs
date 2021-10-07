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
-- Module      : Network.AWS.EC2.Types.ScheduledInstancesLaunchSpecification
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.EC2.Types.ScheduledInstancesLaunchSpecification where

import qualified Network.AWS.Core as Core
import Network.AWS.EC2.Internal
import Network.AWS.EC2.Types.ScheduledInstancesBlockDeviceMapping
import Network.AWS.EC2.Types.ScheduledInstancesIamInstanceProfile
import Network.AWS.EC2.Types.ScheduledInstancesMonitoring
import Network.AWS.EC2.Types.ScheduledInstancesNetworkInterface
import Network.AWS.EC2.Types.ScheduledInstancesPlacement
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude

-- | Describes the launch specification for a Scheduled Instance.
--
-- If you are launching the Scheduled Instance in EC2-VPC, you must specify
-- the ID of the subnet. You can specify the subnet using either @SubnetId@
-- or @NetworkInterface@.
--
-- /See:/ 'newScheduledInstancesLaunchSpecification' smart constructor.
data ScheduledInstancesLaunchSpecification = ScheduledInstancesLaunchSpecification'
  { -- | The IDs of the security groups.
    securityGroupIds :: Prelude.Maybe [Prelude.Text],
    -- | Indicates whether the instances are optimized for EBS I\/O. This
    -- optimization provides dedicated throughput to Amazon EBS and an
    -- optimized configuration stack to provide optimal EBS I\/O performance.
    -- This optimization isn\'t available with all instance types. Additional
    -- usage charges apply when using an EBS-optimized instance.
    --
    -- Default: @false@
    ebsOptimized :: Prelude.Maybe Prelude.Bool,
    -- | The placement information.
    placement :: Prelude.Maybe ScheduledInstancesPlacement,
    -- | The base64-encoded MIME user data.
    userData :: Prelude.Maybe Prelude.Text,
    -- | The instance type.
    instanceType :: Prelude.Maybe Prelude.Text,
    -- | The ID of the RAM disk.
    ramdiskId :: Prelude.Maybe Prelude.Text,
    -- | The IAM instance profile.
    iamInstanceProfile :: Prelude.Maybe ScheduledInstancesIamInstanceProfile,
    -- | Enable or disable monitoring for the instances.
    monitoring :: Prelude.Maybe ScheduledInstancesMonitoring,
    -- | The block device mapping entries.
    blockDeviceMappings :: Prelude.Maybe [ScheduledInstancesBlockDeviceMapping],
    -- | The ID of the subnet in which to launch the instances.
    subnetId :: Prelude.Maybe Prelude.Text,
    -- | The ID of the kernel.
    kernelId :: Prelude.Maybe Prelude.Text,
    -- | The network interfaces.
    networkInterfaces :: Prelude.Maybe [ScheduledInstancesNetworkInterface],
    -- | The name of the key pair.
    keyName :: Prelude.Maybe Prelude.Text,
    -- | The ID of the Amazon Machine Image (AMI).
    imageId :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ScheduledInstancesLaunchSpecification' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'securityGroupIds', 'scheduledInstancesLaunchSpecification_securityGroupIds' - The IDs of the security groups.
--
-- 'ebsOptimized', 'scheduledInstancesLaunchSpecification_ebsOptimized' - Indicates whether the instances are optimized for EBS I\/O. This
-- optimization provides dedicated throughput to Amazon EBS and an
-- optimized configuration stack to provide optimal EBS I\/O performance.
-- This optimization isn\'t available with all instance types. Additional
-- usage charges apply when using an EBS-optimized instance.
--
-- Default: @false@
--
-- 'placement', 'scheduledInstancesLaunchSpecification_placement' - The placement information.
--
-- 'userData', 'scheduledInstancesLaunchSpecification_userData' - The base64-encoded MIME user data.
--
-- 'instanceType', 'scheduledInstancesLaunchSpecification_instanceType' - The instance type.
--
-- 'ramdiskId', 'scheduledInstancesLaunchSpecification_ramdiskId' - The ID of the RAM disk.
--
-- 'iamInstanceProfile', 'scheduledInstancesLaunchSpecification_iamInstanceProfile' - The IAM instance profile.
--
-- 'monitoring', 'scheduledInstancesLaunchSpecification_monitoring' - Enable or disable monitoring for the instances.
--
-- 'blockDeviceMappings', 'scheduledInstancesLaunchSpecification_blockDeviceMappings' - The block device mapping entries.
--
-- 'subnetId', 'scheduledInstancesLaunchSpecification_subnetId' - The ID of the subnet in which to launch the instances.
--
-- 'kernelId', 'scheduledInstancesLaunchSpecification_kernelId' - The ID of the kernel.
--
-- 'networkInterfaces', 'scheduledInstancesLaunchSpecification_networkInterfaces' - The network interfaces.
--
-- 'keyName', 'scheduledInstancesLaunchSpecification_keyName' - The name of the key pair.
--
-- 'imageId', 'scheduledInstancesLaunchSpecification_imageId' - The ID of the Amazon Machine Image (AMI).
newScheduledInstancesLaunchSpecification ::
  -- | 'imageId'
  Prelude.Text ->
  ScheduledInstancesLaunchSpecification
newScheduledInstancesLaunchSpecification pImageId_ =
  ScheduledInstancesLaunchSpecification'
    { securityGroupIds =
        Prelude.Nothing,
      ebsOptimized = Prelude.Nothing,
      placement = Prelude.Nothing,
      userData = Prelude.Nothing,
      instanceType = Prelude.Nothing,
      ramdiskId = Prelude.Nothing,
      iamInstanceProfile = Prelude.Nothing,
      monitoring = Prelude.Nothing,
      blockDeviceMappings =
        Prelude.Nothing,
      subnetId = Prelude.Nothing,
      kernelId = Prelude.Nothing,
      networkInterfaces = Prelude.Nothing,
      keyName = Prelude.Nothing,
      imageId = pImageId_
    }

-- | The IDs of the security groups.
scheduledInstancesLaunchSpecification_securityGroupIds :: Lens.Lens' ScheduledInstancesLaunchSpecification (Prelude.Maybe [Prelude.Text])
scheduledInstancesLaunchSpecification_securityGroupIds = Lens.lens (\ScheduledInstancesLaunchSpecification' {securityGroupIds} -> securityGroupIds) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {securityGroupIds = a} :: ScheduledInstancesLaunchSpecification) Prelude.. Lens.mapping Lens._Coerce

-- | Indicates whether the instances are optimized for EBS I\/O. This
-- optimization provides dedicated throughput to Amazon EBS and an
-- optimized configuration stack to provide optimal EBS I\/O performance.
-- This optimization isn\'t available with all instance types. Additional
-- usage charges apply when using an EBS-optimized instance.
--
-- Default: @false@
scheduledInstancesLaunchSpecification_ebsOptimized :: Lens.Lens' ScheduledInstancesLaunchSpecification (Prelude.Maybe Prelude.Bool)
scheduledInstancesLaunchSpecification_ebsOptimized = Lens.lens (\ScheduledInstancesLaunchSpecification' {ebsOptimized} -> ebsOptimized) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {ebsOptimized = a} :: ScheduledInstancesLaunchSpecification)

-- | The placement information.
scheduledInstancesLaunchSpecification_placement :: Lens.Lens' ScheduledInstancesLaunchSpecification (Prelude.Maybe ScheduledInstancesPlacement)
scheduledInstancesLaunchSpecification_placement = Lens.lens (\ScheduledInstancesLaunchSpecification' {placement} -> placement) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {placement = a} :: ScheduledInstancesLaunchSpecification)

-- | The base64-encoded MIME user data.
scheduledInstancesLaunchSpecification_userData :: Lens.Lens' ScheduledInstancesLaunchSpecification (Prelude.Maybe Prelude.Text)
scheduledInstancesLaunchSpecification_userData = Lens.lens (\ScheduledInstancesLaunchSpecification' {userData} -> userData) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {userData = a} :: ScheduledInstancesLaunchSpecification)

-- | The instance type.
scheduledInstancesLaunchSpecification_instanceType :: Lens.Lens' ScheduledInstancesLaunchSpecification (Prelude.Maybe Prelude.Text)
scheduledInstancesLaunchSpecification_instanceType = Lens.lens (\ScheduledInstancesLaunchSpecification' {instanceType} -> instanceType) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {instanceType = a} :: ScheduledInstancesLaunchSpecification)

-- | The ID of the RAM disk.
scheduledInstancesLaunchSpecification_ramdiskId :: Lens.Lens' ScheduledInstancesLaunchSpecification (Prelude.Maybe Prelude.Text)
scheduledInstancesLaunchSpecification_ramdiskId = Lens.lens (\ScheduledInstancesLaunchSpecification' {ramdiskId} -> ramdiskId) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {ramdiskId = a} :: ScheduledInstancesLaunchSpecification)

-- | The IAM instance profile.
scheduledInstancesLaunchSpecification_iamInstanceProfile :: Lens.Lens' ScheduledInstancesLaunchSpecification (Prelude.Maybe ScheduledInstancesIamInstanceProfile)
scheduledInstancesLaunchSpecification_iamInstanceProfile = Lens.lens (\ScheduledInstancesLaunchSpecification' {iamInstanceProfile} -> iamInstanceProfile) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {iamInstanceProfile = a} :: ScheduledInstancesLaunchSpecification)

-- | Enable or disable monitoring for the instances.
scheduledInstancesLaunchSpecification_monitoring :: Lens.Lens' ScheduledInstancesLaunchSpecification (Prelude.Maybe ScheduledInstancesMonitoring)
scheduledInstancesLaunchSpecification_monitoring = Lens.lens (\ScheduledInstancesLaunchSpecification' {monitoring} -> monitoring) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {monitoring = a} :: ScheduledInstancesLaunchSpecification)

-- | The block device mapping entries.
scheduledInstancesLaunchSpecification_blockDeviceMappings :: Lens.Lens' ScheduledInstancesLaunchSpecification (Prelude.Maybe [ScheduledInstancesBlockDeviceMapping])
scheduledInstancesLaunchSpecification_blockDeviceMappings = Lens.lens (\ScheduledInstancesLaunchSpecification' {blockDeviceMappings} -> blockDeviceMappings) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {blockDeviceMappings = a} :: ScheduledInstancesLaunchSpecification) Prelude.. Lens.mapping Lens._Coerce

-- | The ID of the subnet in which to launch the instances.
scheduledInstancesLaunchSpecification_subnetId :: Lens.Lens' ScheduledInstancesLaunchSpecification (Prelude.Maybe Prelude.Text)
scheduledInstancesLaunchSpecification_subnetId = Lens.lens (\ScheduledInstancesLaunchSpecification' {subnetId} -> subnetId) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {subnetId = a} :: ScheduledInstancesLaunchSpecification)

-- | The ID of the kernel.
scheduledInstancesLaunchSpecification_kernelId :: Lens.Lens' ScheduledInstancesLaunchSpecification (Prelude.Maybe Prelude.Text)
scheduledInstancesLaunchSpecification_kernelId = Lens.lens (\ScheduledInstancesLaunchSpecification' {kernelId} -> kernelId) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {kernelId = a} :: ScheduledInstancesLaunchSpecification)

-- | The network interfaces.
scheduledInstancesLaunchSpecification_networkInterfaces :: Lens.Lens' ScheduledInstancesLaunchSpecification (Prelude.Maybe [ScheduledInstancesNetworkInterface])
scheduledInstancesLaunchSpecification_networkInterfaces = Lens.lens (\ScheduledInstancesLaunchSpecification' {networkInterfaces} -> networkInterfaces) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {networkInterfaces = a} :: ScheduledInstancesLaunchSpecification) Prelude.. Lens.mapping Lens._Coerce

-- | The name of the key pair.
scheduledInstancesLaunchSpecification_keyName :: Lens.Lens' ScheduledInstancesLaunchSpecification (Prelude.Maybe Prelude.Text)
scheduledInstancesLaunchSpecification_keyName = Lens.lens (\ScheduledInstancesLaunchSpecification' {keyName} -> keyName) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {keyName = a} :: ScheduledInstancesLaunchSpecification)

-- | The ID of the Amazon Machine Image (AMI).
scheduledInstancesLaunchSpecification_imageId :: Lens.Lens' ScheduledInstancesLaunchSpecification Prelude.Text
scheduledInstancesLaunchSpecification_imageId = Lens.lens (\ScheduledInstancesLaunchSpecification' {imageId} -> imageId) (\s@ScheduledInstancesLaunchSpecification' {} a -> s {imageId = a} :: ScheduledInstancesLaunchSpecification)

instance
  Prelude.Hashable
    ScheduledInstancesLaunchSpecification

instance
  Prelude.NFData
    ScheduledInstancesLaunchSpecification

instance
  Core.ToQuery
    ScheduledInstancesLaunchSpecification
  where
  toQuery ScheduledInstancesLaunchSpecification' {..} =
    Prelude.mconcat
      [ Core.toQuery
          ( Core.toQueryList "SecurityGroupId"
              Prelude.<$> securityGroupIds
          ),
        "EbsOptimized" Core.=: ebsOptimized,
        "Placement" Core.=: placement,
        "UserData" Core.=: userData,
        "InstanceType" Core.=: instanceType,
        "RamdiskId" Core.=: ramdiskId,
        "IamInstanceProfile" Core.=: iamInstanceProfile,
        "Monitoring" Core.=: monitoring,
        Core.toQuery
          ( Core.toQueryList "BlockDeviceMapping"
              Prelude.<$> blockDeviceMappings
          ),
        "SubnetId" Core.=: subnetId,
        "KernelId" Core.=: kernelId,
        Core.toQuery
          ( Core.toQueryList "NetworkInterface"
              Prelude.<$> networkInterfaces
          ),
        "KeyName" Core.=: keyName,
        "ImageId" Core.=: imageId
      ]
