/**
 * Created by Valera on 02.02.2018.
 */
({
    /**
     * Event which fires the function to start a chat request (by accessing the chat API
     component).
     *
     * @param cmp - The component for this state.
     */
    onStartButtonClick: function (cmp) {
        var prechatFieldComponents = cmp.find("prechatField");
        var apiNamesMap = this.createAPINamesMap(cmp.find("prechatAPI").getPrechatFields());
        var fields;
// Make an array of field objects for the library.
        fields = this.createFieldsArray(apiNamesMap, prechatFieldComponents);
        for (var i = 0; i < fields.length; i++) {
            console.log('Label : ' + fields[0].label + '; Value : ' + fields[0].value + '; Class : ' + fields[0].class);
        }

        console.log('Cookies found' + document.cookie.match(/JSESSIONID=[^;]+/));
        // var strCookies = document.cookie;
        // var cookiearray = strCookies.split(';')
        // for(var i=0; i<cookiearray.length; i++){
        //     var name = cookiearray[i].split('=')[0];
        //     var value = cookiearray[i].split('=')[1];
        //     if(name == 'sid')
        //         console.log('Before : ##########');
        //         var sid = value;
        //         console.log('SID : --->>>>' + sid.toString());
        // }

// If the prechat fields pass validation, start a chat.
        if (cmp.find("prechatAPI").validateFields(fields).valid) {
            cmp.find("prechatAPI").startChat(fields);

            /**
             *
             *
             *
             */

        } else {
            console.warn("Prechat fields did not pass validation!");
        }
    },
    /**
     * Create an array of field objects to start a chat from an array of prechat fields.
     *
     * @param fields - Array of prechat field Objects.
     * @returns An array of field objects.
     */
    createFieldsArray: function (apiNames, fieldCmps) {
        if (fieldCmps.length) {
            return fieldCmps.map(function (fieldCmp) {
                return {
                    label: fieldCmp.get("v.label"),
                    value: fieldCmp.get("v.value"),
                    name: apiNames[fieldCmp.get("v.label")]
                };
            }.bind(this));
        } else {
            return [];
        }
    },
    /**
     * Create map of field label to field API name from the pre-chat fields array.
     *
     * @param fields - Array of prechat field Objects.
     * @returns An array of field objects.
     */
    createAPINamesMap: function (fields) {
        var values = {};
        fields.forEach(function (field) {
            values[field.label] = field.name;
        });
        return values;
    },
    /**
     * Create an array in the format $A.createComponents expects.
     *
     * Example:
     * [["componentType", {attributeName: "attributeValue", ...}]]
     *
     * @param prechatFields - Array of prechat field Objects.
     * @returns Array that can be passed to $A.createComponents
     */
    getPrechatFieldAttributesArray: function (prechatFields) {
        var prechatFieldsInfoArray = [];
        prechatFields.forEach(function (field) {
            var componentName = (field.type === "inputSplitName") ? "inputText" : field.type;
            var componentInfoArray = ["ui:" + componentName];
            var attributes = {
                "aura:id": "prechatField",
                required: field.required,
                label: field.label,
                disabled: field.readOnly,
                maxlength: field.maxLength,
                class: field.className,
                value: field.value
            };
            if (field.type === "inputSelect" && field.picklistOptions)
                attributes.options = field.picklistOptions;
            componentInfoArray.push(attributes);
            prechatFieldsInfoArray.push(componentInfoArray);
        });
        return prechatFieldsInfoArray;
    }
});