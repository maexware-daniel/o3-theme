[{block name="checkout_user_options"}]
	<div class="row">

		[{block name="checkout_options_login"}]
			[{include file="form/login.tpl"}]
		[{/block}]

		<div class="col-12 col-md-5 offset-md-1 offset-lg-2">
			[{block name="checkout_options_reg"}]

				<form action="[{$oViewConf->getSslSelfLink()}]" method="post" class="mb-5">

					<div class="d-none">
						[{$oViewConf->getHiddenSid()}]
						[{$oViewConf->getNavFormParams()}]
						<input type="hidden" name="cl" value="user">
						<input type="hidden" name="fnc" value="">
						<input type="hidden" name="option" value="3">
					</div>

					<h2 class="title-big">[{oxmultilang ident="OPEN_ACCOUNT"}]</h2>
					<p>[{oxmultilang ident="DD_LOGIN_ACCOUNT_PANEL_CREATE_BODY"}]</p>

					<button class="btn btn-primary" type="submit">[{oxmultilang ident="OPEN_ACCOUNT"}]</button>

					[{block name="checkout_options_reg_text"}]
					[{/block}]
				</form>

			[{/block}]

			[{block name="checkout_options_noreg"}]
				[{if $oView->getShowNoRegOption()}]

					<form action="[{$oViewConf->getSslSelfLink()}]" method="post">

						<div class="d-none">
							[{$oViewConf->getHiddenSid()}]
							[{$oViewConf->getNavFormParams()}]
							<input type="hidden" name="cl" value="user">
							<input type="hidden" name="fnc" value="">
							<input type="hidden" name="option" value="1">
						</div>

						[{block name="checkout_options_noreg_text"}]
							<h3 class="title-small">[{oxmultilang ident="DO_NOT_WANT_CREATE_ACCOUNT"}]</h3>
							[{if $oView->isDownloadableProductWarning()}]
								<p class="errorMsg">[{oxmultilang ident="MESSAGE_DOWNLOADABLE_PRODUCT"}]</p>
							[{/if}]
						[{/block}]

						<button class="btn btn-primary" type="submit">[{oxmultilang ident="NEXT"}]</button>

					</form>

				[{/if}]
			[{/block}]
		</div>
	</div>

[{/block}]
