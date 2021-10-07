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
-- Module      : Network.AWS.Batch.Types.ContainerProperties
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.Batch.Types.ContainerProperties where

import Network.AWS.Batch.Types.FargatePlatformConfiguration
import Network.AWS.Batch.Types.KeyValuePair
import Network.AWS.Batch.Types.LinuxParameters
import Network.AWS.Batch.Types.LogConfiguration
import Network.AWS.Batch.Types.MountPoint
import Network.AWS.Batch.Types.NetworkConfiguration
import Network.AWS.Batch.Types.ResourceRequirement
import Network.AWS.Batch.Types.Secret
import Network.AWS.Batch.Types.Ulimit
import Network.AWS.Batch.Types.Volume
import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude

-- | Container properties are used in job definitions to describe the
-- container that\'s launched as part of a job.
--
-- /See:/ 'newContainerProperties' smart constructor.
data ContainerProperties = ContainerProperties'
  { -- | Linux-specific modifications that are applied to the container, such as
    -- details for device mappings.
    linuxParameters :: Prelude.Maybe LinuxParameters,
    -- | This parameter indicates the memory hard limit (in MiB) for a container.
    -- If your container attempts to exceed the specified number, it\'s
    -- terminated. You must specify at least 4 MiB of memory for a job using
    -- this parameter. The memory hard limit can be specified in several
    -- places. It must be specified for each node at least once.
    --
    -- This parameter maps to @Memory@ in the
    -- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
    -- section of the
    -- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
    -- @--memory@ option to
    -- <https://docs.docker.com/engine/reference/run/ docker run>.
    --
    -- This parameter is supported on EC2 resources but isn\'t supported on
    -- Fargate resources. For Fargate resources, you should specify the memory
    -- requirement using @resourceRequirement@. You can also do this for EC2
    -- resources.
    --
    -- If you\'re trying to maximize your resource utilization by providing
    -- your jobs as much memory as possible for a particular instance type, see
    -- <https://docs.aws.amazon.com/batch/latest/userguide/memory-management.html Memory Management>
    -- in the /Batch User Guide/.
    memory :: Prelude.Maybe Prelude.Int,
    -- | The instance type to use for a multi-node parallel job. All node groups
    -- in a multi-node parallel job must use the same instance type.
    --
    -- This parameter isn\'t applicable to single-node container jobs or jobs
    -- that run on Fargate resources, and shouldn\'t be provided.
    instanceType :: Prelude.Maybe Prelude.Text,
    -- | The user name to use inside the container. This parameter maps to @User@
    -- in the
    -- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
    -- section of the
    -- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
    -- @--user@ option to
    -- <https://docs.docker.com/engine/reference/run/ docker run>.
    user :: Prelude.Maybe Prelude.Text,
    -- | The network configuration for jobs that are running on Fargate
    -- resources. Jobs that are running on EC2 resources must not specify this
    -- parameter.
    networkConfiguration :: Prelude.Maybe NetworkConfiguration,
    -- | When this parameter is true, the container is given elevated permissions
    -- on the host container instance (similar to the @root@ user). This
    -- parameter maps to @Privileged@ in the
    -- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
    -- section of the
    -- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
    -- @--privileged@ option to
    -- <https://docs.docker.com/engine/reference/run/ docker run>. The default
    -- value is false.
    --
    -- This parameter isn\'t applicable to jobs that are running on Fargate
    -- resources and shouldn\'t be provided, or specified as false.
    privileged :: Prelude.Maybe Prelude.Bool,
    -- | A list of data volumes used in a job.
    volumes :: Prelude.Maybe [Volume],
    -- | The number of vCPUs reserved for the job. Each vCPU is equivalent to
    -- 1,024 CPU shares. This parameter maps to @CpuShares@ in the
    -- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
    -- section of the
    -- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
    -- @--cpu-shares@ option to
    -- <https://docs.docker.com/engine/reference/run/ docker run>. The number
    -- of vCPUs must be specified but can be specified in several places. You
    -- must specify it at least once for each node.
    --
    -- This parameter is supported on EC2 resources but isn\'t supported for
    -- jobs that run on Fargate resources. For these resources, use
    -- @resourceRequirement@ instead. You can use this parameter or
    -- @resourceRequirements@ structure but not both.
    --
    -- This parameter isn\'t applicable to jobs that are running on Fargate
    -- resources and shouldn\'t be provided. For jobs that run on Fargate
    -- resources, you must specify the vCPU requirement for the job using
    -- @resourceRequirements@.
    vcpus :: Prelude.Maybe Prelude.Int,
    -- | The Amazon Resource Name (ARN) of the execution role that Batch can
    -- assume. For jobs that run on Fargate resources, you must provide an
    -- execution role. For more information, see
    -- <https://docs.aws.amazon.com/batch/latest/userguide/execution-IAM-role.html Batch execution IAM role>
    -- in the /Batch User Guide/.
    executionRoleArn :: Prelude.Maybe Prelude.Text,
    -- | The environment variables to pass to a container. This parameter maps to
    -- @Env@ in the
    -- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
    -- section of the
    -- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
    -- @--env@ option to
    -- <https://docs.docker.com/engine/reference/run/ docker run>.
    --
    -- We don\'t recommend using plaintext environment variables for sensitive
    -- information, such as credential data.
    --
    -- Environment variables must not start with @AWS_BATCH@; this naming
    -- convention is reserved for variables that are set by the Batch service.
    environment :: Prelude.Maybe [KeyValuePair],
    -- | The platform configuration for jobs that are running on Fargate
    -- resources. Jobs that are running on EC2 resources must not specify this
    -- parameter.
    fargatePlatformConfiguration :: Prelude.Maybe FargatePlatformConfiguration,
    -- | The secrets for the container. For more information, see
    -- <https://docs.aws.amazon.com/batch/latest/userguide/specifying-sensitive-data.html Specifying sensitive data>
    -- in the /Batch User Guide/.
    secrets :: Prelude.Maybe [Secret],
    -- | The mount points for data volumes in your container. This parameter maps
    -- to @Volumes@ in the
    -- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
    -- section of the
    -- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
    -- @--volume@ option to
    -- <https://docs.docker.com/engine/reference/run/ docker run>.
    mountPoints :: Prelude.Maybe [MountPoint],
    -- | The command that\'s passed to the container. This parameter maps to
    -- @Cmd@ in the
    -- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
    -- section of the
    -- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
    -- @COMMAND@ parameter to
    -- <https://docs.docker.com/engine/reference/run/ docker run>. For more
    -- information, see
    -- <https://docs.docker.com/engine/reference/builder/#cmd>.
    command :: Prelude.Maybe [Prelude.Text],
    -- | The image used to start a container. This string is passed directly to
    -- the Docker daemon. Images in the Docker Hub registry are available by
    -- default. Other repositories are specified with
    -- @ repository-url\/image:tag @. Up to 255 letters (uppercase and
    -- lowercase), numbers, hyphens, underscores, colons, periods, forward
    -- slashes, and number signs are allowed. This parameter maps to @Image@ in
    -- the
    -- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
    -- section of the
    -- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
    -- @IMAGE@ parameter of
    -- <https://docs.docker.com/engine/reference/run/ docker run>.
    --
    -- Docker image architecture must match the processor architecture of the
    -- compute resources that they\'re scheduled on. For example, ARM-based
    -- Docker images can only run on ARM-based compute resources.
    --
    -- -   Images in Amazon ECR repositories use the full registry and
    --     repository URI (for example,
    --     @012345678910.dkr.ecr.\<region-name>.amazonaws.com\/\<repository-name>@).
    --
    -- -   Images in official repositories on Docker Hub use a single name (for
    --     example, @ubuntu@ or @mongo@).
    --
    -- -   Images in other repositories on Docker Hub are qualified with an
    --     organization name (for example, @amazon\/amazon-ecs-agent@).
    --
    -- -   Images in other online repositories are qualified further by a
    --     domain name (for example, @quay.io\/assemblyline\/ubuntu@).
    image :: Prelude.Maybe Prelude.Text,
    -- | The log configuration specification for the container.
    --
    -- This parameter maps to @LogConfig@ in the
    -- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
    -- section of the
    -- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
    -- @--log-driver@ option to
    -- <https://docs.docker.com/engine/reference/run/ docker run>. By default,
    -- containers use the same logging driver that the Docker daemon uses.
    -- However the container might use a different logging driver than the
    -- Docker daemon by specifying a log driver with this parameter in the
    -- container definition. To use a different logging driver for a container,
    -- the log system must be configured properly on the container instance (or
    -- on a different log server for remote logging options). For more
    -- information on the options for different supported log drivers, see
    -- <https://docs.docker.com/engine/admin/logging/overview/ Configure logging drivers>
    -- in the Docker documentation.
    --
    -- Batch currently supports a subset of the logging drivers available to
    -- the Docker daemon (shown in the LogConfiguration data type).
    --
    -- This parameter requires version 1.18 of the Docker Remote API or greater
    -- on your container instance. To check the Docker Remote API version on
    -- your container instance, log into your container instance and run the
    -- following command: @sudo docker version | grep \"Server API version\"@
    --
    -- The Amazon ECS container agent running on a container instance must
    -- register the logging drivers available on that instance with the
    -- @ECS_AVAILABLE_LOGGING_DRIVERS@ environment variable before containers
    -- placed on that instance can use these log configuration options. For
    -- more information, see
    -- <https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html Amazon ECS Container Agent Configuration>
    -- in the /Amazon Elastic Container Service Developer Guide/.
    logConfiguration :: Prelude.Maybe LogConfiguration,
    -- | The type and amount of resources to assign to a container. The supported
    -- resources include @GPU@, @MEMORY@, and @VCPU@.
    resourceRequirements :: Prelude.Maybe [ResourceRequirement],
    -- | The Amazon Resource Name (ARN) of the IAM role that the container can
    -- assume for Amazon Web Services permissions. For more information, see
    -- <https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html IAM Roles for Tasks>
    -- in the /Amazon Elastic Container Service Developer Guide/.
    jobRoleArn :: Prelude.Maybe Prelude.Text,
    -- | A list of @ulimits@ to set in the container. This parameter maps to
    -- @Ulimits@ in the
    -- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
    -- section of the
    -- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
    -- @--ulimit@ option to
    -- <https://docs.docker.com/engine/reference/run/ docker run>.
    --
    -- This parameter isn\'t applicable to jobs that are running on Fargate
    -- resources and shouldn\'t be provided.
    ulimits :: Prelude.Maybe [Ulimit],
    -- | When this parameter is true, the container is given read-only access to
    -- its root file system. This parameter maps to @ReadonlyRootfs@ in the
    -- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
    -- section of the
    -- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
    -- @--read-only@ option to @docker run@.
    readonlyRootFilesystem :: Prelude.Maybe Prelude.Bool
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ContainerProperties' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'linuxParameters', 'containerProperties_linuxParameters' - Linux-specific modifications that are applied to the container, such as
-- details for device mappings.
--
-- 'memory', 'containerProperties_memory' - This parameter indicates the memory hard limit (in MiB) for a container.
-- If your container attempts to exceed the specified number, it\'s
-- terminated. You must specify at least 4 MiB of memory for a job using
-- this parameter. The memory hard limit can be specified in several
-- places. It must be specified for each node at least once.
--
-- This parameter maps to @Memory@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--memory@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>.
--
-- This parameter is supported on EC2 resources but isn\'t supported on
-- Fargate resources. For Fargate resources, you should specify the memory
-- requirement using @resourceRequirement@. You can also do this for EC2
-- resources.
--
-- If you\'re trying to maximize your resource utilization by providing
-- your jobs as much memory as possible for a particular instance type, see
-- <https://docs.aws.amazon.com/batch/latest/userguide/memory-management.html Memory Management>
-- in the /Batch User Guide/.
--
-- 'instanceType', 'containerProperties_instanceType' - The instance type to use for a multi-node parallel job. All node groups
-- in a multi-node parallel job must use the same instance type.
--
-- This parameter isn\'t applicable to single-node container jobs or jobs
-- that run on Fargate resources, and shouldn\'t be provided.
--
-- 'user', 'containerProperties_user' - The user name to use inside the container. This parameter maps to @User@
-- in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--user@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>.
--
-- 'networkConfiguration', 'containerProperties_networkConfiguration' - The network configuration for jobs that are running on Fargate
-- resources. Jobs that are running on EC2 resources must not specify this
-- parameter.
--
-- 'privileged', 'containerProperties_privileged' - When this parameter is true, the container is given elevated permissions
-- on the host container instance (similar to the @root@ user). This
-- parameter maps to @Privileged@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--privileged@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>. The default
-- value is false.
--
-- This parameter isn\'t applicable to jobs that are running on Fargate
-- resources and shouldn\'t be provided, or specified as false.
--
-- 'volumes', 'containerProperties_volumes' - A list of data volumes used in a job.
--
-- 'vcpus', 'containerProperties_vcpus' - The number of vCPUs reserved for the job. Each vCPU is equivalent to
-- 1,024 CPU shares. This parameter maps to @CpuShares@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--cpu-shares@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>. The number
-- of vCPUs must be specified but can be specified in several places. You
-- must specify it at least once for each node.
--
-- This parameter is supported on EC2 resources but isn\'t supported for
-- jobs that run on Fargate resources. For these resources, use
-- @resourceRequirement@ instead. You can use this parameter or
-- @resourceRequirements@ structure but not both.
--
-- This parameter isn\'t applicable to jobs that are running on Fargate
-- resources and shouldn\'t be provided. For jobs that run on Fargate
-- resources, you must specify the vCPU requirement for the job using
-- @resourceRequirements@.
--
-- 'executionRoleArn', 'containerProperties_executionRoleArn' - The Amazon Resource Name (ARN) of the execution role that Batch can
-- assume. For jobs that run on Fargate resources, you must provide an
-- execution role. For more information, see
-- <https://docs.aws.amazon.com/batch/latest/userguide/execution-IAM-role.html Batch execution IAM role>
-- in the /Batch User Guide/.
--
-- 'environment', 'containerProperties_environment' - The environment variables to pass to a container. This parameter maps to
-- @Env@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--env@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>.
--
-- We don\'t recommend using plaintext environment variables for sensitive
-- information, such as credential data.
--
-- Environment variables must not start with @AWS_BATCH@; this naming
-- convention is reserved for variables that are set by the Batch service.
--
-- 'fargatePlatformConfiguration', 'containerProperties_fargatePlatformConfiguration' - The platform configuration for jobs that are running on Fargate
-- resources. Jobs that are running on EC2 resources must not specify this
-- parameter.
--
-- 'secrets', 'containerProperties_secrets' - The secrets for the container. For more information, see
-- <https://docs.aws.amazon.com/batch/latest/userguide/specifying-sensitive-data.html Specifying sensitive data>
-- in the /Batch User Guide/.
--
-- 'mountPoints', 'containerProperties_mountPoints' - The mount points for data volumes in your container. This parameter maps
-- to @Volumes@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--volume@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>.
--
-- 'command', 'containerProperties_command' - The command that\'s passed to the container. This parameter maps to
-- @Cmd@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @COMMAND@ parameter to
-- <https://docs.docker.com/engine/reference/run/ docker run>. For more
-- information, see
-- <https://docs.docker.com/engine/reference/builder/#cmd>.
--
-- 'image', 'containerProperties_image' - The image used to start a container. This string is passed directly to
-- the Docker daemon. Images in the Docker Hub registry are available by
-- default. Other repositories are specified with
-- @ repository-url\/image:tag @. Up to 255 letters (uppercase and
-- lowercase), numbers, hyphens, underscores, colons, periods, forward
-- slashes, and number signs are allowed. This parameter maps to @Image@ in
-- the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @IMAGE@ parameter of
-- <https://docs.docker.com/engine/reference/run/ docker run>.
--
-- Docker image architecture must match the processor architecture of the
-- compute resources that they\'re scheduled on. For example, ARM-based
-- Docker images can only run on ARM-based compute resources.
--
-- -   Images in Amazon ECR repositories use the full registry and
--     repository URI (for example,
--     @012345678910.dkr.ecr.\<region-name>.amazonaws.com\/\<repository-name>@).
--
-- -   Images in official repositories on Docker Hub use a single name (for
--     example, @ubuntu@ or @mongo@).
--
-- -   Images in other repositories on Docker Hub are qualified with an
--     organization name (for example, @amazon\/amazon-ecs-agent@).
--
-- -   Images in other online repositories are qualified further by a
--     domain name (for example, @quay.io\/assemblyline\/ubuntu@).
--
-- 'logConfiguration', 'containerProperties_logConfiguration' - The log configuration specification for the container.
--
-- This parameter maps to @LogConfig@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--log-driver@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>. By default,
-- containers use the same logging driver that the Docker daemon uses.
-- However the container might use a different logging driver than the
-- Docker daemon by specifying a log driver with this parameter in the
-- container definition. To use a different logging driver for a container,
-- the log system must be configured properly on the container instance (or
-- on a different log server for remote logging options). For more
-- information on the options for different supported log drivers, see
-- <https://docs.docker.com/engine/admin/logging/overview/ Configure logging drivers>
-- in the Docker documentation.
--
-- Batch currently supports a subset of the logging drivers available to
-- the Docker daemon (shown in the LogConfiguration data type).
--
-- This parameter requires version 1.18 of the Docker Remote API or greater
-- on your container instance. To check the Docker Remote API version on
-- your container instance, log into your container instance and run the
-- following command: @sudo docker version | grep \"Server API version\"@
--
-- The Amazon ECS container agent running on a container instance must
-- register the logging drivers available on that instance with the
-- @ECS_AVAILABLE_LOGGING_DRIVERS@ environment variable before containers
-- placed on that instance can use these log configuration options. For
-- more information, see
-- <https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html Amazon ECS Container Agent Configuration>
-- in the /Amazon Elastic Container Service Developer Guide/.
--
-- 'resourceRequirements', 'containerProperties_resourceRequirements' - The type and amount of resources to assign to a container. The supported
-- resources include @GPU@, @MEMORY@, and @VCPU@.
--
-- 'jobRoleArn', 'containerProperties_jobRoleArn' - The Amazon Resource Name (ARN) of the IAM role that the container can
-- assume for Amazon Web Services permissions. For more information, see
-- <https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html IAM Roles for Tasks>
-- in the /Amazon Elastic Container Service Developer Guide/.
--
-- 'ulimits', 'containerProperties_ulimits' - A list of @ulimits@ to set in the container. This parameter maps to
-- @Ulimits@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--ulimit@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>.
--
-- This parameter isn\'t applicable to jobs that are running on Fargate
-- resources and shouldn\'t be provided.
--
-- 'readonlyRootFilesystem', 'containerProperties_readonlyRootFilesystem' - When this parameter is true, the container is given read-only access to
-- its root file system. This parameter maps to @ReadonlyRootfs@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--read-only@ option to @docker run@.
newContainerProperties ::
  ContainerProperties
newContainerProperties =
  ContainerProperties'
    { linuxParameters =
        Prelude.Nothing,
      memory = Prelude.Nothing,
      instanceType = Prelude.Nothing,
      user = Prelude.Nothing,
      networkConfiguration = Prelude.Nothing,
      privileged = Prelude.Nothing,
      volumes = Prelude.Nothing,
      vcpus = Prelude.Nothing,
      executionRoleArn = Prelude.Nothing,
      environment = Prelude.Nothing,
      fargatePlatformConfiguration = Prelude.Nothing,
      secrets = Prelude.Nothing,
      mountPoints = Prelude.Nothing,
      command = Prelude.Nothing,
      image = Prelude.Nothing,
      logConfiguration = Prelude.Nothing,
      resourceRequirements = Prelude.Nothing,
      jobRoleArn = Prelude.Nothing,
      ulimits = Prelude.Nothing,
      readonlyRootFilesystem = Prelude.Nothing
    }

-- | Linux-specific modifications that are applied to the container, such as
-- details for device mappings.
containerProperties_linuxParameters :: Lens.Lens' ContainerProperties (Prelude.Maybe LinuxParameters)
containerProperties_linuxParameters = Lens.lens (\ContainerProperties' {linuxParameters} -> linuxParameters) (\s@ContainerProperties' {} a -> s {linuxParameters = a} :: ContainerProperties)

-- | This parameter indicates the memory hard limit (in MiB) for a container.
-- If your container attempts to exceed the specified number, it\'s
-- terminated. You must specify at least 4 MiB of memory for a job using
-- this parameter. The memory hard limit can be specified in several
-- places. It must be specified for each node at least once.
--
-- This parameter maps to @Memory@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--memory@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>.
--
-- This parameter is supported on EC2 resources but isn\'t supported on
-- Fargate resources. For Fargate resources, you should specify the memory
-- requirement using @resourceRequirement@. You can also do this for EC2
-- resources.
--
-- If you\'re trying to maximize your resource utilization by providing
-- your jobs as much memory as possible for a particular instance type, see
-- <https://docs.aws.amazon.com/batch/latest/userguide/memory-management.html Memory Management>
-- in the /Batch User Guide/.
containerProperties_memory :: Lens.Lens' ContainerProperties (Prelude.Maybe Prelude.Int)
containerProperties_memory = Lens.lens (\ContainerProperties' {memory} -> memory) (\s@ContainerProperties' {} a -> s {memory = a} :: ContainerProperties)

-- | The instance type to use for a multi-node parallel job. All node groups
-- in a multi-node parallel job must use the same instance type.
--
-- This parameter isn\'t applicable to single-node container jobs or jobs
-- that run on Fargate resources, and shouldn\'t be provided.
containerProperties_instanceType :: Lens.Lens' ContainerProperties (Prelude.Maybe Prelude.Text)
containerProperties_instanceType = Lens.lens (\ContainerProperties' {instanceType} -> instanceType) (\s@ContainerProperties' {} a -> s {instanceType = a} :: ContainerProperties)

-- | The user name to use inside the container. This parameter maps to @User@
-- in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--user@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>.
containerProperties_user :: Lens.Lens' ContainerProperties (Prelude.Maybe Prelude.Text)
containerProperties_user = Lens.lens (\ContainerProperties' {user} -> user) (\s@ContainerProperties' {} a -> s {user = a} :: ContainerProperties)

-- | The network configuration for jobs that are running on Fargate
-- resources. Jobs that are running on EC2 resources must not specify this
-- parameter.
containerProperties_networkConfiguration :: Lens.Lens' ContainerProperties (Prelude.Maybe NetworkConfiguration)
containerProperties_networkConfiguration = Lens.lens (\ContainerProperties' {networkConfiguration} -> networkConfiguration) (\s@ContainerProperties' {} a -> s {networkConfiguration = a} :: ContainerProperties)

-- | When this parameter is true, the container is given elevated permissions
-- on the host container instance (similar to the @root@ user). This
-- parameter maps to @Privileged@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--privileged@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>. The default
-- value is false.
--
-- This parameter isn\'t applicable to jobs that are running on Fargate
-- resources and shouldn\'t be provided, or specified as false.
containerProperties_privileged :: Lens.Lens' ContainerProperties (Prelude.Maybe Prelude.Bool)
containerProperties_privileged = Lens.lens (\ContainerProperties' {privileged} -> privileged) (\s@ContainerProperties' {} a -> s {privileged = a} :: ContainerProperties)

-- | A list of data volumes used in a job.
containerProperties_volumes :: Lens.Lens' ContainerProperties (Prelude.Maybe [Volume])
containerProperties_volumes = Lens.lens (\ContainerProperties' {volumes} -> volumes) (\s@ContainerProperties' {} a -> s {volumes = a} :: ContainerProperties) Prelude.. Lens.mapping Lens._Coerce

-- | The number of vCPUs reserved for the job. Each vCPU is equivalent to
-- 1,024 CPU shares. This parameter maps to @CpuShares@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--cpu-shares@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>. The number
-- of vCPUs must be specified but can be specified in several places. You
-- must specify it at least once for each node.
--
-- This parameter is supported on EC2 resources but isn\'t supported for
-- jobs that run on Fargate resources. For these resources, use
-- @resourceRequirement@ instead. You can use this parameter or
-- @resourceRequirements@ structure but not both.
--
-- This parameter isn\'t applicable to jobs that are running on Fargate
-- resources and shouldn\'t be provided. For jobs that run on Fargate
-- resources, you must specify the vCPU requirement for the job using
-- @resourceRequirements@.
containerProperties_vcpus :: Lens.Lens' ContainerProperties (Prelude.Maybe Prelude.Int)
containerProperties_vcpus = Lens.lens (\ContainerProperties' {vcpus} -> vcpus) (\s@ContainerProperties' {} a -> s {vcpus = a} :: ContainerProperties)

-- | The Amazon Resource Name (ARN) of the execution role that Batch can
-- assume. For jobs that run on Fargate resources, you must provide an
-- execution role. For more information, see
-- <https://docs.aws.amazon.com/batch/latest/userguide/execution-IAM-role.html Batch execution IAM role>
-- in the /Batch User Guide/.
containerProperties_executionRoleArn :: Lens.Lens' ContainerProperties (Prelude.Maybe Prelude.Text)
containerProperties_executionRoleArn = Lens.lens (\ContainerProperties' {executionRoleArn} -> executionRoleArn) (\s@ContainerProperties' {} a -> s {executionRoleArn = a} :: ContainerProperties)

-- | The environment variables to pass to a container. This parameter maps to
-- @Env@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--env@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>.
--
-- We don\'t recommend using plaintext environment variables for sensitive
-- information, such as credential data.
--
-- Environment variables must not start with @AWS_BATCH@; this naming
-- convention is reserved for variables that are set by the Batch service.
containerProperties_environment :: Lens.Lens' ContainerProperties (Prelude.Maybe [KeyValuePair])
containerProperties_environment = Lens.lens (\ContainerProperties' {environment} -> environment) (\s@ContainerProperties' {} a -> s {environment = a} :: ContainerProperties) Prelude.. Lens.mapping Lens._Coerce

-- | The platform configuration for jobs that are running on Fargate
-- resources. Jobs that are running on EC2 resources must not specify this
-- parameter.
containerProperties_fargatePlatformConfiguration :: Lens.Lens' ContainerProperties (Prelude.Maybe FargatePlatformConfiguration)
containerProperties_fargatePlatformConfiguration = Lens.lens (\ContainerProperties' {fargatePlatformConfiguration} -> fargatePlatformConfiguration) (\s@ContainerProperties' {} a -> s {fargatePlatformConfiguration = a} :: ContainerProperties)

-- | The secrets for the container. For more information, see
-- <https://docs.aws.amazon.com/batch/latest/userguide/specifying-sensitive-data.html Specifying sensitive data>
-- in the /Batch User Guide/.
containerProperties_secrets :: Lens.Lens' ContainerProperties (Prelude.Maybe [Secret])
containerProperties_secrets = Lens.lens (\ContainerProperties' {secrets} -> secrets) (\s@ContainerProperties' {} a -> s {secrets = a} :: ContainerProperties) Prelude.. Lens.mapping Lens._Coerce

-- | The mount points for data volumes in your container. This parameter maps
-- to @Volumes@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--volume@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>.
containerProperties_mountPoints :: Lens.Lens' ContainerProperties (Prelude.Maybe [MountPoint])
containerProperties_mountPoints = Lens.lens (\ContainerProperties' {mountPoints} -> mountPoints) (\s@ContainerProperties' {} a -> s {mountPoints = a} :: ContainerProperties) Prelude.. Lens.mapping Lens._Coerce

-- | The command that\'s passed to the container. This parameter maps to
-- @Cmd@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @COMMAND@ parameter to
-- <https://docs.docker.com/engine/reference/run/ docker run>. For more
-- information, see
-- <https://docs.docker.com/engine/reference/builder/#cmd>.
containerProperties_command :: Lens.Lens' ContainerProperties (Prelude.Maybe [Prelude.Text])
containerProperties_command = Lens.lens (\ContainerProperties' {command} -> command) (\s@ContainerProperties' {} a -> s {command = a} :: ContainerProperties) Prelude.. Lens.mapping Lens._Coerce

-- | The image used to start a container. This string is passed directly to
-- the Docker daemon. Images in the Docker Hub registry are available by
-- default. Other repositories are specified with
-- @ repository-url\/image:tag @. Up to 255 letters (uppercase and
-- lowercase), numbers, hyphens, underscores, colons, periods, forward
-- slashes, and number signs are allowed. This parameter maps to @Image@ in
-- the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @IMAGE@ parameter of
-- <https://docs.docker.com/engine/reference/run/ docker run>.
--
-- Docker image architecture must match the processor architecture of the
-- compute resources that they\'re scheduled on. For example, ARM-based
-- Docker images can only run on ARM-based compute resources.
--
-- -   Images in Amazon ECR repositories use the full registry and
--     repository URI (for example,
--     @012345678910.dkr.ecr.\<region-name>.amazonaws.com\/\<repository-name>@).
--
-- -   Images in official repositories on Docker Hub use a single name (for
--     example, @ubuntu@ or @mongo@).
--
-- -   Images in other repositories on Docker Hub are qualified with an
--     organization name (for example, @amazon\/amazon-ecs-agent@).
--
-- -   Images in other online repositories are qualified further by a
--     domain name (for example, @quay.io\/assemblyline\/ubuntu@).
containerProperties_image :: Lens.Lens' ContainerProperties (Prelude.Maybe Prelude.Text)
containerProperties_image = Lens.lens (\ContainerProperties' {image} -> image) (\s@ContainerProperties' {} a -> s {image = a} :: ContainerProperties)

-- | The log configuration specification for the container.
--
-- This parameter maps to @LogConfig@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--log-driver@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>. By default,
-- containers use the same logging driver that the Docker daemon uses.
-- However the container might use a different logging driver than the
-- Docker daemon by specifying a log driver with this parameter in the
-- container definition. To use a different logging driver for a container,
-- the log system must be configured properly on the container instance (or
-- on a different log server for remote logging options). For more
-- information on the options for different supported log drivers, see
-- <https://docs.docker.com/engine/admin/logging/overview/ Configure logging drivers>
-- in the Docker documentation.
--
-- Batch currently supports a subset of the logging drivers available to
-- the Docker daemon (shown in the LogConfiguration data type).
--
-- This parameter requires version 1.18 of the Docker Remote API or greater
-- on your container instance. To check the Docker Remote API version on
-- your container instance, log into your container instance and run the
-- following command: @sudo docker version | grep \"Server API version\"@
--
-- The Amazon ECS container agent running on a container instance must
-- register the logging drivers available on that instance with the
-- @ECS_AVAILABLE_LOGGING_DRIVERS@ environment variable before containers
-- placed on that instance can use these log configuration options. For
-- more information, see
-- <https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html Amazon ECS Container Agent Configuration>
-- in the /Amazon Elastic Container Service Developer Guide/.
containerProperties_logConfiguration :: Lens.Lens' ContainerProperties (Prelude.Maybe LogConfiguration)
containerProperties_logConfiguration = Lens.lens (\ContainerProperties' {logConfiguration} -> logConfiguration) (\s@ContainerProperties' {} a -> s {logConfiguration = a} :: ContainerProperties)

-- | The type and amount of resources to assign to a container. The supported
-- resources include @GPU@, @MEMORY@, and @VCPU@.
containerProperties_resourceRequirements :: Lens.Lens' ContainerProperties (Prelude.Maybe [ResourceRequirement])
containerProperties_resourceRequirements = Lens.lens (\ContainerProperties' {resourceRequirements} -> resourceRequirements) (\s@ContainerProperties' {} a -> s {resourceRequirements = a} :: ContainerProperties) Prelude.. Lens.mapping Lens._Coerce

-- | The Amazon Resource Name (ARN) of the IAM role that the container can
-- assume for Amazon Web Services permissions. For more information, see
-- <https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html IAM Roles for Tasks>
-- in the /Amazon Elastic Container Service Developer Guide/.
containerProperties_jobRoleArn :: Lens.Lens' ContainerProperties (Prelude.Maybe Prelude.Text)
containerProperties_jobRoleArn = Lens.lens (\ContainerProperties' {jobRoleArn} -> jobRoleArn) (\s@ContainerProperties' {} a -> s {jobRoleArn = a} :: ContainerProperties)

-- | A list of @ulimits@ to set in the container. This parameter maps to
-- @Ulimits@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--ulimit@ option to
-- <https://docs.docker.com/engine/reference/run/ docker run>.
--
-- This parameter isn\'t applicable to jobs that are running on Fargate
-- resources and shouldn\'t be provided.
containerProperties_ulimits :: Lens.Lens' ContainerProperties (Prelude.Maybe [Ulimit])
containerProperties_ulimits = Lens.lens (\ContainerProperties' {ulimits} -> ulimits) (\s@ContainerProperties' {} a -> s {ulimits = a} :: ContainerProperties) Prelude.. Lens.mapping Lens._Coerce

-- | When this parameter is true, the container is given read-only access to
-- its root file system. This parameter maps to @ReadonlyRootfs@ in the
-- <https://docs.docker.com/engine/api/v1.23/#create-a-container Create a container>
-- section of the
-- <https://docs.docker.com/engine/api/v1.23/ Docker Remote API> and the
-- @--read-only@ option to @docker run@.
containerProperties_readonlyRootFilesystem :: Lens.Lens' ContainerProperties (Prelude.Maybe Prelude.Bool)
containerProperties_readonlyRootFilesystem = Lens.lens (\ContainerProperties' {readonlyRootFilesystem} -> readonlyRootFilesystem) (\s@ContainerProperties' {} a -> s {readonlyRootFilesystem = a} :: ContainerProperties)

instance Core.FromJSON ContainerProperties where
  parseJSON =
    Core.withObject
      "ContainerProperties"
      ( \x ->
          ContainerProperties'
            Prelude.<$> (x Core..:? "linuxParameters")
            Prelude.<*> (x Core..:? "memory")
            Prelude.<*> (x Core..:? "instanceType")
            Prelude.<*> (x Core..:? "user")
            Prelude.<*> (x Core..:? "networkConfiguration")
            Prelude.<*> (x Core..:? "privileged")
            Prelude.<*> (x Core..:? "volumes" Core..!= Prelude.mempty)
            Prelude.<*> (x Core..:? "vcpus")
            Prelude.<*> (x Core..:? "executionRoleArn")
            Prelude.<*> (x Core..:? "environment" Core..!= Prelude.mempty)
            Prelude.<*> (x Core..:? "fargatePlatformConfiguration")
            Prelude.<*> (x Core..:? "secrets" Core..!= Prelude.mempty)
            Prelude.<*> (x Core..:? "mountPoints" Core..!= Prelude.mempty)
            Prelude.<*> (x Core..:? "command" Core..!= Prelude.mempty)
            Prelude.<*> (x Core..:? "image")
            Prelude.<*> (x Core..:? "logConfiguration")
            Prelude.<*> ( x Core..:? "resourceRequirements"
                            Core..!= Prelude.mempty
                        )
            Prelude.<*> (x Core..:? "jobRoleArn")
            Prelude.<*> (x Core..:? "ulimits" Core..!= Prelude.mempty)
            Prelude.<*> (x Core..:? "readonlyRootFilesystem")
      )

instance Prelude.Hashable ContainerProperties

instance Prelude.NFData ContainerProperties

instance Core.ToJSON ContainerProperties where
  toJSON ContainerProperties' {..} =
    Core.object
      ( Prelude.catMaybes
          [ ("linuxParameters" Core..=)
              Prelude.<$> linuxParameters,
            ("memory" Core..=) Prelude.<$> memory,
            ("instanceType" Core..=) Prelude.<$> instanceType,
            ("user" Core..=) Prelude.<$> user,
            ("networkConfiguration" Core..=)
              Prelude.<$> networkConfiguration,
            ("privileged" Core..=) Prelude.<$> privileged,
            ("volumes" Core..=) Prelude.<$> volumes,
            ("vcpus" Core..=) Prelude.<$> vcpus,
            ("executionRoleArn" Core..=)
              Prelude.<$> executionRoleArn,
            ("environment" Core..=) Prelude.<$> environment,
            ("fargatePlatformConfiguration" Core..=)
              Prelude.<$> fargatePlatformConfiguration,
            ("secrets" Core..=) Prelude.<$> secrets,
            ("mountPoints" Core..=) Prelude.<$> mountPoints,
            ("command" Core..=) Prelude.<$> command,
            ("image" Core..=) Prelude.<$> image,
            ("logConfiguration" Core..=)
              Prelude.<$> logConfiguration,
            ("resourceRequirements" Core..=)
              Prelude.<$> resourceRequirements,
            ("jobRoleArn" Core..=) Prelude.<$> jobRoleArn,
            ("ulimits" Core..=) Prelude.<$> ulimits,
            ("readonlyRootFilesystem" Core..=)
              Prelude.<$> readonlyRootFilesystem
          ]
      )
