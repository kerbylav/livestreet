{**
 * Категории блогов
 *
 * @styles css/blocks.css
 *}

{extends file='blocks/block.aside.base.tpl'}

{block name='block_options'}
	{assign var='noBlockFooter' value=true}
	{assign var='noBlockNav' value=true}
{/block}

{block name='block_title'}{$aLang.block_category_blog}{/block}
{block name='block_type'}blog-categories{/block}

{block name='block_header_end'}
	{if $oUserCurrent and $oUserCurrent->isAdministrator()}
		<a href="{router page="admin"}blogcategory/" title="{$aLang.admin_list_blogcategory}" class="icon-cog blog-categories-admin"></a>
	{/if}
{/block}

{block name='block_content'}
	{if $aBlogCategories}
		<ul class="blog-category-list">
			<li {if !$oBlogCategoryCurrent}class="active"{/if}><a href="{router page='blogs'}">{$aLang.block_category_blog_all} ({$iCountBlogsAll})</a></li>
			{foreach from=$aBlogCategories item=oCategory}
				<li {if $oBlogCategoryCurrent and $oBlogCategoryCurrent->getId()==$oCategory->getId()}class="active"{/if}><a style="margin-left: {$oCategory->getLevel()*20}px;" href="{$oCategory->getUrlWeb()}">{$oCategory->getTitle()|escape:'html'} ({$oCategory->getCountBlogs()})</a></li>
			{/foreach}
        </ul>
    {else}
    	No categories {* TODO: Language *}
    {/if}
{/block}