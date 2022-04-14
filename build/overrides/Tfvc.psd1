@{
	'{organization}/{project}/_apis/tfvc/changesets:get' = @{
		Synopsis = 'Retrieve Tfvc Changesets'
		Description = 'Retrieve Tfvc Changesets'
		Parameters = @{
			'SearchCriteria.toDate' = @{
				Name = 'ToDate'
			}
			'SearchCriteria.toId' = @{
				Name = 'ToId'
			}
			'SearchCriteria.itemPath' = @{
				Name = 'ItemPath'
			}
			'SearchCriteria.includeLinks' = @{
				Name = 'IncludeLinks'
			}
			'SearchCriteria.fromId' = @{
				Name = 'FromId'
			}
			'SearchCriteria.fromDate' = @{
				Name = 'FromDate'
			}
			'SearchCriteria.author' = @{
				Name = 'Author'
			}
			'SearchCriteria.mappings' = @{
				Name = 'Mappings'
			}
			'SearchCriteria.followRenames' = @{
				Name = 'FollowRenames'
			}
		}
	}
	'{organization}/{project}/_apis/tfvc/items:get' = @{
		Synopsis = 'Get a list of Tfvc items'
		Parameters = @{
			'VersionDescriptor.version' = @{
				Name = 'Version'
			}
			'VersionDescriptor.versionType' = @{
				Name = 'VersionType'
			}
			'VersionDescriptor.versionOption' = @{
				Name = 'VersionOption'
			}
		}
	}
	'{organization}/{project}/_apis/tfvc/labels:get' = @{
		Synopsis = 'Get a collection of shallow label references.'
		Parameters = @{
			'RequestData.labelScope' = @{
				Name = 'LabelScope'
			}
			'RequestData.name' = @{
				Name = 'Name'
			}
			'RequestData.owner' = @{
				Name = 'Owner'
			}
			'RequestData.includeLinks' = @{
				Name = 'IncludeLinks'
			}
			'RequestData.maxItemCount' = @{
				Name = 'MaxItemCount'
			}
			'RequestData.itemLabelFilter' = @{
				Name = 'ItemLabelFilter'
			}
		}
	}
	'{organization}/_apis/tfvc/shelvesets:get' = @{
		Synopsis = 'Get a single deep shelveset.'
		Parameters = @{
			'RequestData.includeWorkItems' = @{
				Name = 'IncludeWorkItems'
			}
			'RequestData.maxCommentLength' = @{
				Name = 'MaxCommentLength'
			}
			'RequestData.name' = @{
				Name = 'Name'
			}
			'RequestData.owner' = @{
				Name = 'Owner'
			}
			'RequestData.includeLinks' = @{
				Name = 'IncludeLinks'
			}
			'RequestData.maxChangeCount' = @{
				Name = 'MaxChangeCount'
			}
			'RequestData.includeDetails' = @{
				Name = 'IncludeDetails'
			}
		}
	}
}