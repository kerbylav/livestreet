{**
 * Выпадающий список
 *}

{extends file='forms/fields/form.field.base.tpl'}

{block name='field_holder' prepend}
    <select id="{if $sFieldId}{$sFieldId}{else}{$sFieldName}{/if}" name="{$sFieldName}" class="{if $sFieldClasses}{$sFieldClasses}{else}width-full{/if}" {$sFieldInputAttributes} {if $bFieldIsDisabled}disabled{/if}>
        {foreach $aFieldItems as $aItem}
            <option value="{$aItem.value}" {if $aItem.value == $sFieldSelectedValue}selected{/if}>{$aItem.text}</option>
        {/foreach}
    </select>
{/block}