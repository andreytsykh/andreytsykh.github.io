({
    /**
     * On initialization of this component, set the prechatFields attribute and render prechat fields.
     *
     * @param cmp - The component for this state.
     * @param evt - The Aura event.
     * @param hlp - The helper for this state.
     */

    onInit: function (cmp, evt, hlp) {
        var prechatFields = cmp.find("prechatAPI").getPrechatFields();
        var prechatFieldComponentsArray = hlp.getPrechatFieldAttributesArray(prechatFields);
        $A.createComponents(
            prechatFieldComponentsArray,
            function (components, status, errorMessage) {
                if (status === "SUCCESS") {
                    cmp.set("v.prechatFieldComponents", components);
                }
            }
        );
    },
    /**
     * Event which fires when start button is clicked in prechat.
     *
     * @param cmp - The component for this state.
     * @param evt - The Aura event.
     * @param hlp - The helper for this state.
     */
    handleStartButtonClick: function(cmp, evt, hlp) {
        hlp.onStartButtonClick(cmp);
    }
});