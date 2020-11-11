import React, { useContext } from 'react';
import { CheckboxContext } from '../../store/CheckboxStore';
console.log('CheckBox component');
export default function CheckBox({ name, issueId }) {
    const { checkState, dispatch } = useContext(CheckboxContext);
    const onClick = (e) => {
        const isChecked = e.target.checked.toString().toUpperCase();
        if (e.target.name === 'checkAll') {
            // useReduser -> type: check_all, issueid 다 넘겨줘야함 -> issueid 다 가져오기 -> issue store 만들어야함..?
            const type = 'CHECK_ALL_'.concat(isChecked);
        } else {
            const type = 'CHECK_ONE_'.concat(isChecked);
            dispatch({ type, issueId: e.target.value });
        }
    };
    return <input type="checkbox" name={name} value={issueId} onClick={onClick} />;
}

CheckBox.defaultProps = {
    name: 'checkRow',
};
