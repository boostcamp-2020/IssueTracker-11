import React from 'react';

export default function CheckBox({ name }) {
    return <input type="checkbox" name="{{name}}" value="false" />;
}

CheckBox.defaultProps = {
    name: 'checkRow',
};
