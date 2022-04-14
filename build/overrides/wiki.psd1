@{
	'{organization}/{project}/_apis/wiki/wikis/{wikiIdentifier}/pages:get' = @{
		Synopsis = 'Gets metadata or content of the wiki page for the provided path.'
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
	'{organization}/{project}/_apis/wiki/wikis/{wikiIdentifier}/attachments:put' = @{
		Synopsis = 'Creates an attachment in the wiki.'
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
	'{organization}/{project}/_apis/wiki/wikis/{wikiIdentifier}/pages:put' = @{
		Synopsis = 'Creates or edits a wiki page.'
		Parameters = @{
			'VersionDescriptor.version' = @{
				Name = 'FilterVersion'
			}
			'VersionDescriptor.versionType' = @{
				Name = 'VersionType'
			}
			'VersionDescriptor.versionOptions' = @{
				Name = 'VersionOptions'
			}
		}
	}
	'{organization}/{project}/_apis/wiki/wikis/{wikiIdentifier}/pages:delete' = @{
		Synopsis = 'Deletes a wiki page.'
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
	'{organization}/{project}/_apis/wiki/wikis/{wikiIdentifier}/pagemoves:post' = @{
		Name = 'Move-AdsWikiPage'
		Synopsis = 'Creates a page move operation that updates the path and order of the page'
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
	'{organization}/{project}/_apis/wiki/wikis/{wikiIdentifier}/pagesbatch:post' = @{
		Synopsis = 'Returns pageable list of Wiki Pages'
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
}