{extends file='topics/topic_base.tpl'}


{block name='topic_content'}
	{if $bTopicList}
		{$oTopic->getTextShort()}
		
		{if $oTopic->getTextShort() != $oTopic->getText()}
			<br/>
			<a href="{$oTopic->getUrl()}#cut" title="{$aLang.topic_read_more}">
				{if $oTopic->getCutText()}
					{$oTopic->getCutText()}
				{else}
					{$aLang.topic_read_more}
				{/if}
			</a>
		{/if}
	{else}
		{$oTopic->getText()}
	{/if}
{/block}