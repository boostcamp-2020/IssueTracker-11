import React, { useContext } from 'react';
import { CheckboxContext } from '../../store/CheckboxStore';
import { IssueContext } from '../../store/IssueStore';

export default function CheckBox({ name, issueId }) {
    const { checkState, dispatch } = useContext(CheckboxContext);
    const { issues } = useContext(IssueContext);
    const onClick = (e) => {
        const isChecked = e.target.checked.toString().toUpperCase();
        if (e.target.name === 'checkAll') {
            const type = 'CHECK_ALL_'.concat(isChecked);
            dispatch({ type, issueId: issues.data.map((issue) => issue.issue_id) });
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
