@{
	'{organization}/{project}/_apis/git/pullrequests:get' = @{
		Synopsis = 'Retrieve all pull requests matching a specified criteria.'
		Parameters = @{
			'SearchCriteria.reviewerId' = @{
				Name = 'ReviewerID'
			}
			'SearchCriteria.includeLinks' = @{
				Name = 'IncludeLinks'
			}
			'SearchCriteria.creatorId' = @{
				Name = 'CreatorId'
			}
			'SearchCriteria.status' = @{
				Name = 'Status'
			}
			'SearchCriteria.targetRefName' = @{
				Name = 'TargetRefName'
			}
			'SearchCriteria.repositoryId' = @{
				Name = 'RepositoryId'
			}
			'SearchCriteria.sourceRepositoryId' = @{
				Name = 'SourceRepositoryId'
			}
			'SearchCriteria.sourceRefName' = @{
				Name = 'SourceRefName'
			}
		}
	}
	'{organization}/{project}/_apis/git/repositories/{repositoryId}/items:get' = @{
		Synopsis = 'Get Item Metadata and/or Content for a collection of items.'
		Parameters = @{
			'VersionDescriptor.version' = @{
				Name = 'Version'
			}
			'VersionDescriptor.versionType' = @{
				Name = 'VersionType'
			}
			'VersionDescriptor.versionOptions' = @{
				Name = 'VersionOptions'
			}
		}
	}
	'{organization}/{project}/_apis/git/repositories/{repositoryId}/pullrequests:get' = @{
		Synopsis = 'Retrieve all pull requests matching a specified criteria.'
		Parameters = @{
			'SearchCriteria.reviewerId' = @{
				Name = 'ReviewerID'
			}
			'SearchCriteria.includeLinks' = @{
				Name = 'IncludeLinks'
			}
			'SearchCriteria.creatorId' = @{
				Name = 'CreatorId'
			}
			'SearchCriteria.status' = @{
				Name = 'Status'
			}
			'SearchCriteria.targetRefName' = @{
				Name = 'TargetRefName'
			}
			'SearchCriteria.repositoryId' = @{
				Name = 'SearchRepositoryId'
			}
			'SearchCriteria.sourceRepositoryId' = @{
				Name = 'SourceRepositoryId'
			}
			'SearchCriteria.sourceRefName' = @{
				Name = 'SourceRefName'
			}
		}
	}
	'{organization}/{project}/_apis/git/repositories/{repositoryId}/pushes:get' = @{
		Name = 'Get-AdsGitRepositoryPush'
		Synopsis = 'Retrieves pushes associated with the specified repository.'
		Parameters = @{
			'SearchCriteria.includeLinks' = @{
				Name = 'IncludeLinks'
			}
			'SearchCriteria.fromDate' = @{
				Name = 'FromDate'
			}
			'SearchCriteria.toDate' = @{
				Name = 'ToDate'
			}
			'SearchCriteria.pusherId' = @{
				Name = 'PusherId'
			}
			'SearchCriteria.refName' = @{
				Name = 'RefName'
			}
			'SearchCriteria.includeRefUpdates' = @{
				Name = 'SearchIncludeRefUpdates'
			}
		}
	}
	'{organization}/{project}/_apis/git/repositories/{repositoryId}/stats/branches:get' = @{
		Name = 'Get-AdsGitRepositoryBranchStatistics'
		Synopsis = 'Retrieve statistics about all branches within a repository.'
		Parameters = @{
			'BaseVersionDescriptor.version' = @{
				Name = 'Version'
			}
			'BaseVersionDescriptor.versionType' = @{
				Name = 'VersionType'
			}
			'BaseVersionDescriptor.versionOptions' = @{
				Name = 'VersionOptions'
			}
		}
		PssaRulesIgnored = @('PSUseSingularNouns')
	}
}