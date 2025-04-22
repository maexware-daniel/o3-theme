[{block name="account_delete_my_account_confirmation"}]
    <div
        class="modal fade"
        id="delete_my_account_confirmation"
        tabindex="-1"
        role="dialog"
        aria-labelledby="delete_my_account_modal_label"
        aria-hidden="true"
    >
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    [{block name="account_delete_my_account_confirmation_header_message"}]
                        <div class="modal-title fs-5">[{oxmultilang ident="DD_DELETE_MY_ACCOUNT_CONFIRMATION_QUESTION"}]</div>
                    [{/block}]
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            [{block name="account_delete_my_account_confirmation_warning_message"}]
                                <div class="alert alert-danger">
                                    [{oxmultilang ident="DD_DELETE_MY_ACCOUNT_WARNING"}]
                                </div>
                            [{/block}]
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    [{block name="account_delete_my_account_confirmation_form"}]
                        <form name="delete_my_account" action="[{$oViewConf->getSelfActionLink()}]" method="post" role="form">
                            <div class="d-none">
                                [{$oViewConf->getHiddenSid()}]
                                <input type="hidden" name="cl" value="account">
                                <input type="hidden" name="fnc" value="deleteAccount">
                            </div>
                            [{block name="account_delete_my_account_confirmation_form_button_set"}]
                                <button type="submit" class="btn btn-danger">
                                    [{oxmultilang ident="DD_DELETE_MY_ACCOUNT"}]
                                </button>
                                <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal" aria-label="Close">
                                    [{oxmultilang ident="DD_DELETE_MY_ACCOUNT_CANCEL"}]
                                </button>
                            [{/block}]
                        </form>
                    [{/block}]
                </div>
            </div>
        </div>
    </div>
[{/block}]
