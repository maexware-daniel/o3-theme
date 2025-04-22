[{assign var="oSelections" value=$oSelectionList->getSelections()}]
[{if $oSelections}]
    <div class="dropDown">
        [{if !$blHideLabel}]
            <label class="form-label" for="formSelect">[{$oSelectionList->getLabel()}]</label>
        [{/if}]

        [{if $editable !== false}]
            <select id="formSelect" class="form-select" aria-label="[{$oSelectionList->getLabel()}]" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]">

                <option value="">
                    [{if $sFieldName == "sel"}]
                        [{oxmultilang ident="PLEASE_CHOOSE"}]
                    [{else}]
                        [{oxmultilang ident="CHOOSE_VARIANT"}]
                    [{/if}]
                </option>

                [{foreach from=$oSelections item=oSelection}]
                    <option [{if $oSelection->isActive()}]selected[{/if}] value="[{$oSelection->getValue()}]">
                        [{$oSelection->getName()}]
                    </option>
                [{/foreach}]
            </select>
        [{/if}]
    </div>
[{/if}]