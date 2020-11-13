import React, { useContext, useRef, useEffect } from 'react';
import { CheckboxContext } from '../../store/CheckboxStore';

export default function CheckBox({ name, issueId }) {
    const { dispatch } = useContext(CheckboxContext);
    const checkboxRef = useRef();
    useEffect(() => {
        dispatch({ type: 'INIT', data: checkboxRef.current });
    }, []);
    const onClick = (e) => {
        const isChecked = e.target.checked.toString().toUpperCase();
        if (e.target.name === 'checkAll') {
            const type = 'CHECK_ALL_'.concat(isChecked);
            dispatch({ type });
        } else {
            const type = 'CHECK_ONE_'.concat(isChecked);
            dispatch({ type, data: e.target.value });
        }
    };
    return <input type="checkbox" name={name} value={issueId} onClick={onClick} ref={checkboxRef} />;
}

CheckBox.defaultProps = {
    name: 'checkRow',
};
