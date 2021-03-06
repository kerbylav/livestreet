{foreach $aUsersList as $oUser}
	{* TODO: Убрать костыль для блогов *}
	{if $oUser->getUser()}{$oUser = $oUser->getUser()}{/if}

	{$oSession = $oUser->getSession()}
	{$oUserNote = $oUser->getUserNote()}

	<li class="object-list-item">
		{* Аватар *}
		<a href="{$oUser->getUserWebPath()}">
			<img src="{$oUser->getProfileAvatarPath(100)}" width="100" height="100" alt="{$oUser->getLogin()}" class="object-list-item-image" />
		</a>

		{* Заголовок *}
		<h2 class="object-list-item-title">
			<a href="{$oUser->getUserWebPath()}">{$oUser->getDisplayName()}</a>
		</h2>

		{* Заметка *}
		{if $oUserNote}
			{include 'components/user_note/user_note.tpl' sClasses='js-user-note' oObject=$oUserNote iUserId=$oUser->getId()}
		{/if}

		{* Информация *}
		{if $oSession}
			{$sDateSessionLast={date_format date=$oSession->getDateLast() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}}
		{/if}
		{$aUserInfo = [
		[ 'label' => "{$aLang.user_date_last}:",
		'content' => ($oSession) ? $sDateSessionLast : '&mdash;' ],
		[ 'label' => "{$aLang.user_date_registration}:", 'content' => {date_format date=$oUser->getDateRegister() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"} ],
						[ 'label' => "{$aLang.vote.rating}:",            'content' => $oUser->getRating() ]
					]}

		{include 'components/info_list/info_list.tpl' aInfoList=$aUserInfo sInfoListClasses='object-list-item-info'}
	</li>
{/foreach}